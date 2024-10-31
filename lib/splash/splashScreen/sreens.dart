
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hcmobile/screen/auth/login.dart';
import 'package:hcmobile/splash/splashAnimation/splashHome.dart';
import 'package:hcmobile/splash/splashScreen/spalshThree.dart';
import 'package:hcmobile/splash/splashScreen/spalshTow.dart';
import 'package:hcmobile/splash/splashScreen/splashOne.dart';
import 'package:hcmobile/splash/splashScreen/splashZero.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  CarouselSliderController? _carouselController =
      CarouselSliderController();

  final List<Widget> slides = [
    Spalshthree(),
    Spalshtow(),
    Splashone(),
    Splashzero()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController:
                  _carouselController,              items: slides,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.9,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.map((slide) {
              int index = slides.indexOf(slide);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Color.fromARGB(255, 13, 110, 253)
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                     
                      _carouselController
                          ?.nextPage(); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 13, 110, 253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Suivant',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    "Passer...",
                    style: TextStyle(
                      color: Color.fromARGB(255, 13, 110, 253),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
