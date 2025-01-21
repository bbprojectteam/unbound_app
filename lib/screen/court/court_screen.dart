import 'package:badboys/screen/comn/custom_appbar_screen.dart';
import 'package:flutter/material.dart';

class CourtScreen extends StatefulWidget {
  const CourtScreen({
    super.key,
  });


  @override
  State<CourtScreen> createState() => _CourtScreenState();
}

class _CourtScreenState extends State<CourtScreen> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbarScreen(
                isNotification : true,
                isListMenu : false,
              ),
              SizedBox(height: 30,),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/testImage1.png',
                  width: maxWidth * 0.85,
                  height: maxHeight * 0.3,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 30,),

              Container(
                color: Colors.grey,
                width: maxWidth * 0.9,
                height: 1,
              ),

              Row(
                children: [
                  Text('123123',)
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
}
