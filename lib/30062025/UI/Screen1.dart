import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revision_app/30062025/UI/Screen2.dart';
import 'package:revision_app/30062025/provider/DataProvider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                  labelText: 'Enter Text',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  Provider.of<Dataprovider>(context, listen: false)
                      .updateData(value);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(),
                    ),
                  );
                },
                child: Text('go to next Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
