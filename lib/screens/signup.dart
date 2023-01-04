import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summarizer/screens/staticbar.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:summarizer/services/firebase_auth_methods.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
//dispose method
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    fireBaseAuthMethods(FirebaseAuth.instance).signUpwithEmail(
        email: emailController.text,
        pass: passwordController.text,
        confirmpass: confirmPasswordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Sign up.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: const Color.fromARGB(255, 250, 180, 0),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(45))),

            //column child for adding signup fields
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.22),
              ),
              Text(
                'Create Account',
                style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 243, 243, 243),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: emailController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 40,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Username/Email',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 70, 70, 70),
                        fontWeight: FontWeight.w200,
                        fontSize: 13),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: passwordController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 20,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 70, 70, 70),
                        fontWeight: FontWeight.w200,
                        fontSize: 13),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: const Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: confirmPasswordController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 20,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 70, 70, 70),
                        fontWeight: FontWeight.w200,
                        fontSize: 13),
                    contentPadding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: OutlinedButton(
                    onPressed: () {
                      signUpUser();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: const BorderSide(
                          width: 1, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(),
              Container(
                  child: (TextButton(
                      onPressed: () {},
                      child: (Text(
                        'Already Have an Account?',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 94, 197, 255)),
                      ))))),
              const SizedBox(),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(() {});

                      User? user = await fireBaseAuthMethods.signInWithGoogle(
                          context: context);

                      setState(() {});

                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const staticbar(),
                          ),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: const BorderSide(
                          width: 1, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: Text('Google'),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
