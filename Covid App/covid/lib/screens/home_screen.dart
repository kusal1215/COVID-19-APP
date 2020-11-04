import 'package:covid/config/palette.dart';
import 'package:covid/config/style.dart';
import 'package:covid/data/data.dart';
import 'package:covid/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPreventiionTips(screenHeight),
          _builYourOwnTest(screenHeight)
        ],
      ),
    );
  }


  SliverToBoxAdapter _buildHeader(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               children: [
                 Text(
                   'COVID-19',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 25.0,
                     fontWeight: FontWeight.bold
                   ),
                 ),
               ],
             ),
             SizedBox(height: screenHeight * 0.03,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'Are you feeling sick?',
                   style:const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.w600,
                     fontSize: 22.0,
                   ),
                 ),
                 SizedBox(height: screenHeight * 0.01,),
                 Text(
                   'If you feel sick with any COVID-19 symptoms, please call us or text us immediately for help',
                   style: const TextStyle(
                     color: Colors.white70,
                     fontSize: 15.0,
                   ),
                 ),
                SizedBox(height: screenHeight * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Style.buttonStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        style: Style.buttonStyle,
                      ),
                      textColor: Colors.white,
                    )
                  ],
                )
               ],
             ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventiionTips(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prevention Tips',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
              .map((e) => Column(
                children: [
                  Image.asset(
                    e.keys.first,
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: screenHeight * 0.015,),
                  Text(
                    e.values.first,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
              .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _builYourOwnTest(double screenHeight){
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10),
        // color: Colors.orange,
        height: screenHeight * 0.2,
        decoration:  BoxDecoration(
          gradient:  LinearGradient(
            colors: [Color(0xFF00ACC1) , Color(0xFF006064)],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do yourown test!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height:  screenHeight * 0.01,),
                Text(
                  'Follow the instructions\ndo your own test. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}