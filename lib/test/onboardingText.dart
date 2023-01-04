import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.004),
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.black,
                        dotColor: Color.fromARGB(179, 106, 207, 224))),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.amber,
                child: PageView(
                  controller: controller,
                  children: [
                    Center(
                      child: Container(
                        child: (const Text('Text 1')),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: (const Text('Text 2')),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: (const Text('Text 3')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
