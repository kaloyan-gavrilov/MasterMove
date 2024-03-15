import 'package:flutter/material.dart';

class CourseTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String imageAddress;
  const CourseTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imageAddress),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
