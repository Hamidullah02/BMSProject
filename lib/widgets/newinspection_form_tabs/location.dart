import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';


class LocationTab extends StatelessWidget {
  const LocationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Location'),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '1. Zone',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Dhaka', 'Chittagong', 'Rajshahi', 'Khulna', 'Barisal', 'Sylhet', 'Rangpur', 'Mymensingh']
                .map((zone) => DropdownMenuItem(
              value: zone,
              child: Text(zone),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '2. Circle',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Circle 1', 'Circle 2', 'Circle 3']
                .map((circle) => DropdownMenuItem(
              value: circle,
              child: Text(circle),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '3. Division',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Dhaka', 'Chittagong', 'Rajshahi', 'Khulna', 'Barisal', 'Sylhet', 'Rangpur', 'Mymensingh']
                .map((division) => DropdownMenuItem(
              value: division,
              child: Text(division),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '4. Sub Division',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Sub Division 1', 'Sub Division 2', 'Sub Division 3']
                .map((subDivision) => DropdownMenuItem(
              value: subDivision,
              child: Text(subDivision),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '5. SAE',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '6. District',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '7. Upazilla',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '8. Union',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '9. Village',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '10. Country',
          ),
          const SizedBox(height: 24),
          const SectionHeader(title: '11. GPS Coordinates'),
          const SizedBox(height: 16),
          Row(
            children: [
              const SectionHeader(title: '11. GPS Coordinates'),
              const SizedBox(height: 16),
              Expanded(
                child: CustomTextField(
                  label: 'Lat (Degree)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomTextField(
                  label: 'Lat (Minute)',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomTextField(
                  label: 'Lat (Second)',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: 'Longitude (Degree)',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '12. Reference Level',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

