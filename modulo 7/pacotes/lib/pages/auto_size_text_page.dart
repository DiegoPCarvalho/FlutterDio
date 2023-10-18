import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizePage extends StatefulWidget {
  const AutoSizePage({super.key});

  @override
  State<AutoSizePage> createState() => _AutoSizePageState();
}

class _AutoSizePageState extends State<AutoSizePage> {
  var textController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Auto Size",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 35),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            TextField(
              controller: textController,
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Card(
              child: AutoSizeText(
                textController.text,
                maxLines: 3,
                minFontSize: 20,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
