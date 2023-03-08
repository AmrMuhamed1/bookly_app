import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utiles/Go_Router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Sliding_Text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState()=>_SplashViewBody();

  }

class _SplashViewBody extends State<SplashViewBody> with SingleTickerProviderStateMixin {


  late AnimationController animation;
  late Animation<Offset> slidinganimation;


  @override
  void initState() {

    super.initState();
    animation = AnimationController(vsync: this ,duration: const Duration(seconds: 1));
    slidinganimation = Tween<Offset>(begin:const Offset  (0,2) ,end:Offset.zero  ).animate(animation);
    animation.forward();
    navigateTOHome();


  }

  @override
  void dispose() {
    super.dispose();

    animation.dispose();
  }
  @override


  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(50.0),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.stretch,

       children: [
         Image.asset('assets/images/Logo.png',fit: BoxFit.cover,),
         SizedBox(height: 4,),

        SlidingText(slidingAnimation: slidinganimation),

       ],
     ),
   );
  }

  void navigateTOHome(){
    Future.delayed(
      const Duration(
        seconds: 3
      ),(){
     GoRouter.of(context).push(AppRouter.KHomeview);
    }

    );


  }



}