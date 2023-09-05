import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  MyButton({super.key,
  required this.text,
  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 163, 53, 46),
        borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
            style: TextStyle(color: Colors.white),
            ),
    
            SizedBox(width: 10,),
    
            Icon(Icons.arrow_forward, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}