// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Guides extends StatefulWidget {
  const Guides({Key? key}) : super(key: key);

  @override
  State<Guides> createState() => _GuidesState();
}

class _GuidesState extends State<Guides> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: demo_data.length,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(demo_data.length, (index) => Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: DotIndicator(isActive: index == _pageIndex),
                )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.black,
                      elevation: 0,
                    ),
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Colors.white,),
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false
  }): super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: isActive ? 12 : 6,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image, 
    required this.title, 
    required this.description
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/hero1.png",
    title: "Find the item you've\nbeen looking for",
    description: "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience.",
  ),
  Onboard(
    image: "assets/images/hero2.png",
    title: "Get those shopping\nbags filled",
    description: "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience.",
  ),
  Onboard(
    image: "assets/images/hero3.png",
    title: "Fast & secure\npayment",
    description: "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience.",
  )
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key, 
    required this.image, 
    required this.title, 
    required this.description
  }): super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(),
            Image.asset(image, 
            height: 250
          ),
          const Spacer(),
          Text(title, style: GoogleFonts.inter(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          const SizedBox(height: 16),
          Text(description, style: GoogleFonts.inter(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
          const Spacer()
        ],
      )
    );
  }
}

// "assets/images/hero1.png"
// "Find the item you've\nbeen looking for"
// "Here you'll see rich varieties of goods, carefully classified for seamless browsing experience."