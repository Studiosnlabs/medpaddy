import 'package:flutter/material.dart';
import 'package:medpaddy/screens/SignIn_Screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onBoarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage=false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 45),
        child: PageView(
          controller: controller,
          onPageChanged: (index){
            setState(() {
              isLastPage=index==2;
            });
          },
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff55C97C).withOpacity(0.5),
                    Color(0xff7AEADA).withOpacity(0.9),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 1],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/chatwithdoctorstory.png',height:400,fit: BoxFit.fitWidth, width:double.infinity ,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Chat with a\nDoctor',style: TextStyle(fontSize: 31,color:Color(0xff3B3B82),fontWeight: FontWeight.bold,height: 1 ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Have conversations about health issues on forums and private chats with Medical Doctors you can trust.',style: TextStyle(color:Color(0xff3B3B82))),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff55C97C).withOpacity(0.5),
                    Color(0xff7AEADA).withOpacity(0.9),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 1],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/prescritionstory.png',height:400,fit: BoxFit.fitWidth, width:double.infinity ,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Prescription Helper',style: TextStyle(fontSize: 31,color:Color(0xff3B3B82),fontWeight: FontWeight.bold,height: 1 ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Prescriptions are now simplified,receive notification when you are suppose to take medication and set your personal reminders.',style: TextStyle(color:Color(0xff3B3B82))),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff57CB81).withOpacity(0.6),
                    Color(0xff78E8D6).withOpacity(0.9),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 1],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/bookappointmentstory.png',height:400,fit: BoxFit.fitWidth, width:double.infinity ,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Book appointments with Doctors',style: TextStyle(fontSize: 31,color:Color(0xff3B3B82),fontWeight: FontWeight.bold,height: 1 ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Make and manage appointments to the hospital from your phone',style: TextStyle(color:Color(0xff3B3B82))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet:isLastPage ? MaterialButton( minWidth:double.infinity,onPressed: (){
        Navigator.of(context).pushNamed(SignInScreen.routeName);
      }, child: Text('Get Started',style: TextStyle(fontSize: 24,color: Color(0xff3B3B82)),)): Container(
        color: Color(0xff3B3B82),
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  controller.jumpToPage(2);
                },
                child: Text(
                  'SKIP',
                )),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.grey,dotHeight: 10,dotWidth: 10,
                  activeDotColor: Theme.of(context).colorScheme.secondary),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn),
            ),
            TextButton(
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Text('NEXT')),
          ],
        ),
      ),
    );
  }
}
