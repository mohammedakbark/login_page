import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/utils/colors.dart';
import 'package:loginapp/utils/images.dart';
import 'package:loginapp/utils/variables.dart';
import 'package:loginapp/view/widgets/custom_textfield.dart';
import 'package:loginapp/view/widgets/custome_button.dart';
import 'package:loginapp/view/widgets/text_widget.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        brandName(28.0, Colors.black, FontWeight.w600),
        ListTile(
          title: Text(
            "Welcome !",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          subtitle: Text("Please login or sign up to continue our app",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          width: width! * .87,
          height: hight! * .176,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customeTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter email address";
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "enter correct email address";
                    }
                    return null;
                  },
                  labelText: "Email",
                ),
                customeTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      }
                      if (value.length < 8) {
                        return "password must be  8 digit ";
                      }
                      return null;
                    },
                    labelText: "Password",
                    obsecure: isPasswordHide,
                    icon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHide = !isPasswordHide;
                          });
                        },
                        icon: isPasswordHide ? hideImage : viewImage)),
              ],
            ),
          ),
        ),
        Column(
          children: [
            customeButton(
                context: context,
                text: 'Login',
                onpressed: () {
                  setState(
                    () {
                      if (_formKey.currentState!.validate()) {
                        instence.login(
                            emailController.text, passwordController.text,context);
                      }
                    },
                  );
                },
                bgColor: const MaterialStatePropertyAll(Colors.black)),
            const Text(
              "or",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            customeButton(
                context: context,
                text: 'Sign Up with Google',
                textcolor: black,
                image: Image.asset('assets/images/googlelogo.png'),
                onpressed: () {},
                bgColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 255, 255))),
          ],
        ),
      ]),
    ));
  }
}
