import 'package:flutter/material.dart';

class ExpansionView extends StatefulWidget {
  final ValueChanged<List<String>> onFilterChanged;

  const ExpansionView({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  State<ExpansionView> createState() => _ExpansionPanelListState();
}

class _ExpansionPanelListState extends State<ExpansionView> {
  bool isExpanded = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  void _notifyFilterChange() {
    List<String> selectedFilters = [];
    if (isChecked1) selectedFilters.add('No Kids Zone');
    if (isChecked2) selectedFilters.add('Pet-Friendly');
    if (isChecked3) selectedFilters.add('Free breakfast');

    print('변화가 감지됨!!!');
    widget.onFilterChanged(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Row(
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('select filters'),
                    ),
                  ),
                ],
              ),
            );
          },
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isChecked1,
                          onChanged: (value) {
                            setState(() {
                              isChecked1 = value!;
                              _notifyFilterChange();
                            });
                          },
                        ),
                        const Text('No Kids Zone'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isChecked2,
                          onChanged: (value) {
                            setState(() {
                              isChecked2 = value!;
                              _notifyFilterChange();
                            });
                          },
                        ),
                        const Text('Pet-Friendly'),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isChecked3,
                          onChanged: (value) {
                            setState(() {
                              isChecked3 = value!;
                              _notifyFilterChange();
                            });
                          },
                        ),
                        const Text('Free breakfast'),
                      ],
                    ),
                  ],
              ),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}