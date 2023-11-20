
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/utils/images.dart';
import 'package:loginapp/utils/texts.dart';
import 'package:loginapp/utils/variables.dart';
import 'package:loginapp/view/login_screen/login_screen.dart';
import 'package:loginapp/view/login_screen/signup_page.dart';
import 'package:loginapp/view/widgets/custome_button.dart';

class ContentsOfSplashScreen extends StatefulWidget {
  const ContentsOfSplashScreen({super.key});

  @override
  State<ContentsOfSplashScreen> createState() => _ContentsState();
}

PageController _pageController = PageController();
int currentPage = 0;

class _ContentsState extends State<ContentsOfSplashScreen> {
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final List<Widget> slides = [
      firstSlide(),
      secondSlide(),
      thirdSlide(context)
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: hight! * 0.91,
              width: width,
              child: PageView(
                controller: _pageController,
                children: slides,
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              )),
          SizedBox(
            height: hight! * 0.05,
            width: width,
            child: DotsIndicator(
              dotsCount: slides.length,
              position: currentPage,
              decorator: const DotsDecorator(
                  spacing: EdgeInsets.all(15), activeColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

Widget firstSlide() {
  return Column(
    children: [
      SizedBox(
        height: hight! * 0.1,
      ),
      Center(
        child: Container(
            height: hight! * 0.5,
            width: width! * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: firstSlideImage),
      ),
      SizedBox(
        height: hight! * 0.03,
      ),
      SizedBox(
        height: hight! * 0.09,
        width: width! * 0.9,
        child: firstSlideTextMain,
      ),
      SizedBox(
        height: hight! * 0.025,
      ),
      SizedBox(
        height: hight! * 0.06,
        width: width! * 0.9,
        child: firstSlideTextsub,
      ),
    ],
  );
}

Widget secondSlide() {
  return Column(
    children: [
      SizedBox(
        height: hight! * 0.1,
      ),
      Center(
        child: Container(
            height: hight! * 0.5,
            width: width! * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: secondSlideImage),
      ),
      SizedBox(
        height: hight! * 0.03,
      ),
      SizedBox(
        height: hight! * 0.09,
        width: width! * 0.9,
        child: secondSlideTextMain,
      ),
      SizedBox(
        height: hight! * 0.025,
      ),
      SizedBox(
        height: hight! * 0.06,
        width: width! * 0.9,
        child: secondSlideTextsub,
      ),
    ],
  );
}

Widget thirdSlide(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: hight! * 0.08,
      ),
      Center(
        child: Container(
            height: hight! * 0.6,
            width: width! * 0.9,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: thirdSlideImage),
      ),
      SizedBox(
        height: hight! * 0.05,
      ),
      customeButton(
        bgColor: const MaterialStatePropertyAll(Colors.black),
        text: "Login",
        context: context,
        onpressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Loginscreen(),
              ));
          // Please change the route from here //
        },
      ),
      SizedBox(
        height: hight! * 0.02,
      ),
      customeButton(
        bgColor: const MaterialStatePropertyAll(Colors.black),
        text: "SignUp",
        context: context,
        onpressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupPage(),
              ));
          // Please change the route from here //
        },
      )
    ],
  );
}
