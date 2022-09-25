import 'package:flutter/material.dart';
import 'package:flutter_application_2/medinow.dart';
import 'package:google_fonts/google_fonts.dart';

class deepRelax extends StatefulWidget {
  const deepRelax({super.key});

  @override
  State<deepRelax> createState() => _deepRelax();
}

class _deepRelax extends State<deepRelax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //Expanded(child: Container()),
        Padding(padding: EdgeInsets.only(top: 70)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          //width: Screen,
          child: Image(image: AssetImage('assets/chel.png')),
          decoration: BoxDecoration(
              color: Color.fromRGBO(242, 201, 76, 1),
              borderRadius: BorderRadius.circular(15)),
        ),

        //Padding(padding: EdgeInsets.only(left: 25)),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 15),
          child: Text('Peter Mach',
              style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500)),
              textAlign: TextAlign.left),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 1),
          child: Text('Mind Deep Relax',
              style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              textAlign: TextAlign.left),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 10),
          child: Text(
              'Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.',
              style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              textAlign: TextAlign.left),
        ),

        Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 24, bottom: 14),
          child: ElevatedButton(
              onPressed: () {},
              // ignore: sort_child_properties_last
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: Image(image: AssetImage('assets/shape.png'))),
                Text("Play Next Session",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                    textAlign: TextAlign.center),
              ]),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.all(14),
                  backgroundColor: Color.fromRGBO(3, 158, 162, 1))),
        ),

        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
          padding: EdgeInsets.only(top: 24, bottom: 14),
          child: Row(children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 42, height: 42),
              child: ElevatedButton(
                  onPressed: () => {},
                  child: Image(image: AssetImage('assets/shape.png')),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromRGBO(47, 128, 237, 1))),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("Sweet Memories",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("December 29 Pre-Launch",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    textAlign: TextAlign.center),
              ),
            ]),
            Expanded(child: Container()),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 77, height: 45),
              child: ElevatedButton(
                  onPressed: () => {},
                  // ignore: sort_child_properties_last
                  child: Text('•••',
                      style: GoogleFonts.plusJakartaSans(
                          // ignore: prefer_const_constructors
                          textStyle: TextStyle(
                              height: 0.8,
                              color: Color.fromRGBO(217, 217, 217, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w400)),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      backgroundColor: Colors.transparent)),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
          padding: EdgeInsets.only(top: 24, bottom: 14),
          child: Row(children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 42, height: 42),
              child: ElevatedButton(
                  onPressed: () => {},
                  child: Image(image: AssetImage('assets/shape.png')),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromRGBO(3, 158, 162, 1))),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("A Day Dream",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("December 29 Pre-Launch",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    textAlign: TextAlign.center),
              ),
            ]),
            Expanded(child: Container()),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 77, height: 45),
              child: ElevatedButton(
                  onPressed: () => {},
                  // ignore: sort_child_properties_last
                  child: Text('•••',
                      style: GoogleFonts.plusJakartaSans(
                          // ignore: prefer_const_constructors
                          textStyle: TextStyle(
                              height: 0.8,
                              color: Color.fromRGBO(217, 217, 217, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w400)),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      backgroundColor: Colors.transparent)),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
          padding: EdgeInsets.only(top: 24, bottom: 14),
          child: Row(children: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 42, height: 42),
              child: ElevatedButton(
                  onPressed: () => {},
                  child: Image(image: AssetImage('assets/shape.png')),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Color.fromRGBO(240, 146, 53, 1))),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("Mind Explore",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(30, 30, 30, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, bottom: 2),
                child: Text("December 29 Pre-Launch",
                    style: GoogleFonts.plusJakartaSans(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    textAlign: TextAlign.center),
              ),
            ]),
            Expanded(child: Container()),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 77, height: 45),
              child: ElevatedButton(
                  onPressed: () => {},
                  // ignore: sort_child_properties_last
                  child: Text('•••',
                      style: GoogleFonts.plusJakartaSans(
                          // ignore: prefer_const_constructors
                          textStyle: TextStyle(
                              height: 0.8,
                              color: Color.fromRGBO(217, 217, 217, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.w400)),
                      textAlign: TextAlign.center),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      backgroundColor: Colors.transparent)),
            )
          ]),
        ),
      ]),
    );
  }
}
