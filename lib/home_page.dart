import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboardingexample1/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*onBoardingData List start  here*/
  List onBoardingData=[
    {
      'image':'assets/images/screen1.png',
      'title':'Care Your Family',
      'description':'The process cam include educating new'
    },
    {
      'image':'assets/images/screen2.png',
      'title':'Act ahead of time!',
      'description':'No holding back'
    },
    {
      'image':'assets/images/screen3.png',
      'title':'Go ahead....!!',
      'description':'See the world....'
    },
  ];
  /*onBoardingData List end  here*/
  Color whiteColor=Colors.white;
  Color otherColor= const Color(0xFF19173D);
  PageController pageController = PageController();
  continueMethod(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen(),),
    );
  }
  int currentPage=0;
  onChanged(int index){
    setState(() {
      currentPage=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(onPressed: continueMethod, child: Text('Skip',style: TextStyle(
            color: otherColor,
          ),),),
        ],
      ),
      body: Stack(children: [
        //
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: onBoardingData.length,
          onPageChanged: onChanged,
          itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset( onBoardingData[index]['image']),
                Text(onBoardingData[index]['title'],style:TextStyle(fontSize: 20,color: otherColor),),
                const SizedBox(height: 20,),
                Text(onBoardingData[index]['description'],style:TextStyle(fontSize: 20,color: otherColor),),
              ],
            );
          },
        ),
        //
        /*last portion start here*/
        Padding(padding: const EdgeInsets.only(bottom:50),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            (currentPage==(onBoardingData.length-1))?ElevatedButton(onPressed: continueMethod, child:
            Text('CONTINUE'),):Row(children:
              List<Widget>.generate( onBoardingData.length, (index){
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 3),
                  height: 10,
                  width: (index==currentPage)?15:10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 ),
                  color: (index==currentPage)?Colors.deepOrange:Colors.grey,
                  ),
                  
                );
              })  ,          ),
          ],),
    ),
        /*last portion end here*/
      ],),
    );
  }
}
