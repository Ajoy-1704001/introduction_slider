import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              buildPage(
                  image: 'assets/first.jpg',
                  title: "Pick Date",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              buildPage(
                  image: 'assets/second.jpg',
                  title: "Pick a destination",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
              buildPage(
                  image: 'assets/third.jpg',
                  title: "Get your ticket",
                  subtitle:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            ],
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Visibility(
            visible: currentIndex == 0 ? false : true,
            child: Positioned(
              child: TextButton(
                  onPressed: () {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                    print(currentIndex);
                  },
                  child: Text("Back")),
              bottom: 20,
              left: 20,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: currentIndex == index ? 16 : 10,
                      color: currentIndex == index
                          ? Colors.blue
                          : Colors.grey.shade400,
                    ),
                  );
                }),
              ),
            ),
            bottom: 30,
          ),
          Positioned(
            child: TextButton(
                onPressed: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                  print(currentIndex);
                },
                child: currentIndex == 2 ? Text("Start") : Text("Next")),
            bottom: 20,
            right: 20,
          ),
        ],
      )),
    );
  }

  buildPage({String image, String title, String subtitle}) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: _width,
            //height: _height * 0.7,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
