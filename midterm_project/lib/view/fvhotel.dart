import 'package:flutter/material.dart';


class FvHotelPage extends StatefulWidget {
  const FvHotelPage({Key? key}) : super(key: key);

  @override
    _FvHotelPageState createState() => _FvHotelPageState();
}

class _FvHotelPageState extends State<FvHotelPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: const Text('FavoriteHotel Page'),),
   );
  }
}