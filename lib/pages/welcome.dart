import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    navigateToToc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 40.0),
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.red,
              child: Text(
                'Learn GIT',
                style: TextStyle(
                  fontFamily: 'Aquire-BW0ox',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ));
  }

  void navigateToToc() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}
