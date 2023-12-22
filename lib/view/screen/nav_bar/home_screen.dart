import 'dart:io';
import 'package:dr_ai/core/cache/cache.dart';
import 'package:dr_ai/core/helper/responsive.dart';
import 'package:dr_ai/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
              title: Text("Welcome Back",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                    fontSize: 10,
                  ))),
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
                    border:
                        Border.all(color: const Color(0xffE0E0E0), width: 2),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                    radius: 20,
                    backgroundImage: CacheData.getdata(key: "uploadImage") !=
                            null
                        ? FileImage(File(CacheData.getdata(key: "uploadImage")))
                        : CacheData.getdata(key: "imageFire") != null
                            ? FileImage(
                                File(CacheData.getdata(key: "imageFire")))
                            : null),
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                title: Column(
                  children: [
                    SizedBox(height: ScreenSize.height * 0.01152),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Chat in Doctor AI",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff00A859)))),
                    ),
                    SizedBox(height: ScreenSize.height * 0.005764),
                    Text(
                        "You can ask your medical questions And know the required medicines",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xff858585)))),
                    SizedBox(height: ScreenSize.height * 0.02882),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(right: ScreenSize.width * 0.1701388),
                  child: CustomButton(
                      borderRadius: 8,
                      fontSize: 12,
                      height: 33,
                      width: 125,
                      color: const Color(0xff00A859),
                      title: "Start Chat",
                      onPressed: () {
                        Navigator.pushNamed(context, "/chat");
                      }),
                ),
                trailing: Image.asset(
                  "assets/images/robot.png",
                  scale: 0.1,
                  width: 50, //!
                  height: 90, //!
                ),
              ),
            ),
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
      ),
    );
  }
}
