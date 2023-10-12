import 'package:flutter/material.dart';

import '../model/hotel.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
      ),
    );
  }
}