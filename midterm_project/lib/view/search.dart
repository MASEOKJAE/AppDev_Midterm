import 'package:flutter/material.dart';
import 'widgets/expansion.dart';
import 'package:intl/intl.dart';

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
        titlePadding: EdgeInsets.zero,
        title: Container(
          height: MediaQuery.of(context).size.height /
              6, // Set the height to be a third of the screen's height.
          color: Colors.blue,
          child: const Center(
              child: Text(
            'Please check\nyour choice :)',
            style: TextStyle(color: Colors.white),
          )),
        ),
        content: Column(
          mainAxisSize:
              MainAxisSize.min, // Make the column's height fit its content.
          children: [
            ListTile(
              leading: const Icon(Icons.filter_list,
                  color: Colors
                      .blue), // Add a filter icon before the filters text.
              title: Text(
                selectedFilters.join(' / '),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month,
                  color:
                      Colors.blue), // Add a calendar icon before the date text.
              title: Text(
                'IN  ' + DateFormat('yyyy.MM.dd (EEE)').format(checkInDate),
                style: const TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Search');
                },
                child: const Text('Search'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)))),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text(
                'Cancel',
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ])
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  ExpansionView(onFilterChanged: handleFilterChange),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('check-in',
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 10),
                              Text(
                                DateFormat('yyyy.MM.dd (EEE)')
                                    .format(checkInDate),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Material(
                            color: Colors.blue.withOpacity(.5),
                            borderRadius: BorderRadius.circular(5),
                            child: InkWell(
                              onTap: () => _selectDate(context),
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 40,
                                ),
                                child: const Text(
                                  'select date',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: _showSelectedOptions,
                child: const Text('Search', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
