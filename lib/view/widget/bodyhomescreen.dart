import 'dart:io';
import 'package:dr_ai/view/widget/chat_In_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/cache/cache.dart';


class BodyHomeScreen extends StatelessWidget {
  BodyHomeScreen({super.key});
  var fullName = CacheData.getdata(key: "fullName");
  var fullNameFire = CacheData.getdata(key: "fullNameFire");
  var image = CacheData.getdata(key: "imageFire");

  List<String> images = [
    "assets/images/heath_1.png",
    "assets/images/heath_2.png",
    "assets/images/heath_3.png",
    "assets/images/heath_4.png",
    "assets/images/heath_5.png",
    "assets/images/heath_6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(35),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/profile",
                (route) => false,
              );
            },
            isThreeLine: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Welcome Back",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            subtitle: Text(
                CacheData.getdata(key: "fullNameFire") ??
                    fullNameFire ??
                    fullName ??
                    "Guest",
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ))),
            leading: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffE0E0E0), width: 2),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                  radius: 20,
                  backgroundImage: CacheData.getdata(key: "uploadImage") != null
                      ? FileImage(File(CacheData.getdata(key: "uploadImage")))
                      : CacheData.getdata(key: "imageFire") != null
                          ? FileImage(File(CacheData.getdata(key: "imageFire")))
                          : null),
            ),
          ),
          const ChatInDoctorItem(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: const Color(0xffFAFAFA),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              images[index],
                              scale: 2,
                            )),
                        Text("Mental Health",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ))),
                        Text("16 Conversations",
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff8D8D8D))))
                      ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
