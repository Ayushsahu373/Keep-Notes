import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision_app/30062025/provider/DataProvider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Dataprovider>(context).data;

    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: Text(
          data.isNotEmpty ? 'Received: $data' : 'No Data Provided',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
