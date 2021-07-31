import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajwid/model/Tajwid.dart';

class DetailScreen extends StatelessWidget {
  final Tajwid tajwid;

  DetailScreen({required this.tajwid});

  @override
  Widget build(BuildContext context) {
    return DetailMobilePage(tajwid: tajwid);
  }
}

class DetailMobilePage extends StatelessWidget {
  final Tajwid tajwid;

  DetailMobilePage({required this.tajwid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Hero(tag: tajwid.name, child: Image.asset(tajwid.imageAsset)),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  tajwid.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  tajwid.deskripsi,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
