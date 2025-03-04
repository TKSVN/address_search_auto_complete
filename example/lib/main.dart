import 'package:address_search_auto_complete/address_search_auto_complete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  final _addressSearchAutoCompletePlugin = AddressSearchAutoComplete();
  List<String> _results = [];

  void _searchAddress() async {
    final address = _controller.text;
    final results =
        await _addressSearchAutoCompletePlugin.searchAddress(address);
    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Enter address'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: _searchAddress,
                    child: const Text('Search Address')),
                const SizedBox(height: 16),
                if(_results.isNotEmpty)
                Text('Search Address: ${_results.join("\n ")}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
