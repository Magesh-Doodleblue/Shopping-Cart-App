import 'package:flutter/material.dart';

class CartUi extends StatefulWidget {
  const CartUi({super.key});

  @override
  State<CartUi> createState() => _CartUiState();
}

class _CartUiState extends State<CartUi> {
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
        centerTitle: true,
        title: const Text("Shopping Cart"),
        actions: [
          Row(
            children: [
              Image.asset(
                "assets/shopping-bag.png",
                width: 30,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: mobileCartUi(context),
        ),
      ),
    );
  }

  Column mobileCartUi(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: const Color(0xFFE5E5E5),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Center(
                    child: Text(
                        "--  Total Items in Cart ${totalItemsCount.toString()}  --")),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj_Rvwekwd2jpBPkWDhruEqUwGvFC8VsmecNSCBFGo&s",
                width: 85,
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FACE MASKS",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "4.3 Rating",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    '£2.50 each',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _decrementFaceMaskCount();
                  totalItemsCounFunction();
                },
                icon: const Icon(Icons.remove),
                iconSize: 25,
              ),
              Text(
                '$_faceMaskCount',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementFaceMaskCount();
                  totalItemsCounFunction();
                },
                icon: const Icon(Icons.add),
                iconSize: 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBNDAhW-0Wik6x3NLYTmvbRoimDSuYx1hTOCHnys8&s",
                width: 85,
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toilet Paper",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "4.0 Rating",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    '£2.50 each',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _decrementToiletPaperCount();
                  totalItemsCounFunction();
                },
                icon: const Icon(Icons.remove),
                iconSize: 25,
              ),
              Text(
                '$_toiletPaperCount',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                onPressed: () {
                  _incrementToiletPaperCount();
                  totalItemsCounFunction();
                },
                icon: const Icon(Icons.add),
                iconSize: 25,
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Center(
          child: FittedBox(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > 700
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.width * 0.9,
              child: DataTable(
                dataRowHeight: 60, // set height of each DataRow
                columnSpacing: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    width: 0.3,
                  ),
                ),
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Items\nName',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Unit\ncost',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Total\nItems',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Discount\nper Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('Face Mask')),
                      const DataCell(Text('£2.5')),
                      DataCell(Text(_faceMaskCount.toString())),
                      const DataCell(Text('£1.0')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      const DataCell(Text('Toilet Paper')),
                      const DataCell(Text('£0.65')),
                      DataCell(Text(_toiletPaperCount.toString())),
                      const DataCell(Text('£0.65')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Total Cost',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '£${_totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Total Discount',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '£${_discount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    '£${(_totalCost - _discount).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
