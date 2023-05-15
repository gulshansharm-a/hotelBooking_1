import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/OTP/otp.dart';
import 'package:hotel_booking_app/styles.dart';
import 'package:hotel_booking_app/utils/constant.dart';

class AddNo extends StatefulWidget {
  const AddNo({super.key});

  @override
  State<AddNo> createState() => _AddNoState();
}

class _AddNoState extends State<AddNo> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: MaterialButton(
                      color: Color.fromRGBO(61, 153, 238, 1),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height(context) * 0.1,
              ),
              const Text(
                "Lets get Started",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Enter your mobile number, and we will send a \ncode to confirm it. SMS rates may apply',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                height: height(context) * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "+91",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      autofocus: true,
                      // onSubmitted: (hasFocus) {
                      //   setState(() {
                      //     isChange = !isChange;
                      //   });
                      // },
                      onChanged: (val) {
                        if (val.length > 0) {
                          isChange = true;
                          setState(() {});
                        } else {
                          setState(() {});
                          isChange = false;
                        }
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: " 732 842 84 92",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                // height: 5,
                decoration: BoxDecoration(
                  gradient: isChange
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
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  height: 45,
                  padding: const EdgeInsets.only(top: 5, bottom: 5),

                  // : const Color.fromRGBO(94, 94, 94, 1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OtpScreen()));
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
