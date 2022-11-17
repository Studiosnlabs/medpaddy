import 'package:flutter/material.dart';
import 'package:medpaddy/widgets/app_drawer.dart';
import 'package:medpaddy/widgets/medPaddyAppBar.dart';

class HosptialScreen extends StatefulWidget {

  static const routeName='/hospitalScreen';

  @override
  State<HosptialScreen> createState() => _HosptialScreenState();
}

class _HosptialScreenState extends State<HosptialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MedPaddyAppBar(),
      drawer: AppDrawer(),

    );
  }
}
