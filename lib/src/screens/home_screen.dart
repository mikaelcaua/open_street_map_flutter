import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/open_street_map_component.dart';
import '../viewmodels/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 46, 94, 1),
        centerTitle: true,
        title: const Text(
          'Safezone App',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return OpenStreetMapComponent(
            namedMarkers: viewModel.namedMarkers,
            currentLocation: viewModel.currentLocation,
          );
        },
      ),
    );
  }
}
