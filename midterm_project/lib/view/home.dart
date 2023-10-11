import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/product.dart';
import '../model/products_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
              // TODO: Adjust the box size (102)
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                // TODO: Align labels to the bottom and center (103)
                crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                  // TODO: Handle overflowing labels (103)
                  Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
          Navigator.pushNamed(context,routeName);
        },
      );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
          title: const Text('SHRINE'),
          backgroundColor: Colors.blue,
          
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              },
            ),

            IconButton(
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
                ),
                onPressed: () {
                  print('Filter button');
                },
            )
          ],
      ),

      // TODO: Add a grid view (102)
      // GridView는 count() 생성자를 호출
      body: GridView.count(
        // crossAxisCount: 전체 항목 수를 지정 (여기서는 열이 2개)
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,

        // TODO: Build a grid of cards (102)
        children: _buildGridCards(context)
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
