//Nombre: Edna Victoria Alvarez Machuca
//Proyecto: App convertir monedas.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Monedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54), //estilo gris oscuro para variar.
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversor de Monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //defino variables con valores aproximados de cada moneda
  double pesosToEuros = 0.00023;
  double pesosToDollars = 0.00024;
  double eurosToPesos = 4352;
  double eurosToDollars = 1.06;
  double dollarsToPesos = 4114;
  double dollarsToEuros = 0.95;

  //defino los controllers
  final _pesos = TextEditingController();
  final _euros = TextEditingController();
  final _dollars = TextEditingController();

  //realizo funciones para la conversión de cada una de las monedas con dos decimales al resultado
  void convertPesos() {
    setState(() {
      _euros.text = (double.parse(_pesos.text) * pesosToEuros).toStringAsFixed(2);
      _dollars.text = (double.parse(_pesos.text) * pesosToDollars).toStringAsFixed(2);
    });
  }

  void convertEuros() {
    setState(() {
      _pesos.text = (double.parse(_euros.text) * eurosToPesos).toStringAsFixed(2);
      _dollars.text = (double.parse(_euros.text) * eurosToDollars).toStringAsFixed(2);
    });
  }

  void convertDollars() {
    setState(() {
      _pesos.text = (double.parse(_dollars.text) * dollarsToPesos).toStringAsFixed(2);
      _euros.text = (double.parse(_dollars.text) * dollarsToEuros).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Monedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [ // defino campos de texto simples para cada moneda con su respectivo boton convertidor
            TextField(
              controller: _pesos,
              decoration: const InputDecoration(labelText: 'Pesos Colombianos'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: convertPesos,
              child: const Text('Convertir'),
            ),
            TextField(
              controller: _euros,
              decoration: const InputDecoration(labelText: 'Euros'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: convertEuros,
              child: const Text('Convertir'),
            ),
            TextField(
              controller: _dollars,
              decoration: const InputDecoration(labelText: 'Dólares de USA'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: convertDollars,
              child: const Text('Convertir'),
            ),
          ],
        ),
      ),
    );
  }
}




