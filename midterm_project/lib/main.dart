import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'app.dart';
import 'model/fvmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteModel(),
      child: const ShrineApp(),
    ),
  );
}
