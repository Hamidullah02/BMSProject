import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RoadTab extends StatelessWidget {
  const RoadTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Road Information'),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '1. Road Class',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['National Highway', 'Regional Highway', 'Zila Road']
                .map((type) => DropdownMenuItem(
              value: type,
              child: Text(type),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '2. Road No.',
            required: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '3. Road Name',
            required: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '4. LRP Name',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '5. New LRP Name',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '6. Offset of LRP',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '7. Chainage (km)',
            keyboardType: TextInputType.number,
            required: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '8. Number of Lanes',
            keyboardType: TextInputType.number,
            required: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '9. Approach Road Width',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '10. Detour/Alternate Route',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Yes', 'No']
                .map((option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '11. Traffic Volume',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Under 1,000', '1,000 to 5,000', '5,000 to 10,000', 'Over 10,000']
                .map((volume) => DropdownMenuItem(
              value: volume,
              child: Text(volume),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '12. Heavy Vehicle Traffic Rate (%)',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '13. Census Year',
            keyboardType: TextInputType.number,
            maxLength: 4,
          ),
        ],
      ),
    );
  }
}