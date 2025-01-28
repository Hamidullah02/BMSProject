import 'package:construction/screens/inspection_screen.dart';
import 'package:flutter/material.dart';
import '../models/location_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  String? _selectedDivision;
  String? _selectedRegion;
  String? _selectedDistrict;
  String? _selectedUpazila;
  String? _selectedRoadType;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E40AF),
        title: const Text('Search Structure', style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'With Structure ID'),
            Tab(text: 'Without Structure ID'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWithStructureIDTab(),
          _buildWithoutStructureIDTab(),
        ],
      ),
    );
  }

  Widget _buildWithStructureIDTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Structure ID',
                hintText: 'Enter Structure ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Structure ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InspectionScreen(),
                    ),
                  );
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E40AF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Search', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWithoutStructureIDTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDropdown('Select Division', LocationData.divisions, _selectedDivision, (value) => setState(() => _selectedDivision = value)),
          const SizedBox(height: 16),
          _buildDropdown('Select Region', LocationData.regions, _selectedRegion, (value) => setState(() => _selectedRegion = value)),
          const SizedBox(height: 16),
          _buildDropdown('Select Districts', LocationData.districts, _selectedDistrict, (value) => setState(() => _selectedDistrict = value)),
          const SizedBox(height: 16),
          _buildDropdown('Select Upazila', LocationData.upazilas, _selectedUpazila, (value) => setState(() => _selectedUpazila = value)),
          const SizedBox(height: 24),
          const Text(
            'Road Type',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 8),
          _buildRoadTypeGrid(),
          const SizedBox(height: 16),
          _buildDropdown('Select Road', ['Road 1', 'Road 2', 'Road 3'], null, (value) {}),
          const SizedBox(height: 16),
          _buildDropdown('Select Chainage', ['0-100', '101-200', '201-300'], null, (value) {}),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InspectionScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E40AF),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Search', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              // Download road
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFF1E40AF)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Download Road', style: TextStyle(fontSize: 16, color: Color(0xFF1E40AF))),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue, void Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildRoadTypeGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: LocationData.roadTypes.map((type) {
        return InkWell(
          onTap: () {
            setState(() => _selectedRoadType = type);
          },
          child: Container(
            decoration: BoxDecoration(
              color: _selectedRoadType == type ? const Color(0xFF1E40AF) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            alignment: Alignment.center,
            child: Text(
              type,
              style: TextStyle(
                color: _selectedRoadType == type ? Colors.white : const Color(0xFF1E293B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}