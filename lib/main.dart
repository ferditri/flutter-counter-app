import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  // fungsi untuk tambah angka
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // mengurangi
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // reset
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  // fungsi warna
  Color _getCounterColor() {
    if (_counter == 0) return Colors.grey;
    return _counter % 2 == 0 ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tap the buttons to change the number',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _getCounterColor().withOpacity(0.2),
                borderRadius: BorderRadius.circular(15), // si
                border: Border.all(color: _getCounterColor(), width: 3),
              ),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: _getCounterColor(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // info ganjil genap
            Text(
              _counter == 0
                  ? 'Neutral Number'
                  : _counter % 2 == 0
                  ? 'Even Number (Genap)'
                  : 'Odd Number (Ganjil)',
              style: TextStyle(
                fontSize: 16,
                color: _getCounterColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrease',
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.remove, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: _resetCounter,
                  tooltip: 'Reset',
                  backgroundColor: Colors.grey,
                  child: const Icon(Icons.refresh, color: Colors.white),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increase',
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
