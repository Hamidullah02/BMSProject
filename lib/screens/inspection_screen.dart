import 'package:construction/widgets/channel_widget.dart';
import 'package:construction/widgets/physical_properties_widget.dart';
import 'package:construction/widgets/search_inventory_id_widget.dart';
import 'package:construction/widgets/traffic_load_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({Key? key}) : super(key: key);

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E40AF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabs(),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height -
                  (kToolbarHeight + kTextTabBarHeight),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        inventoryId(),
                        PhysicalCharacteristicsTab(),
                        TrafficLoadingTab(),
                        ChannelRiverTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E40AF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMapSection(),
          const SizedBox(height: 24),
          const Text(
            'Structure ID: 658802007028',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 4),
          const Text(
            'Chainage: 10420',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on, color: Colors.white70, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'SYLHET',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF1E40AF),
        unselectedLabelColor: const Color(0xFF64748B),
        indicatorColor: const Color(0xFF1E40AF),
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: 'Identification'),
          Tab(text: 'Physical'),
          Tab(text: 'Traffic'),
          Tab(text: 'Channel'),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(24.6, 91),  // Set center to the location of your marker
          zoom: 13.0,  // Fixed zoom level
          minZoom: 10.0,
          // maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(24.6, 91),  // Marker location
                width: 80.0,
                height: 80.0,
                builder: (context) => const Icon(
                  Icons.location_pin,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}


