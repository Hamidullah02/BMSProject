import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ShapeTab extends StatelessWidget {
  const ShapeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(fields.length, (index) {
          final field = fields[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomTextField(
              label: '${index + 1}. ${field['label']}',
              keyboardType: field['keyboardType'],
            ),
          );
        }),
      ),
    );
  }
}

final List<Map<String, dynamic>> fields = [
  {'label': 'Bridge Length (m)', 'keyboardType': TextInputType.number},
  {'label': 'Bridge Width (m)', 'keyboardType': TextInputType.number},
  {'label': 'Bridge Effective Width (m)', 'keyboardType': TextInputType.number},
  {'label': 'No. of Span', 'keyboardType': TextInputType.number},
  {'label': 'Input Span Length (m)', 'keyboardType': TextInputType.number},
  {'label': 'Span Arrangement', 'keyboardType': TextInputType.text},
  {'label': 'No. of Column', 'keyboardType': TextInputType.number},
  {'label': 'Column Width (m)', 'keyboardType': TextInputType.number},
  {'label': 'Height of Abutment (m)', 'keyboardType': TextInputType.number},
  {'label': 'Skew Angle Degree', 'keyboardType': TextInputType.number},
  {'label': 'Median (m)', 'keyboardType': TextInputType.number},
  {'label': 'Wheel Guard -L (m)', 'keyboardType': TextInputType.number},
  {'label': 'Wheel Guard -R (m)', 'keyboardType': TextInputType.number},
  {'label': 'Carriage way-L (m)', 'keyboardType': TextInputType.number},
  {'label': 'Carriage way-R (m)', 'keyboardType': TextInputType.number},
  {'label': 'Lanes On Structure', 'keyboardType': TextInputType.number},
  {'label': 'No. of Sidewalk', 'keyboardType': TextInputType.number},
  {'label': 'Sidewalk-L (m)', 'keyboardType': TextInputType.number},
  {'label': 'Sidewalk-R (m)', 'keyboardType': TextInputType.number},
  {'label': 'No. of Main Girder of Girder Bridge', 'keyboardType': TextInputType.number},
  {'label': 'Interval of Main Girders (m)', 'keyboardType': TextInputType.number},
  {'label': 'Height of Main Girder (m)', 'keyboardType': TextInputType.number},
  {'label': 'Width of Side Wall (m)', 'keyboardType': TextInputType.number},
  {'label': 'Depth of Head Slab (m)', 'keyboardType': TextInputType.number},
  {'label': 'Width of Main Girder (m)', 'keyboardType': TextInputType.number},
  {'label': 'No. of Lines of Cross Beam', 'keyboardType': TextInputType.number},
  {'label': 'No. of Stringer', 'keyboardType': TextInputType.number},
  {'label': 'No. of Hinge', 'keyboardType': TextInputType.number},
  {'label': 'No. of Bearings per each line', 'keyboardType': TextInputType.number},
  {'label': 'No. of lines of Lateral Bracing', 'keyboardType': TextInputType.number},
];
