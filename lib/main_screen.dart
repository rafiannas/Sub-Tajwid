import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tajwid/detail_screen.dart';
import 'package:tajwid/model/Tajwid.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Macam-macam Tajwid"),
        backgroundColor: Colors.blue,
      ),
      body: TajwidGrid(),
    );
  }
}

class TajwidGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: GridView.count(
          crossAxisCount: 2,
          children: tajwidList.map((tajwid) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(tajwid: tajwid);
                }));
              },
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Hero(
                    tag: tajwid.name,
                    child: Image.asset(
                      tajwid.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
