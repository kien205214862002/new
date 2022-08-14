import 'package:familiar_stranger_v2/ui/components/backgrounds/welcome_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/welcome/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool opening = false;
  @override
  void initState()
  {
    Future.delayed(const Duration(seconds: 1), (){
      setState(() {
        opening = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: WelcomeBG(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 4),
              scale: opening ? 1.0 : 0.0,
              onEnd: (){
                Future.delayed(const Duration(seconds: 2), (){
                  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                });
              },
              child: SizedBox(
                height: 150*size.height/896,
                width: 200*size.width/414,
                child: Image.asset('assets/images/Logo.png', fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
    );
  }
}
