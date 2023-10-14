import 'package:flutter/material.dart';

import '../model/hotel.dart';
import '../model/hotels_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isGridView = true; // true for GridView, false for ListView

  Future<void> _launchURL() async {
    final url = Uri(scheme: 'https', host: 'www.handong.edu');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  // TODO: Make a collection of cards (102)
  List<Widget> _buildGridCards(BuildContext context) {
    List<Hotel> hotels = HotelsRepository.loadHotels();

    if (hotels.isEmpty) {
      return const <Card>[];
    }

    // products 리스트의 각 요소에 대해 map() 함수를 실행
    return hotels.map((hotel) {
      // 각 product에 대해 아래의 코드 블록을 실행
      if (_isGridView) {
        // GridView card layout
        return Card(
          // clipBehavior 속성은 카드의 경계를 넘어가는 자식 위젯들이 어떻게 잘릴지 결정
          //  Clip.antiAlias는 경계를 부드럽게 만들어 줌
          clipBehavior: Clip.antiAlias,
          child: Column(
            // crossAxisAlignment 속성은 수직(열) 방향으로 어떻게 정렬할지 결정 (start -> 시작 위치에서 정렬)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // AspectRatio: 특정 비율(aspect ratio)을 유지하면서 그 안에 다른 위젯(여기서는 이미지)를 배치할 때 사용
              AspectRatio(
                aspectRatio: 18 / 11,
                child: Image.asset(
                  hotel.picture,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 17,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Hotel star rating with outlined stars
                                    Row(
                                      children: List<Widget>.generate(
                                          hotel.star,
                                          (index) => const Icon(Icons.star,
                                              color: Colors.yellow,
                                              size: 15.0)),
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                    const SizedBox(height: 2.0),

                                    Text(
                                      hotel.name,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 2.0),
                                    Text(
                                      hotel.location,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: hotel,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('more'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        // ListView card layout
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(3.0, 8.0, 3.0, 8.0),
            child: Stack(
              children: [
                ListTile(
                  leading: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      hotel.picture,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // title: Text(hotel.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: List<Widget>.generate(
                          hotel.star,
                          (index) => const Icon(Icons.star,
                              color: Colors.yellow, size: 15.0),
                        ),
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        hotel.name,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        hotel.location,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // Positioned 위젯은 Stack 내에서 절대 위치를 지정할 수 있습니다.
                  right: 2, // 오른쪽으로부터의 거리
                  bottom: 2, // 아래로부터의 거리
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail', arguments: hotel);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: (5), vertical: (2))),
                      minimumSize: MaterialStateProperty.all(Size.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('more', style: TextStyle(fontSize: 10)),
                  ),
                )
              ],
            ),
          ),
        );
      }
    }).toList();
  }

  String _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    String routeName = '';
    switch (index) {
      case 0:
        routeName = '/home';
        break;
      case 1:
        routeName = '/search';
        break;
      case 2:
        routeName = '/fvhotel';
        break;
      case 3:
        routeName = '/mypage';
        break;
      case 4:
        routeName = '/login';
        break;
    }
    return routeName;
  }

  // Drawer ListTile Function
  ListTile buildDrawerListTile(int index) {
    List<String> titles = [
      'Home',
      'Search',
      'Favorite Hotel',
      'My Page',
      'Log Out'
    ];
    List<IconData> icons = [
      Icons.home,
      Icons.search,
      Icons.location_city,
      Icons.person,
      Icons.logout
    ];

    return ListTile(
      leading: Icon(icons[index], color: Colors.blue),
      title: Text(titles[index]),
      selected: _selectedIndex == index,
      onTap: () {
        // Update the state of the app
        String routeName = _onItemTapped(index);
        // Then close the drawer
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        title: const Text('Main'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'language',
              color: Colors.white,
            ),
            onPressed: () {
              _launchURL();
            },
          )
        ],
      ),

      // TODO: Add a grid view (102)
      // GridView는 count() 생성자를 호출
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return _isGridView
                    ? GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        padding: const EdgeInsets.all(16.0),
                        childAspectRatio: .8,
                        crossAxisSpacing: .5,
                        mainAxisSpacing: .5,
                        children: _buildGridCards(context),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: _buildGridCards(context));
              },
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Pages',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                )),
            ...List.generate(5, buildDrawerListTile),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
