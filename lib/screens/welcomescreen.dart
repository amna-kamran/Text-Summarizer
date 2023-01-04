// ignore: duplicate_ignore
// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:summarizer/screens/signup.dart';
import 'staticbar.dart';

// ignore: camel_case_types
class welcomescreen extends StatefulWidget {
  const welcomescreen({super.key});

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Section 19.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 380),
              // Container(
              //   child: Scaffold(
              //     body: Center(
              //       child: Container(
              //         // padding: EdgeInsets.only(
              //         //     top: MediaQuery.of(context).size.height * 0.2),
              //         child: Column(
              //           children: [
              //             Container(
              //               padding: EdgeInsets.only(
              //                   bottom:
              //                       MediaQuery.of(context).size.height * 0.004),
              //               child: SmoothPageIndicator(
              //                   controller: controller,
              //                   count: 3,
              //                   effect: WormEffect(
              //                       dotHeight: 10,
              //                       dotWidth: 10,
              //                       activeDotColor: Colors.black,
              //                       dotColor:
              //                           Color.fromARGB(179, 106, 207, 224))),
              //             ),
              //             Container(
              //               height: MediaQuery.of(context).size.height / 4,
              //               width: MediaQuery.of(context).size.width * 0.7,
              //               color: Colors.amber,
              //               child: PageView(
              //                 controller: controller,
              //                 children: [
              //                   Center(
              //                     child: Container(
              //                       child: (Text('Text 1')),
              //                     ),
              //                   ),
              //                   Center(
              //                     child: Container(
              //                       child: (Text('Text 2')),
              //                     ),
              //                   ),
              //                   Center(
              //                     child: Container(
              //                       child: (Text('Text 3')),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.004),
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                        dotHeight: 9,
                        dotWidth: 9,
                        spacing: 5,
                        activeDotColor: Color.fromARGB(179, 109, 241, 180),
                        dotColor: Color.fromARGB(179, 56, 20, 56))),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.transparent,
                child: PageView(
                  controller: controller,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 10,
                          right: 30,
                        ),
                        child: (Text(
                          'Text summarizer is a tool that wraps up a text to a specified short length.'
                          'It condenses a long article to main points.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 10,
                          right: 30,
                        ),
                        child: (Text(
                          '...',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: (const Text(
                          '->',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.002),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const staticbar(),
                              type: PageTransitionType.rightToLeft));
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: const BorderSide(
                          width: 0.4, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.008),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.56,
                  height: MediaQuery.of(context).size.height * 0.058,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const signup(),
                              type: PageTransitionType.rightToLeft));
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      side: const BorderSide(
                          width: 0.4, color: Color.fromRGBO(109, 241, 180, 1)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                  child: (TextButton(
                      onPressed: () {},
                      child: (const Text(
                        'Already Have an Account?',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 94, 197, 255)),
                      ))))),
            ],
          ),
        ),
      ),
    );
  }
}
