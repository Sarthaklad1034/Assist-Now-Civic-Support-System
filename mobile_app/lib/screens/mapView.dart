import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../providers/reportProvider.dart';

class mapView extends StatefulWidget {
  const mapView({super.key});

  @override
  State<mapView> createState() => _mapViewState();
}

class _mapViewState extends State<mapView> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final p = context.watch<reportProvider>();

    // Current location from provider
    final (lat, lng) = p.giveLocation();
    final LatLng target = LatLng(lat ?? 19.0760, lng ?? 72.8777); // default Mumbai

    return Scaffold(
      appBar: AppBar(title: const Text('Map View')),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: target,
          initialZoom: 16.0,
        ),
        children: [
          // OpenStreetMap tiles
          // TileLayer(
          //   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //   userAgentPackageName: 'com.example.mobile_app',
          // ),
          TileLayer(
            urlTemplate: "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
            userAgentPackageName: "com.cityissues.app",
          ),

          // Markers layer
          MarkerLayer(markers: _buildMarkers(p, target)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mapController.move(target, 16.0),
        child: const Icon(Icons.my_location),
      ),
    );
  }

  List<Marker> _buildMarkers(reportProvider p, LatLng currentTarget) {
    final markers = <Marker>[];

    // Current location marker
    markers.add(
      Marker(
        width: 24.0,
        height: 24.0,
        point: currentTarget,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5)],
          ),
        ),
      ),
    );

    // Issue markers (only when lat/lng available)
    for (final issue in p.issues) {
      final ilat = issue.lat;
      final ilng = issue.lng;
      if (ilat == null || ilng == null) continue;

      final id = issue.description?.trim().isNotEmpty == true
          ? issue.description!.trim()
          : 'issue_${ilat}_${ilng}';

      markers.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: LatLng(ilat, ilng),
          child: GestureDetector(
            onTap: () => _showIssueInfo(context, issue),
            child: const Icon(Icons.location_on, color: Colors.red, size: 32),
          ),
        ),
      );
    }

    return markers;
  }

  void _showIssueInfo(BuildContext context, dynamic issue) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(issue.category ?? 'Issue', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(issue.description ?? 'No description'),
              const SizedBox(height: 12),
              Text('Lat: ${issue.lat?.toStringAsFixed(6) ?? '-'}'),
              Text('Lng: ${issue.lng?.toStringAsFixed(6) ?? '-'}'),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
