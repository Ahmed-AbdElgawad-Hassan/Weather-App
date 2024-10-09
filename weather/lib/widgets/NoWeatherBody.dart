import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There is No Weather 😔 Start',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
             Text('Searching now 🔍',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            
          ],
        ),
      ),
    );
  }
}