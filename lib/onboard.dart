import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/home.dart';

import 'constant.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/spork.jpeg"), fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            color: grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Let\'s cook your own food and adjust your diet',
                    textAlign: TextAlign.center,
                    style: roboto.copyWith(
                        fontSize: 24, height: 2, color: Colors.black),
                  ),
                  Text(
                    'Don\'t be confused, Complete your nutritional needs by chosing food here!',
                    style: roboto.copyWith(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        height: 2),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                              (route) => false);
                    },
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: green),
                        child: Center(
                            child: Text(
                          'Get Start',
                          style: poppins.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
