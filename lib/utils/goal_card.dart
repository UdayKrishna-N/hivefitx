import 'package:flutter/material.dart';

import '../constants.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String description;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        color: Constants.scaffoldBackgroundColor.withOpacity(0.5),
        shadowColor: Constants.primaryColor.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            color: Constants.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Constants.primaryColor.withOpacity(0.15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(imagePath),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.55,
                        child: Text(
                          description,
                          style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold,height: 1.5,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
