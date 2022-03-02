import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:name_your_price/product_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _productIndex = 0;
  int? _inputtedPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_productIndex].name,
                style: const TextStyle(fontSize: 25)),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('priceInput'),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
              child: const Text('Check'),
              onPressed: () {
                setState(() {
                  _result = _inputtedPrice == products[_productIndex].price
                      ? 'pass'
                      : 'fail';
                });
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            Visibility(
              visible: _result.isNotEmpty,
              child: Text(_result,
                  style: const TextStyle(fontSize: 20),
                  key: const Key('result')),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = '';
                      if (_productIndex < 4) {
                        _productIndex++;
                      }
                    });
                  },
                  child: const Text('Next')),
            )
          ],
        ),
      ),
    ));
  }
}
