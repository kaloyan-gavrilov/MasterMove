import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DisplayBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final Function()? onTap;
  const DisplayBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 86,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, -4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 1,
          )
        ],
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //section name
            Text(
              sectionName,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                  fontWeight: FontWeight.w900),
            ),

            //edit button
            IconButton(onPressed: onTap, icon: Icon(Iconsax.edit))
          ],
        ),
        Text(text)
      ]),
    );
  }
}
