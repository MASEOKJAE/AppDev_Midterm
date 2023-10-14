// favorite_model.dart

import 'package:flutter/foundation.dart';
import '../model/hotel.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Hotel> _favoriteHotels = [];

  List<Hotel> get favoriteHotels => _favoriteHotels;

  void add(Hotel hotel) {
    _favoriteHotels.add(hotel);
    notifyListeners();
  }

  void remove(Hotel hotel) {
    _favoriteHotels.remove(hotel);
    notifyListeners();
  }
}
