import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(220, 147, 32, 32),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 25,),
            
            Text("SUSHI MAN",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white,
            )),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset("lib/images/sushi (1).png"),
            ),
            SizedBox(height: 25,),
            
            Text("THE TASTE OF JAPANESE FOOD",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 40,
              color: Colors.white
            ),
            
            ),
            SizedBox(height: 10,),
            
            Text(
              "Feel the taste of the most popular Japanese Foods from anywhere anytime",
              style: TextStyle(
                color: Colors.grey[200],
                height: 2,
              ),
            ),
            SizedBox(height: 25,),
            
            MyButton(text: "Get Started",
            onTap: () {
              Navigator.pushNamed(context, '/menupage');
            },),
          ]),
        ),
      ),
    );
  }
}