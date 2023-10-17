import 'package:actividad2/custom/PostCellView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.deepPurpleAccent
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return PostCellView(sText: "Ejemplo", iColorCode: 600, dFontSize: 30);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )
    );
  }
}