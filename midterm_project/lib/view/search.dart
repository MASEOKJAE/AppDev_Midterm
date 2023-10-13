import 'package:flutter/material.dart';
import 'sub/expansion.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DateTime checkInDate = DateTime.now();
  List<String> selectedFilters = [];

  void handleFilterChange(List<String> filters) {
    setState(() {
      selectedFilters = filters;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: checkInDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  void _showSelectedOptions() {
   showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Optionally, add rounded corners to the dialog.
          ),
          title: Container(
            height: MediaQuery.of(context).size.height / 6, // Set the height to be a third of the screen's height.
            color: Colors.blue,
            child: const Center(
              child: 
                Text(
                  'Please check\nyour choice :)', 
                  style: TextStyle(color: Colors.white),
                  )
              ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Make the column's height fit its content.
            children:[
              ListTile(
                leading: const Icon(Icons.filter_list, color: Colors.blue), // Add a filter icon before the filters text.
                title: Text(
                  '${selectedFilters.join(' / ')}',
                  style: const TextStyle(fontSize: 12)
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month, color: Colors.blue), // Add a calendar icon before the date text.
                 title: Text(
                  'IN   ${checkInDate.toLocal().toString().split(' ')[0]}',
                   style: const TextStyle(fontSize: 12)
                  ),  
              )
          ],
        ),
        actions:<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {Navigator.pop(context,'Search');},
                  child: const Text('Search'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  )
                ),
                const SizedBox(width:10),

                ElevatedButton(
                  onPressed: () {Navigator.pop(context, 'Cancel');},
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10.0)
                      )
                    )
                ),
            ]
          )
        ],
      ),
    );
  }

   void onFilterChanged(List<String> filters) {
     setState(() {
       selectedFilters = filters;
     });
   }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(title: const Text('Search')),
       body:
         ListView(
          children:[
            ExpansionView(onFilterChanged: handleFilterChange),
            ListTile(
              title: OutlinedButton(
                onPressed : () => _selectDate(context),
                  child : const Text('Select Check-in date')
                  ),
              ),
            Center( // Wrap the button with a Center widget to center it horizontally
              child: Padding( // Add some vertical padding
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: MaterialButton(
                  onPressed : _showSelectedOptions,
                  color : Theme.of(context).primaryColor, // Use the primary color of your theme for the button's background
                  textColor : Colors.white, // Set the text color to white
                  shape : RoundedRectangleBorder(borderRadius : BorderRadius.circular(10)), // Make the button's corners rounded
                  child : const Text('Search'),
                  minWidth : 3, // Remove minimum width restriction 
                  padding : const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Adjust padding as per requirement
                ),
              ),
            )
         ])
     );
   }
}
