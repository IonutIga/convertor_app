import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  double valueToConvert = 0;
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Converter App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.network(
                  "https://assets.protv.ro/assets/incont/2016/06/16/image_galleries/56853/brexitul-trimite-unde-de-soc-la-bucuresti-leul-isi-continua-deprecierea-fata-de-euro-si-francul-elvetian_size10.jpg"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    errorText: error,
                    hintText: "Introduceti suma pe care vreti sa o convertiti",
                  ),
                  onChanged: (String value) {
                    valueToConvert = double.tryParse(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Calculeaza',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (valueToConvert != null) {
                      setState(() {
                        valueToConvert = valueToConvert * 4.5;
                        isVisible = true;
                        error = null;
                      });
                    } else
                      setState(() {
                        error = 'Introduceti un numar valid!';
                        isVisible = false;
                        valueToConvert = 0;
                      });
                  },
                ),
              ),
              Visibility(
                child: Text(
                  valueToConvert.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                visible: isVisible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
