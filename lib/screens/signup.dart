import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:summarizer/screens/summarizer.dart';
import 'package:summarizer/services/firebase_auth_methods.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
//dispose method
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
    bool _isSigningIn = false;
    return Container(
      //color: Color.fromARGB(255, 177, 20, 20),

      decoration: BoxDecoration(
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
                  color: Color.fromARGB(255, 250, 180, 0),
                ),
                borderRadius: BorderRadius.all(Radius.circular(45))),

            //column child for adding signup fields
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.22),
              ),
              Text(
                'Create Account',
                // style: TextStyle(
                //   color: Color.fromARGB(255, 156, 156, 156),
                //   fontSize: 35,
                //   fontFamily: 'Med',
                // ),
                style: GoogleFonts.inter(
                  color: Color.fromARGB(255, 243, 243, 243),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: emailController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 40,
                  decoration: InputDecoration(
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: passwordController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 20,
                  decoration: InputDecoration(
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
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.68,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 8, 22),
                    border: Border.all(
                      width: 0.5,
                      color: Color.fromARGB(255, 109, 241, 180),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: TextField(
                  controller: confirmPasswordController,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
                  maxLength: 20,
                  decoration: InputDecoration(
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
              SizedBox(
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
                      side: BorderSide(
                          width: 1, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(),
              Container(
                  child: (TextButton(
                      onPressed: () {},
                      child: (new Text(
                        'Already Have an Account?',
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 94, 197, 255)),
                      ))))),
              SizedBox(),
              // Container(
              //   padding: const EdgeInsets.only(bottom: 16.0),
              //   child: _isSigningIn
              //       ? CircularProgressIndicator(
              //           valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //         )
              //       : OutlinedButton(
              //           style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.white),
              //             shape: MaterialStateProperty.all(
              //               RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(40),
              //               ),
              //             ),
              //           ),
              //           onPressed: () async {
              //             setState(() {
              //               _isSigningIn = true;
              //             });

              //             User? user = await fireBaseAuthMethods
              //                 .signInWithGoogle(context: context);

              //             setState(() {
              //               _isSigningIn = false;
              //             });

              //             if (user != null) {
              //               Navigator.of(context).pushReplacement(
              //                 MaterialPageRoute(
              //                   builder: (context) => summarizer(),
              //                 ),
              //               );
              //             }
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //             child: Row(
              //               mainAxisSize: MainAxisSize.min,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: <Widget>[
              //                 // Image(
              //                 //   image: AssetImage("assets/google_logo.png"),
              //                 //   height: 35.0,
              //                 // ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 10),
              //                   child: Text(
              //                     'Sign in with Google',
              //                     style: TextStyle(
              //                       fontSize: 20,
              //                       color: Colors.black54,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              // ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningIn = true;
                      });

                      User? user = await fireBaseAuthMethods.signInWithGoogle(
                          context: context);

                      setState(() {
                        _isSigningIn = false;
                      });

                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => summarizer(),
                          ),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: BorderSide(
                          width: 1, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
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
