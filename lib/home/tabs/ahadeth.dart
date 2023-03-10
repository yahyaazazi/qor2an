import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_str/hadeth_deatils/hadeth_details.dart';
import 'package:islami_c7_str/my_theme.dart';

class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) {
      loadHadethFie();
    }
    // Ahadeth.isEmpty?loadHadethFie():
    return Column(
      children: [
        Image.asset('assets/images/hadeth_main_bg.png'),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 3,
        ),
        Text(
          'Ahadeth',
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 3,
        ),
        Ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                    separatorBuilder: (_, index) => Divider(
                          color: Theme.of(context).colorScheme.primary,
                          indent: 30,
                          endIndent: 30,
                        ),
                    itemCount: Ahadeth.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadethDetails.routeName,
                              arguments: Ahadeth[index]);
                        },
                        child: Text(
                          Ahadeth[index].title,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
              )
      ],
    );
  }

  void loadHadethFie() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> Allahadeth = content.trim().split('#\r\n');
// for loop

    for (int i = 0; i < Allahadeth.length; i++) {
      String hadeth = Allahadeth[i];
      List<String> HadethLines = hadeth.split('\n');
      String title = HadethLines[0];
      HadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, HadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
