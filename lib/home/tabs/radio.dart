import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio.png'),
          Container(

              child: Text('اذاعة الكران الكريم',
                  style: Theme.of(context).textTheme.headline1)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/1.png'),
              Image.asset('assets/images/3.png'),
              Image.asset('assets/images/2.png'),
            ],
          )
        ],
      ),
    );
  }
}
