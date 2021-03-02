import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aws_amplify_tutorial/amplifyconfiguration.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {},
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Is AWS Amplify configured
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();

    // run configure method initial
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    //aws amplify configuration
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter AWS Amplify Tutorial'),
      ),
          body: Center(
              child: Text(_amplifyConfigured
              ? "Flutter AWS Amplify Configured"
              : "Flutter AWS Amplify Not Configured")),
    ));
  }
}
