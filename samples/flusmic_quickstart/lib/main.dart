import 'package:flusmic/flusmic.dart' hide Text;
import 'package:flutter/material.dart';

void main() => runApp(FlusmicQuickstartApp());

class FlusmicQuickstartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flusmic Quickstart Sample', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Flusmic flusmic =
      Flusmic(prismicEndpoint: 'https://flusmic.cdn.prismic.io/api/v2');

  Result result;

  @override
  void initState() {
    super.initState();
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flusmic sample')),
      body: result != null
          ? Center(child: Text(result.results.first.data.toString()))
          : Center(child: CircularProgressIndicator()),
    );
  }

  void getResult() async {
    final root = await flusmic.getRootDocument();
    setState(() => result = root);
  }
}
