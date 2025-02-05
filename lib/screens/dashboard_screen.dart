import 'package:construction/screens/add_new_inspection_screen.dart';
import 'package:construction/screens/search_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text("Quick Stats"),
            ),
            _buildQuickStats(context),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text("Quick Action"),
            ),
            _buildQuickActions(context),
            _buildRecentInspections(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        margin: EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(''),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Culbul Pande',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Inspector',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildStatCard(
              context, 'Completed', '0', Icons.check_circle, Colors.green),
          const SizedBox(width: 16),
          _buildStatCard(context, 'Draft', '0', Icons.edit_note, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value,
      IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildActionCard(
          " New Inspection",
          Icons.search,
          Colors.blue,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewInspectionScreen()),
            );
          },
        ),
        _buildActionCard(
          'Search Structure',
          Icons.search,
          Colors.green,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
        ),
        _buildActionCard(
          'View Reports',
          Icons.bar_chart,
          Colors.orange,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
        _buildActionCard(
          'Download Data',
          Icons.download,
          Colors.purple,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionCard(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentInspections(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Inspections',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: const Text(
                    'random location',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Road code: 00011100'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
