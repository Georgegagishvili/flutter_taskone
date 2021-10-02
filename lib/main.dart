import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimalsPage(),
    );
  }
}

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({Key? key}) : super(key: key);

  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  Map<String, String> _animalMap = {
    "cat": "https://i.imgur.com/QCz7SdF.jpg",
    "lion":
        "https://images.news18.com/ibnlive/uploads/2021/08/1628511415_lion-1600x1200.jpg",
    "tiger":
        "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/portrait-of-a-white-tiger-sergei-gladyshev.jpg",
    "ocelot":
        "http://cincinnatizoo.org/system/assets/uploads/2011/02/ocelot-3.jpg",
  };
  String _animalImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animals"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.all(25),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _animalImage != ""
                      ? Image(
                          image: NetworkImage(_animalImage),
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.black,
                        )),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => {_changePhoto('cat')},
                      child: Text("Cat")),
                  ElevatedButton(
                      onPressed: () => {_changePhoto('lion')},
                      child: Text("Lion")),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => {_changePhoto('tiger')},
                      child: Text("Tiger")),
                  ElevatedButton(
                      onPressed: () => {_changePhoto('ocelot')},
                      child: Text("Ocelot")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _changePhoto(String animalName) {
    setState(() {
      _animalImage = _animalMap['$animalName']!;
    });
  }
}
