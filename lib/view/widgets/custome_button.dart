import 'package:flutter/material.dart';
import 'package:loginapp/utils/colors.dart';
import 'package:loginapp/view/widgets/text_widget.dart';

Widget customeButton(
    {String? text,
    context,
    image,
    void Function()? onpressed,
    MaterialStateProperty<Color?>? bgColor,
    textcolor}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .9,
    height: MediaQuery.of(context).size.height * .06,
    child: ElevatedButton(
      onPressed: onpressed,
      style: ButtonStyle(
        backgroundColor: bgColor,
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image ??
            const  SizedBox(),
          customeText(text: text, textcolor: textcolor),
        ],
      ),
    ),
  );
}
