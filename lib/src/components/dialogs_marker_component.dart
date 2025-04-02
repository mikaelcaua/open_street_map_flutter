import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../models/named_marker_model.dart';
import '../viewmodels/home_view_model.dart';

class DialogsMarkerComponent {
  static Future<NamedMarkerModel?> showAddMarkerDialog(
      BuildContext context, LatLng latlng) async {
    final TextEditingController nameController = TextEditingController();

    return await showDialog<NamedMarkerModel>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adicionar Marcador"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Nome do marcador",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text.trim();
                if (name.isNotEmpty) {
                  Navigator.of(context)
                      .pop(NamedMarkerModel(point: latlng, name: name));
                } else {
                  Navigator.of(context).pop(null);
                }
              },
              child: const Text("Adicionar"),
            ),
          ],
        );
      },
    );
  }

  static Future<String?> showEditMarkerDialog(
      BuildContext context, NamedMarkerModel marker) async {
    final TextEditingController nameController =
        TextEditingController(text: marker.name);

    return await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Editar Marcador"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Nome do marcador",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .removeMarker(marker);
                Navigator.of(context).pop(null);
              },
              child: const Text("Remover"),
            ),
            TextButton(
              onPressed: () {
                final newName = nameController.text.trim();
                if (newName.isNotEmpty) {
                  Navigator.of(context).pop(newName);
                } else {
                  Navigator.of(context).pop(null);
                }
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }
}
