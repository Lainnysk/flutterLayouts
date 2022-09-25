import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 158, 162, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container()),
            const Image(
              image: AssetImage("assets/medinow.png"),
            ),
            Text("Meditate With Us!",
                style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                textAlign: TextAlign.center),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 55, bottom: 14),
              child: ElevatedButton(
                onPressed: () {},
                // ignore: sort_child_properties_last
                child: Text("Sign in with Apple",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    fixedSize: Size(30, 60),
                    backgroundColor: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 14),
              child: ElevatedButton(
                onPressed: () {},
                // ignore: sort_child_properties_last
                child: Text("Continue with Email or Phone",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    fixedSize: Size(30, 60),
                    backgroundColor: Color.fromRGBO(205, 253, 254, 1)),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text("Continue With Google",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30, top: 65),
              child: const Image(image: AssetImage("assets/image3.png")),
            )
          ],
        ));
  }
}
