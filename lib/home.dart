import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Color bgClr = Color.fromRGBO(21, 21, 21, 1);
  Color textClr = Color.fromRGBO(255, 255, 255, 1);
  Color btnClr = Color.fromRGBO(31, 31, 31, 1);
  Color btnTextClr = Color.fromRGBO(215, 215, 215, 1);

  String textFontFamily;

  List fontFamilies = [
    'Raleway',
    'FredokaOne',
    'Comic_Neue',
    'Girassol',
    'Roboto_Mono',
    'Slabo_27',
    'Ubuntu',
  ];

  double textSize = 20;

  int count = 0;

  void changeTextStyle(count) {
    if (textSize >= 100) textSize = 20;
    setState(() {
      textFontFamily = fontFamilies[count];
      textSize += 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: bgClr,
        elevation: 20,
        centerTitle: true,
      ),
      body: Center(
        child: Container( // Text + Button
          width: double.infinity,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: textSize,
                  fontFamily: textFontFamily,
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                child: Text('HELLO'),
              ),
              Container( // Button
                margin: EdgeInsets.only(top: 20),
                width: 100,
                height: 40,
                child: RaisedButton(
                  child: Text(
                    'CHANGE',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  color: btnClr,
                  textColor: btnTextClr,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    count++;
                    if (count == 7) count = 0;
                    changeTextStyle(count);
                  },
                  elevation: 5.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
