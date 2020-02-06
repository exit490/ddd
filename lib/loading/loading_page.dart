import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        weatherBackground(context),
        mainStruct(),
      ],
    );
  }
}

mainStruct() {
  return Scaffold(
    appBar: loadingAppBar(),
    backgroundColor: Colors.transparent,
    body: bodyStruct(),
  );
}

bodyStruct() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.white,
    ),
  );
}

weatherBackground(context) {
  return Image.asset(
    "assets/images/cloudy_1.jpg",
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    fit: BoxFit.cover,
  );
}

loadingAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text('Loading ...'),
    elevation: 20,
  );
}
