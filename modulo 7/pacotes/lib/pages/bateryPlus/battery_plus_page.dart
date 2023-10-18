// import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryPlusPage extends StatefulWidget {
  const BatteryPlusPage({super.key});

  @override
  State<BatteryPlusPage> createState() => _BatteryPlusPageState();
}

class _BatteryPlusPageState extends State<BatteryPlusPage> {
  // var batery = Battery();
  String status = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // carregar();
  }

  void carregar() async {
    // status = (await batery.batteryLevel).toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Bateria:  $status%",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 35),
      ),
    ));
  }
}
