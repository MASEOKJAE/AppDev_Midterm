import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../model/hotel.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    Divider divider = const Divider(height: 1.0, color: Colors.black,);

    final Hotel hotel = ModalRoute.of(context)!.settings.arguments as Hotel;

    const colorizeColors = [
      Colors.blue,
      Colors.grey,
      Colors.black,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView( // for longer descriptions
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'hero${hotel.id}', // unique tag for this Hero
              child: Image.asset(hotel.picture),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Row(children:
                    List<Widget>.generate(hotel.star, (index) => const Icon(Icons.star, color: Colors.yellow, size: 30)),
                    mainAxisAlignment : MainAxisAlignment.start,
                  ),
                  const SizedBox(height : 15.0),

                  // Using animated_text_kit
                  AnimatedTextKit(
                    animatedTexts: [
                     ColorizeAnimatedText(
                        hotel.name,
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                  const SizedBox(height : 15.0),

                  Row(
                    children:[
                      const Icon(Icons.location_on,color : Colors.blue), 
                      const SizedBox(width : 5.0), 

                      Text(hotel.location)
                  ]),
                  const SizedBox(height : 10.0),

                  Row(
                    children:[
                      const Icon(Icons.phone,color : Colors.blue), 
                      const SizedBox(width : 5.0), 

                      Text(hotel.number)
                  ]),
                  const SizedBox(height : 10.0),

                  divider,
                  
                 // Long description may need to scroll within the page.
                 SingleChildScrollView(
                  child:Container(
                    padding:EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .015,
                     ),
                     child: Text(hotel.intro,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 16)
                      ),
                   )
                 )
                ],
              ),
            )
          ]
        )
      )
    );
  }
}