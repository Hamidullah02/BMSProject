import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ElementTab extends StatelessWidget {
  const ElementTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Superstructure'),
          const SizedBox(height: 16),
          _buildElementSection('Main Girder', '5'),
          _buildElementSection('Cross Beam', '5'),
          _buildElementSection('Deck Slab (Concrete)', 'RC 6'),
          _buildElementSection('Main Girder Hinge', 'Set in Shape Tab'),
          _buildElementSection('Stringer'),
          _buildElementSection('Main Truss'),
          _buildElementSection('Main Arch'),
          _buildElementSection('Outer Cable'),
          _buildElementSection('Main Tower'),
          _buildElementSection('Head Slab'),
          _buildElementSection('Lateral Bracing'),
          _buildElementSection('Deck Slab (PC)'),
          _buildElementSection('Deck Slab (Steel)'),
          _buildElementSection('Arch Rib'),
          _buildElementSection('Parapet Wall'),
          _buildElementSection('Main Girder (Concrete)'),
          _buildElementSection('Main Girder (Steel)'),
          _buildElementSection('Cross Beam (Concrete)', '5'),
          _buildElementSection('Cross Beam (Steel)', '5'),
          _buildElementSection('Cross Beam (PSB)', '5'),
          _buildElementSection('Strut'),
          _buildElementSection('Stiffening Girder'),
          _buildElementSection('Hanger'),
          _buildElementSection('Cross Beam (Arch)'),
          _buildElementSection('Arch Rib (Steel)'),
          _buildElementSection('Deck Slab (Wood)'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Substructure'),
          const SizedBox(height: 16),
          _buildElementSection('Pier', 'Select Element Type'),
          _buildElementSection('Abutment', 'Select Element Type 2'),
          _buildElementSection('Foundation', 'Select Element Type 2'),
          _buildElementSection('Wing Wall'),
          _buildElementSection('Footing'),
          _buildElementSection('Side Wall'),
          _buildElementSection('Spandrel Column'),
          _buildElementSection('Bearings'),
          _buildElementSection('Bearing Seat/Bed', '2'),
          _buildElementSection('Bearing (Rubber)', 'Rubber 2'),
          _buildElementSection('Bearing (Steel)', 'Select Element Type 2'),
          _buildElementSection('Anchor Bolts'),
          _buildElementSection('Shear Key (Metal)'),
          _buildElementSection('Shear Key (Concrete)'),
          _buildElementSection('Shock Transmission Unit'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Deck Surface'),
          _buildElementSection('Pavement', 'Asphalt 1'),
          _buildElementSection('Wheel Guard', '2'),
          _buildElementSection('Railing (Concrete)', 'Concrete 2'),
          _buildElementSection('Railing (Steel)', 'Select Element Type'),
          _buildElementSection('Curb'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Drainage System'),
          _buildElementSection('Drainage System', '1'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Inspection Facilities'),
          _buildElementSection('Inspection Facility', '1'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Utilities'),
          _buildElementSection('Utility Pipe'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Expansion Joint'),
          _buildElementSection('Expansion Joint (Steel)', 'Steel 2'),
          _buildElementSection('Expansion Joint (Rubber)', 'Select Element Type 2'),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Others'),
          _buildElementSection('Retaining Wall', '2'),
          _buildElementSection('Bridge Approaches', '2'),
          _buildElementSection('Road Sign', '1'),
          _buildElementSection('Lighting Facility'),
        ],
      ),
    );
  }

  Widget _buildElementSection(String elementName, [String? numbering]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          elementName + (numbering != null ? ' ($numbering)' : ''),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Material',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ['Concrete', 'Steel', 'Wood', 'Other']
                    .map((material) => DropdownMenuItem(
                  value: material,
                  child: Text(material),
                ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Quantity',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
