import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../model/fvmodel.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // Rect getClip(Size size) {
  //   return const Rect.fromLTWH(0, 0, 200, 100);
  // }

  @override
  Widget build(BuildContext context) {
    Widget profile = Column(
      children: [
        /*2*/
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: const Text(
            'MA SEOK JAE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '21800239',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    );

    Widget myfvhotel = Consumer<FavoriteModel>(
      builder: (context, favoriteModel, child) => ListView.separated(
        padding: const EdgeInsets.all(30),
        itemCount: favoriteModel.favoriteHotels.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                // Navigate to the detail page of the hotel
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: favoriteModel.favoriteHotels[index],
                );
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    favoriteModel.favoriteHotels[index].picture,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favoriteModel.favoriteHotels[index].name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Location :' +
                              favoriteModel.favoriteHotels[index].location,
                          style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Page'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ClipOval(
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              profile,
              Expanded(child: myfvhotel),
            ],
          ),
        ));
  }
}
