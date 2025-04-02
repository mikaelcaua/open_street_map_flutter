import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/viewmodels/home_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => HomeViewModel()..initCurrentLocation(),
      child: const OpenStreetMapApp(),
    ),
  );
}

