import 'package:flutter/material.dart';
import '../models/named_marker_model.dart';
import 'dialogs_marker_component.dart';

class MarkerComponent extends StatelessWidget {
  final NamedMarkerModel namedMarkerModel;
  final VoidCallback refresh;

  const MarkerComponent({
    super.key,
    required this.namedMarkerModel,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final newName =
            await DialogsMarkerComponent.showEditMarkerDialog(context, namedMarkerModel);
        if (newName != null) {
          namedMarkerModel.name = newName;
          refresh();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_on,
            color: Color.fromRGBO(8, 46, 94,1),
            size: 40,
          ),
          Container(
            color: Color.fromRGBO(227, 181, 0,1),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              namedMarkerModel.name,
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
