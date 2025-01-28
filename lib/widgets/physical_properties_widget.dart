import 'package:flutter/material.dart';

class PhysicalCharacteristicsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Super-structure Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Color(0xFFE2E8F0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDetailRow('Width', '4.5'),
                  _buildDetailRow('Bracing', 'Concrete'),
                  _buildDetailRow('Carriageway Width (m)', '3.8'),
                  _buildDetailRow('Source of Electricity', 'REB'),
                  _buildDetailRow('Wearing Course', 'Bitumen'),
                  _buildDetailRow('Bank To Bank Distance(m)', '30.0'),
                  _buildDetailRow('Sidewalk (L/S) (m)', '0.0'),
                  _buildDetailRow('Sidewalk (R/S) (m)', '0.0'),
                  _buildDetailRow('Railing Type', 'RCC Railing [Bar & Post]'),
                  _buildDetailRow('No. of Light Posts (L/S)', '0'),
                  _buildDetailRow('No. of Light Posts (R/S)', '0'),
                  _buildDetailRow('Tie/Hanger', 'Nil'),
                  _buildDetailRow('Bearing Pad', '0'),
                  _buildDetailRow('Bearing Type', 'N/A'),
                  _buildDetailRow('Total No of Span', '0'),
                  _buildDetailRow('Total Length', '30.0'),
                  _buildDetailRow('No of Similar Span', '3'),
                  _buildDetailRow('Length of Each Similar Span(m)', '10.0'),
                  _buildDetailRow('No of Slab Each Span', '1'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E40AF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Update Details'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 14,
              ),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}