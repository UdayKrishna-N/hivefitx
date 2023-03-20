import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hivefitx/screens/data_screens/registration_page2.dart';
import 'package:hivefitx/services/firebase_services.dart';
import 'package:hivefitx/utils/button.dart';


class RegistrationPage1 extends StatefulWidget {
  const RegistrationPage1({Key? key}) : super(key: key);

  @override
  State<RegistrationPage1> createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  String? _gender;
  List<String> genders = ['Male', 'Female'];

  TextEditingController ageController = TextEditingController();
  TextEditingController currentWeightController = TextEditingController();
  TextEditingController targetWeightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Image.asset('assets/images/registration1.png'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Let’s complete your profile',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              height: 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'It will help us to know more about you!',
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
            ),
          ),
          Spacer(),
          //  choose gender
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                borderRadius: BorderRadius.circular(12),
                menuMaxHeight: 300,
                items: genders
                    .map(
                      (value) =>
                      DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                )
                    .toList(),
                icon: Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                      color: Colors.black87,
                    )),
                hint: Text(
                  'Select Gender ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                value: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // age
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Age',
                hintStyle: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Icon(Icons.calendar_today_outlined, size: 20,
                  color: Colors.black87,),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // current weight
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              controller: currentWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Current Weight',
                hintStyle: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Icon(Icons.monitor_weight_outlined, size: 24,
                  color: Colors.black87,),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Target weight
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              controller: targetWeightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Target weight',
                hintStyle: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Icon(Icons.monitor_weight_outlined, size: 24,
                  color: Colors.black87,),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // height
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Height in cms',
                hintStyle: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                prefixIcon: Icon(Icons.height_outlined, size: 20,
                  color: Colors.black87,),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Button(btnText: 'Continue', onTap: () {
              // FirebaseServices().addUserData(
              //     _gender!, int.parse(ageController.text),
              //     int.parse(currentWeightController.text),
              //     int.parse(targetWeightController.text),
              //     int.parse(heightController.text));
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => RegistrationPage2(),),);
            }),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
