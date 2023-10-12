import 'hotel.dart';

class HotelsRepository {
  static List<Hotel> loadHotels() {
    const allHotels = <Hotel>[
      Hotel(
        id: 0,
        star: 3,
        name: 'Polonia hotel',
        location: 'al. Jerozolimskie 45, 00-692 Warszawa,',
        number: '+48 22 318 28 00',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
      Hotel(
        id: 1,
        star: 3,
        name: 'Gyeongju Hilton',
        location: '484-7, Bomun-ro, Gyeongju, 38117, South Korea,',
        number: '+82 54-745-7788',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
      Hotel(
        id: 2,
        star: 4,
        name: 'The Westin Grand Berlin',
        location: 'Friedrichstraße 158-164, 10117 Berlin,',
        number: '+49 30 20270',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
      Hotel(
        id: 3,
        star: 3,
        name: 'Marina Bay Sands Hotel',
        location: '10 Bayfront Ave, Singapore 018956,',
        number: '+65 6688 8868',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
      Hotel(
        id: 4,
        star: 4,
        name: 'Carlton hotel',
        location: '76 Bras Basah Road, City Hall, Singapore,',
        number: '+65 6338 8333',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
      Hotel(
        id: 5,
        star: 3,
        name: 'Park REGIS',
        location: '23 Merchant Rd, Singapore 058268,',
        number: '+65 6818 8888',
        intro: 'Hotel Polonia offers all the facilities vou would expect from a 3 star hotel in Krakow: restaurant, room service, bar, front desk open 24 hours, laundry, TV. Located in the south east of Krakow. on Basztowa 25. 6 minutes by car from the hotel. Polonia Hotel Room is ALL DOUBLE'
      ),
    ];
    return allHotels;
  }
}