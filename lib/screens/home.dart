import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/screens/details.dart';
import 'package:furniture_app/util/data.dart';
// import 'package:furniture_app/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/templates/action_button.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static Icon _lightIcon = new Icon(Feather.getIconData("eye"));
  static Icon _darkIcon = new Icon(FontAwesomeIcons.solidMoon);
  var _filePath;

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  void getImage() async {
    _filePath = await ImagePicker.pickVideo(source: ImageSource.gallery);
    String path = _filePath != null ? _filePath.path : "None";
    print('File Path Retrieved: ' + path);
    // if (image != null) {
    //   setState(() {
    //     _filePath = image;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<bool>(context);
    var buttonWidth = MediaQuery.of(context).size.width * 0.6;

    var uploadMediaButton = Align(
      alignment: Alignment.center,
      child: ActionButton(
        onPressed: getImage,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(
                  color:
                      isDark ? const Color(0xff43464b) : Colors.transparent)),
          elevation: 6.0,
          color: isDark ? const Color(0xff111111) : Colors.white,
          child: Container(
            width: buttonWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Icon(
                    Feather.getIconData("radio"),
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Upload Media',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var liveButton = Align(
      alignment: Alignment.center,
      child: ActionButton(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide(
                  color:
                      isDark ? const Color(0xff43464b) : Colors.transparent)),
          elevation: 6.0,
          color: isDark ? const Color(0xff111111) : Colors.white,
          child: Container(
            width: buttonWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Icon(
                    Feather.getIconData("mic"),
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Live Transcript',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.w400,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    var buttons = [uploadMediaButton, liveButton];

    var resultTilesBg = [
      "assets/pic01.jpg",
      "assets/pic02.jpg",
      "assets/pic03.jpg",
      "assets/pic04.jpg"
    ];

    return Scaffold(
      appBar:
          PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0.0)),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "What do you want to transcript today?",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                        child: isDark ? _lightIcon : _darkIcon,
                        onTap: Provider.of<VoidCallback>(context)),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return index == buttons.length - 1
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: buttons[(index.abs()) % buttons.length],
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: buttons[(index.abs()) % buttons.length],
                            );
                    })),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("SubSub-ed Transcripts",
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.w800,
                  )),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: furnitures.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Map furniture = furnitures[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Details(
                                    title: Text('Transcript ${(index + 1)}'));
                              },
                            ),
                          );
                        },
                        child: Card(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.transparent)),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  resultTilesBg[index % resultTilesBg.length],
                                  // "${furniture["img"]}",
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    height: 100,
                                    child: Opacity(
                                      opacity: 0.4,
                                      child: Container(
                                          color: Theme.of(context)
                                              .backgroundColor),
                                    )),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 100,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Transcript ${(index + 1)}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Helvetica",
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
