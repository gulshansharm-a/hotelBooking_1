import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hotel_booking_app/screens/empty_screens/location.dart';

import '../../styles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromRGBO(255, 255, 255, 100),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      "Confirm your number",
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Enter the 4-digit OTP',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    OtpTextField(
                      numberOfFields: 4,
                      showFieldAsBox: false,
                      onCodeChanged: (val) {
                        if (val.length > 0) {
                          isChanged = true;
                          setState(() {});
                        } else {
                          setState(() {});
                          isChanged = false;
                        }
                      },
                      borderWidth: 4.0,
                      autoFocus: false,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textStyle: TextStyle(color: Colors.black, fontSize: 25),
                      // fillColor: Colors.black,
                      focusedBorderColor: Colors.black,
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend code',
                  style: TextStyle(
                    color: Color.fromRGBO(242, 143, 59, 100),
                  ),
                ),
              ),
              Container(
                // height: 5,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  gradient: isChanged
                      ? blueGradient()
                      : const LinearGradient(
                          colors: [
                            Color.fromRGBO(94, 94, 94, 1),
                            Color.fromRGBO(94, 94, 94, 1)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                ),
                child: MaterialButton(
                  height: 45,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen()));
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
