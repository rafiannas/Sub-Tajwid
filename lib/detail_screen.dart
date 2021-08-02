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
                        LikeButton(like: tajwid.like)
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

class LikeButton extends StatefulWidget {
  final int like;

  LikeButton({required this.like});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  void _changeLike() {
    setState(() {
      if (isFavorite) {
        isFavorite = !isFavorite;
      } else {
        isFavorite = !isFavorite;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.blue),
        child: Row(
          children: [
            IconButton(
                onPressed: _changeLike,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                )),
          ],
        ));
  }
}
