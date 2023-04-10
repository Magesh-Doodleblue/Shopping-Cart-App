// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _faceMaskCount = 0;
  int _toiletPaperCount = 0;
  double _totalCost = 0;
  double _discount = 0;
  int totalItemsCount = 0;
  void _incrementFaceMaskCount() {
    setState(() {
      _faceMaskCount++;
      _calculateTotalCost();
    });
  }

  void _decrementFaceMaskCount() {
    setState(() {
      if (_faceMaskCount > 0) {
        _faceMaskCount--;
        _calculateTotalCost();
      }
    });
  }

  void _incrementToiletPaperCount() {
    setState(() {
      _toiletPaperCount++;
      _calculateTotalCost();
    });
  }

  void _decrementToiletPaperCount() {
    setState(() {
      if (_toiletPaperCount > 0) {
        _toiletPaperCount--;
        _calculateTotalCost();
      }
    });
  }

  void _calculateTotalCost() {
    double faceMaskCost =
        (_faceMaskCount ~/ 2) * 4.0 + (_faceMaskCount % 2 == 0 ? 0 : 2.5);
    double toiletPaperCost =
        (_toiletPaperCount ~/ 6) * 5 * 0.65 + (_toiletPaperCount % 6) * 0.65;
    double totalCost = faceMaskCost + toiletPaperCost;
    double discount =
        (_faceMaskCount ~/ 2) * 1.5 + (_toiletPaperCount ~/ 6) * 0.65;
    setState(() {
      _totalCost = totalCost;
      _discount = discount;
    });
  }

  totalItemsCounFunction() {
    setState(() {
      totalItemsCount = _faceMaskCount + _toiletPaperCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 255, 176, 230),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 204, 232),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Face Masks',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('£2.50 each'),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _decrementFaceMaskCount();
                        totalItemsCounFunction();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_faceMaskCount'),
                    IconButton(
                      onPressed: () {
                        _incrementFaceMaskCount();
                        totalItemsCounFunction();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Toilet Paper',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('65p per roll'),
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _decrementToiletPaperCount();
                        totalItemsCounFunction();
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_toiletPaperCount'),
                    IconButton(
                      onPressed: () {
                        _incrementToiletPaperCount();
                        totalItemsCounFunction();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Total Cost',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('£${_totalCost.toStringAsFixed(2)}'),
                Text('£${_discount.toStringAsFixed(2)} discount'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 16),
            Text(
              'Total to Pay',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '£${(_totalCost - _discount).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                Text(
                  'No of Items ${totalItemsCount.toString()}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Example'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('John')),
                DataCell(Text('25')),
                DataCell(Text('Male')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Jane')),
                DataCell(Text('30')),
                DataCell(Text('Female')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Bob')),
                DataCell(Text('40')),
                DataCell(Text('Male')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
