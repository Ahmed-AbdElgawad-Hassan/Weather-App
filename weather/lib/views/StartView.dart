import 'package:flutter/material.dart';
import 'package:weather/views/HomeView.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff143A70),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: 
          AssetImage('assets/images/92ca98d8a47c0e6644506c0254da9855.jpg'),)
      ),
      child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homeview()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(top: 740),
          alignment: Alignment.center,
          width: 280,
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.white, Colors.black],
            ),
          ),
          child: const Text(
            'Let\'s Know Weather Today',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    ),
      ));
  }
}
