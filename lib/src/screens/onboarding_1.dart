import 'dart:io';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final int _totalPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
//      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
              setState(() {});
            },
            children: <Widget>[
              _buildPageContent(
                  image: 'assets/onboardings/onboarding1.png',
                  title: 'This is where your journey starts. ',
                  body:
                  'Welcome to Khud Mukhtar - a platform for you to connect, empower, and be empowered.'),
              _buildPageContent(
                  image: 'assets/onboardings/onboarding2.png',
                  title: 'Earn your financial independence.',
                  body:
                  'Add your service and earn from the comfort of your home.'),
              _buildPageContent(
                  image: 'assets/onboardings/onboarding3.png',
                  title: 'Save time - Search what you need.',
                  body:
                  'Want to find someone who can teach you and is available in your area? Search by category, service type, location, and much more.'),
              _buildPageContent(
                  image: 'assets/onboardings/onboarding4.png',
                  title: 'Get Connected',
                  body:
                  'Its time to get connected with your fellow women and get more information. ')
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage != 3
          ? Container(
        margin: EdgeInsets.symmetric(vertical: 16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _pageController.animateToPage(3,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {});
              },
              splashColor: Color.fromRGBO(240,96,146,1),
              child: Text(
                'SKIP',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(240,96,146,1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Row(children: [
                for (int i = 0; i < _totalPages; i++)
                  i == _currentPage
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false)
              ]),
            ),
            FlatButton(
              onPressed: () {
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {});
              },
              splashColor: Colors.blue[50],
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(240,96,146,1),
                    fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      )
          : RaisedButton(
        onPressed: () {},
        child: Container(
          height: Platform.isIOS ? 70 : 60,
          color: Color.fromRGBO(240,96,146,1),
          alignment: Alignment.center,
          child: Text(
            'GET STARTED NOW',
            style: TextStyle(
                color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildPageContent({
    String image,
    String title,
    String body,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(image),
          ),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
                fontSize: 20, height: 2.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            body,
            style: TextStyle(fontSize: 15, height: 2.0),
          ),
        ],
      ),
    );
  }
}