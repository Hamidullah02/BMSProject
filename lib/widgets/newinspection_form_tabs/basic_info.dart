import 'package:construction/widgets/textfield.dart';
import 'package:flutter/material.dart';


class BasicInfoTab extends StatelessWidget {
  const BasicInfoTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Basic Information'),
          const SizedBox(height: 16),
          CustomTextField(
            label: '1.Bridge Number',
            required: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Bridge number is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '2.Bridge Name',
            required: true,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '3.Bridge Type',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['RC Girder Bridge', 'Steel Bridge', 'Box Culvert']
                .map((type) => DropdownMenuItem(
              value: type,
              child: Text(type),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: '4. Completion Year',
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: 'Source',
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          CustomTextField(
            label: '5.Reconstruction Year',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '6.Design Standard',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['AASHTO', 'Eurocode', 'Other']
                .map((standard) => DropdownMenuItem(
              value: standard,
              child: Text(standard),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),

          CustomTextField(
            label: '7.Design Load (ton)',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: '8.Load Restriction (ton)',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '9.Crossing and Public Utilities',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['None', 'Water', 'Gas', 'Electricity', 'Telecom']
                .map((utility) => DropdownMenuItem(
              value: utility,
              child: Text(utility),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '10.Condition Under Bridge',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['Channel', 'Road', 'Railway']
                .map((condition) => DropdownMenuItem(
              value: condition,
              child: Text(condition),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: '11.Bridge Owner',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: ['RHD', 'LGED', 'City Corporation']
                .map((owner) => DropdownMenuItem(
              value: owner,
              child: Text(owner),
            ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          TextField(

            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
        ],
      ),
    );
  }
}

