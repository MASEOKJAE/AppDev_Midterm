import 'package:flutter/material.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DatePickerMain(),
      ),
    );
  }
}

class DatePickerMain extends StatefulWidget {
  const DatePickerMain({Key? key}) : super(key: key);

  @override
  State<DatePickerMain> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerMain> {
  
   DateTime selectedDate = DateTime.now();

   Future<void> _selectDate(BuildContext context) async {
     final DateTime? picked = await showDatePicker(
         context: context,
         initialDate: selectedDate,
         firstDate: DateTime(2021, 8),
         lastDate: DateTime(2101));
     if(picked != null && picked != selectedDate) {
       setState(() {
         selectedDate = picked;
       });
     }
   }

   void _showSelectedOptions() {
     showDialog<String>(
       context: context,
       builder: (BuildContext context) => AlertDialog(
         title: const Text('Selected Options'),
         content:
             Text('Selected Date : ${selectedDate.toLocal().toString().split(' ')[0]}'),
           actions:<Widget>[
             TextButton(
               onPressed : () {Navigator.pop(context, 'OK');},
               child : const Text('OK')
             )
           ]
       ),
     );
   }

   @override
   Widget build(BuildContext context) {

     return Column (
       mainAxisAlignment : MainAxisAlignment.center,
       children:[
         OutlinedButton (
           onPressed : () => _selectDate(context),
           child :
               Text ('Select date')
          ),
          ElevatedButton (
            onPressed :
                _showSelectedOptions,
            child :
                Text ('Search')
          )
        ],
      );
    }
}
