import 'package:construction/widgets/newinspection_form_tabs/basic_info.dart';
import 'package:construction/widgets/newinspection_form_tabs/elements.dart';
import 'package:construction/widgets/newinspection_form_tabs/location.dart';
import 'package:construction/widgets/newinspection_form_tabs/pictures.dart';
import 'package:construction/widgets/newinspection_form_tabs/road.dart';
import 'package:construction/widgets/newinspection_form_tabs/shape.dart';
import 'package:flutter/material.dart';

class NewInspectionScreen extends StatefulWidget {
  const NewInspectionScreen({Key? key}) : super(key: key);

  @override
  _NewInspectionScreenState createState() => _NewInspectionScreenState();
}

class _NewInspectionScreenState extends State<NewInspectionScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEdited = false;
  double _currentStep = 0;

  final List<IconData> _icons = [
    Icons.location_on_outlined,
    Icons.info_outline,
    Icons.architecture,
    Icons.add_road_outlined,
    Icons.construction,
    Icons.photo_library_outlined,
  ];

  final List<Widget> _tabs = const [
    LocationTab(),
    BasicInfoTab(),
    ShapeTab(),
    RoadTab(),
    ElementTab(),
    PicturesTab(),
  ];

  Future<bool> _onWillPop() async {
    if (!_isEdited) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard Changes?', style: TextStyle(fontWeight: FontWeight.w600)),
        content: const Text('You have unsaved changes. Do you want to discard them?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Discard')),
        ],
      ),
    );

    return result ?? false;
  }

  void _changeStep(double step) {
    if (step != _currentStep) {
      setState(() {
        _currentStep = step;
      });
    }
  }

  bool _validateAndProceed() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _currentStep = (_currentStep + 1).clamp(0, _icons.length - 1);
      });
      return true;
    }
    return false;
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Slider(
            value: _currentStep,
            min: 0,
            max: (_icons.length - 1).toDouble(),
            divisions: _icons.length - 1,
            onChanged: _changeStep,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              _icons.length,
                  (index) => GestureDetector(
                onTap: () => _changeStep(index.toDouble()),
                child: CircleAvatar(
                  radius: 15,
                  child: Icon(
                    _icons[index],
                    size: 20,
                    color: _currentStep.toInt() == index ? Colors.white : Colors.grey,
                  ),
                  backgroundColor: _currentStep.toInt() == index ? Colors.blue : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentStep > 0)
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _currentStep = (_currentStep - 1).clamp(0, _icons.length - 1);
                });
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Previous'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black87,
              ),
            )
          else
            const SizedBox.shrink(),
          if (_currentStep < _icons.length - 1)
            ElevatedButton.icon(
              onPressed: _validateAndProceed,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
            )
          else
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Saving Inspection...')),
                  );
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Save Inspection'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Bridge Inspection', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        body: Column(
          children: [
            _buildSlider(),
            Expanded(
              child: Form(
                key: _formKey,
                onChanged: () {
                  if (!_isEdited) setState(() => _isEdited = true);
                },
                child: _tabs[_currentStep.toInt()],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }
}
