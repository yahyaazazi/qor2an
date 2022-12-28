import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../my_theme.dart';
import '../sura_name_item.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int seb7a = 0;
  int index = 0;
  List<String> azkar = ['sob7an alaah ', 'al7amd alllah ', 'alaah akbar'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 70, top: 30),
              child: Image.asset('assets/images/head of seb7a.png')),
          Image.asset('assets/images/body of seb7a.png'),
          Container(
              padding: EdgeInsets.all(20),
              child: Text('عدد السبحات',
                  style: Theme.of(context).textTheme.headline1)),
          InkWell(
              onTap: () {
                seb7a++;
                if (seb7a == 33) {
                  seb7a = 0;
                  index++;
                }
                if (index == azkar.length) {
                  index = 0;
                }
                setState(() {});
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(183, 147, 95, 1.0),
                    border:
                        Border.all(color: Color.fromRGBO(183, 147, 95, 1.0)),
                  ),
                  child: Text(
                    'Click  : $seb7a',
                    style: Theme.of(context).textTheme.headline1,
                  ))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(183, 147, 95, 1.0),
              border: Border.all(color: Color.fromRGBO(183, 147, 95, 1.0)),
            ),
            child: Text('${azkar[index]}',
                style: Theme.of(context).textTheme.headline1),
          )
        ],
      ),
    );
  }
}
