import 'package:flutter/material.dart';

import '../model/hotel.dart';
import '../model/hotels_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isGridView = true; // true for GridView, false for ListView

  // TODO: Make a collection of cards (102)
  List<Widget> _buildGridCards(BuildContext context) {
    List<Hotel> hotels = HotelsRepository.loadHotels();

    if (hotels.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    // products 리스트의 각 요소에 대해 map() 함수를 실행
    return hotels.map((hotel) {
      // 각 product에 대해 아래의 코드 블록을 실행
      return _isGridView ? 
      // GridView card layout
      Card(
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
                hotel.assetName,
                package: hotel.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child:
                  Column(crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(hotel.name,style:
                        theme.textTheme.titleLarge,maxLines:
                          1,),
                      const SizedBox(height:
                        8.0),
                      Text(hotel.location,style:
                        theme.textTheme.titleSmall,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      : 
      // ListView card layout
      ListTile(
        leading: Image.asset(hotel.assetName),
        title: Text(hotel.name),
        subtitle: Text(hotel.location),
      );
      
  }).toList();
}
  

  String _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      });

      String routeName = '';
      switch(index) {
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
    List<String> titles = ['Home', 'Search', 'Favorite Hotel', 'My Page', 'Log Out'];
    List<IconData> icons = [Icons.home, Icons.search, Icons.location_city, Icons.person, Icons.logout];
    
    return ListTile(
      leading: Icon(icons[index], color: Colors.blue),
        title: Text(titles[index]),
        selected: _selectedIndex == index,
        onTap: () {
          // Update the state of the app
          String routeName = _onItemTapped(index);
          // Then close the drawer
          Navigator.pop(context);
          Navigator.pushNamed(context,routeName);
        },
      );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
          title: const Text('Main',),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white), // Add this line
          
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context,'/search');
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.language,
                semanticLabel: 'language',
                color: Colors.white,
                ),
                onPressed: () {
                  print('language button');
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
                        childAspectRatio: 8 / 9,
                        crossAxisSpacing: .5,
                        mainAxisSpacing:.5 ,
                        children:_buildGridCards(context),
                      )
                    : ListView(padding:
                        const EdgeInsets.all(16.0),
                        children:_buildGridCards(context)
                      );
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
                  child: Text('Pages',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ), 
            ...List.generate(5, buildDrawerListTile),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

}
