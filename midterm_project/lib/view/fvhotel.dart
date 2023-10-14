import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/fvmodel.dart';

class FvHotelPage extends StatelessWidget {
  const FvHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Hotels')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 0),
          child: Consumer<FavoriteModel>(
            builder: (context, favoriteModel, child) => ListView.builder(
                itemCount: favoriteModel.favoriteHotels.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(favoriteModel.favoriteHotels[index].id.toString()),
                    onDismissed: (direction) {
                      favoriteModel.remove(favoriteModel.favoriteHotels[index]);
                    },
                    background :Container(color :Colors.red),
                    child: ListTile(
                      title: Text(
                        favoriteModel.favoriteHotels[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                      ),
                    ),
                  );
                }),
          ),
        ),
    );
  }
}
