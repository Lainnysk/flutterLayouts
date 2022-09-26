import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class meditate extends StatefulWidget {
  const meditate({super.key});

  @override
  State<meditate> createState() => _meditate();
}

class _meditate extends State<meditate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(235, 235, 235, 1)))),
          padding: EdgeInsets.only(top: 60, left: 24, right: 30, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Meditate"),
                      maxLines: 1,
                      minLines: 1,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700)),
                      textAlign: TextAlign.left)),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 55, height: 55),
                child: ElevatedButton(
                    onPressed: () => {},
                    // ignore: sort_child_properties_last
                    child: Image(image: AssetImage("assets/lens.png")),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: Colors.transparent)),
              )
            ],
          )),
      Expanded(
          child: Stack(children: [
        Expanded(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            //first main block
            Container(
                margin: EdgeInsets.only(left: 24, right: 24, bottom: 17),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(250, 250, 250, 1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: const Offset(0, 0.7))
                    ]),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        //padding: EdgeInsets.only(top: 25, left: 24, right: 24),
                        margin: EdgeInsets.only(top: 75),
                        alignment: Alignment.topCenter,
                        child: Image(image: AssetImage('assets/sunmoon.png')),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 201, 76, 1),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 11, left: 12),
                        child: Text("A Song of Moon",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            textAlign: TextAlign.left),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.85, left: 12),
                        child: Text("Start with the basics",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(top: 14, left: 12, right: 12),
                          //margin: ,
                          child: Row(children: [
                            SizedBox(
                                height: 10,
                                width: 11.4,
                                child: Image(
                                    image: AssetImage("assets/heart.png"))),
                            Padding(
                                padding: EdgeInsets.only(left: 6.88),
                                child: Text("9 Sessions",
                                    style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.5),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    textAlign: TextAlign.left)),
                            Expanded(child: Container()),
                            ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: 75, height: 45),
                                child: ElevatedButton(
                                    onPressed: () => {},
                                    // ignore: sort_child_properties_last
                                    child: Row(children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 4.8),
                                          child: Text("Start",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      textStyle: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.5),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                              textAlign: TextAlign.left)),
                                      SizedBox(
                                          height: 7.79,
                                          width: 4.65,
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/forward.png"))),
                                    ]),
                                    style: ElevatedButton.styleFrom(
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        backgroundColor: Colors.transparent))),
                          ]))
                    ])),

            //-------------------------------------------
            Row(children: [
              Expanded(
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 23, right: 8.86, bottom: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset: const Offset(0, 0.7))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 98.87,
                              width: 167,
                              //padding: EdgeInsets.only(top: 25, left: 24, right: 24),
                              //margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.center,
                              child:
                                  Image(image: AssetImage('assets/birds.png')),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(240, 146, 53, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 11, left: 12),
                              child: Text("The Sleep Hour",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.85, left: 12),
                              child: Text("Ashna Mukherjee",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 6, left: 12),
                                //margin: ,
                                child: Row(children: [
                                  SizedBox(
                                      height: 6.67,
                                      width: 7.5,
                                      child: Image(
                                          image:
                                              AssetImage("assets/heart.png"))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text("3 Sessions",
                                          style: GoogleFonts.plusJakartaSans(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          textAlign: TextAlign.left)),
                                  Expanded(child: Container()),
                                  SizedBox(
                                      width: 50,
                                      height: 35,
                                      child: ElevatedButton(
                                          onPressed: () => {},
                                          // ignore: sort_child_properties_last
                                          child: Row(children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, right: 4.8),
                                                child: Text("Start",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            textStyle: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    textAlign: TextAlign.left)),
                                            SizedBox(
                                                height: 4.28,
                                                width: 2.55,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/forward.png"))),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  Colors.transparent))),
                                ]))
                          ]))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 6, right: 23, bottom: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset: const Offset(0, 0.7))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 98.87,
                              width: 167,
                              //padding: EdgeInsets.only(top: 25, left: 24, right: 24),
                              //margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.topCenter,
                              child: Image(
                                  image: AssetImage('assets/cloudmoon.png')),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(242, 201, 76, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 11, left: 11),
                              child: Text("Easy on Mission",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.85, left: 12),
                              child: Text("Peter Mach",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 6, left: 12),
                                //margin: ,
                                child: Row(children: [
                                  SizedBox(
                                      height: 6.67,
                                      width: 7.5,
                                      child: Image(
                                          image:
                                              AssetImage("assets/heart.png"))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text("3 Sessions",
                                          style: GoogleFonts.plusJakartaSans(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          textAlign: TextAlign.left)),
                                  Expanded(child: Container()),
                                  SizedBox(
                                      width: 50,
                                      height: 35,
                                      child: ElevatedButton(
                                          onPressed: () => {},
                                          // ignore: sort_child_properties_last
                                          child: Row(children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, right: 4.8),
                                                child: Text("Start",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            textStyle: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    textAlign: TextAlign.left)),
                                            SizedBox(
                                                height: 4.28,
                                                width: 2.55,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/forward.png"))),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  Colors.transparent))),
                                ]))
                          ]))),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                      margin:
                          EdgeInsets.only(left: 23, right: 8.86, bottom: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset: const Offset(0, 0.7))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 98.87,
                              width: 167,
                              //padding: EdgeInsets.only(top: 25, left: 24, right: 24),
                              //margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.center,
                              child: Image(
                                  image: AssetImage('assets/moonmoon.png')),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(47, 128, 237, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 11, left: 12),
                              child: Text("Relax with Me",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.85, left: 12),
                              child: Text("Amanda James",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 6, left: 12),
                                //margin: ,
                                child: Row(children: [
                                  SizedBox(
                                      height: 6.67,
                                      width: 7.5,
                                      child: Image(
                                          image:
                                              AssetImage("assets/heart.png"))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text("3 Sessions",
                                          style: GoogleFonts.plusJakartaSans(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          textAlign: TextAlign.left)),
                                  Expanded(child: Container()),
                                  SizedBox(
                                      width: 50,
                                      height: 35,
                                      child: ElevatedButton(
                                          onPressed: () => {},
                                          // ignore: sort_child_properties_last
                                          child: Row(children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, right: 4.8),
                                                child: Text("Start",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            textStyle: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    textAlign: TextAlign.left)),
                                            SizedBox(
                                                height: 4.28,
                                                width: 2.55,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/forward.png"))),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  Colors.transparent))),
                                ]))
                          ]))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 6, right: 23, bottom: 17),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(250, 250, 250, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 0,
                                offset: const Offset(0, 0.7))
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 98.87,
                              width: 167,
                              //padding: EdgeInsets.only(top: 25, left: 24, right: 24),
                              //margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.center,
                              child:
                                  Image(image: AssetImage('assets/birds.png')),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(3, 158, 162, 1),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 11, left: 11),
                              child: Text("Sun and Energy",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.85, left: 12),
                              child: Text("Micheal Hiu",
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.5),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 6, left: 12),
                                child: Row(children: [
                                  SizedBox(
                                      height: 6.67,
                                      width: 7.5,
                                      child: Image(
                                          image:
                                              AssetImage("assets/heart.png"))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Text("5 minutes",
                                          style: GoogleFonts.plusJakartaSans(
                                              textStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)),
                                          textAlign: TextAlign.left)),
                                  Expanded(child: Container()),
                                  SizedBox(
                                      width: 50,
                                      height: 35,
                                      child: ElevatedButton(
                                          onPressed: () => {},
                                          // ignore: sort_child_properties_last
                                          child: Row(children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, right: 4.8),
                                                child: Text("Start",
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            textStyle: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.5),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                    textAlign: TextAlign.left)),
                                            SizedBox(
                                                height: 4.28,
                                                width: 2.55,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/forward.png"))),
                                          ]),
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              backgroundColor:
                                                  Colors.transparent))),
                                ]))
                          ]))),
            ]),
          ]),
        )),
        Padding(
            padding: EdgeInsets.only(top: 14),
            child: SizedBox(
              height: 38,
              child: ListView(
                //padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10, left: 23),
                      child: Expanded(
                          child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(),
                        child: ElevatedButton(
                            onPressed: () => {},
                            // ignore: sort_child_properties_last
                            child: Text("All",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor:
                                    Color.fromRGBO(3, 158, 162, 1))),
                      ))),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Expanded(
                          child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(),
                        child: ElevatedButton(
                            onPressed: () => {},
                            // ignore: sort_child_properties_last
                            child: Text("Bible In a Year",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(3, 158, 162, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor:
                                    Color.fromRGBO(230, 254, 255, 1))),
                      ))),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Expanded(
                          child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(),
                        child: ElevatedButton(
                            onPressed: () => {},
                            // ignore: sort_child_properties_last
                            child: Text("Dailies",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(3, 158, 162, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor:
                                    Color.fromRGBO(230, 254, 255, 1))),
                      ))),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Expanded(
                          child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(),
                        child: ElevatedButton(
                            onPressed: () => {},
                            // ignore: sort_child_properties_last
                            child: Text("Minutes",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(3, 158, 162, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor:
                                    Color.fromRGBO(230, 254, 255, 1))),
                      ))),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Expanded(
                          child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(),
                        child: ElevatedButton(
                            onPressed: () => {},
                            // ignore: sort_child_properties_last
                            child: Text("November",
                                style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(
                                        color: Color.fromRGBO(3, 158, 162, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                textAlign: TextAlign.center),
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor:
                                    Color.fromRGBO(230, 254, 255, 1))),
                      ))),
                ],
              ),
            )),
      ]))
    ]));
  }
}
