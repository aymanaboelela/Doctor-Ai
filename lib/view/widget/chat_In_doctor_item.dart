import 'package:dr_ai/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/helper/responsive.dart';

class ChatInDoctorItem extends StatelessWidget {
  const ChatInDoctorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
