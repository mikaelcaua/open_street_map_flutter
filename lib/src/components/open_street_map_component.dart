import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/named_marker_model.dart';
import 'dialogs_marker_component.dart';
import 'marker_component.dart';

class OpenStreetMapComponent extends StatefulWidget {
  final List<NamedMarkerModel> namedMarkers;
  final LatLng? currentLocation;


  const OpenStreetMapComponent({
    super.key,
    required this.namedMarkers,
    required this.currentLocation,
  });

  @override
  State<OpenStreetMapComponent> createState() => _OpenStreetMapComponentState();
}

class _OpenStreetMapComponentState extends State<OpenStreetMapComponent> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    if (widget.currentLocation == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: widget.currentLocation!,
        initialZoom: 17,
        minZoom: 0,
        maxZoom: 100,
        onTap: (tapPosition, latlng) async {
          final newMarker =
              await DialogsMarkerComponent.showAddMarkerDialog(context, latlng);
          if (newMarker != null) {
            setState(() {
              widget.namedMarkers.add(newMarker);
            });
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: widget.namedMarkers
              .map(
                (namedMarker) => Marker(
                  point: namedMarker.point,
                  width: 300,
                  height: 80,
                  child: MarkerComponent(
                    namedMarkerModel: namedMarker,
                    refresh: () => setState(() {}),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
