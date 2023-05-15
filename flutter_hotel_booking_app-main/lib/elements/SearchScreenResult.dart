import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/styles.dart';
import 'package:hotel_booking_app/utils/constant.dart';
import 'package:hotel_booking_app/widgets.dart';
import 'package:intl/intl.dart';

class SearchScreenResult extends StatefulWidget {
  final String searchQuery;
  SearchScreenResult({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreenResult> createState() => _SearchScreenResultState();
}

class _SearchScreenResultState extends State<SearchScreenResult> {
  TextEditingController date = TextEditingController();
  int count1 = 1;
  int count2 = 1;

  int count3 = 1;
  String dropDownStringValue1 = 'Popular';
  String dropDownStringValue2 = 'Price';
  String dropDownStringValue3 = 'Star rating';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.2),
        child: Container(
          margin: const EdgeInsets.only(top: 44),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: greyLight,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.searchQuery,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.search,
                        size: 28,
                        color: activeBlueColor,
                      ),
                      Text(
                        'search',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: activeBlueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: TextField(
                          controller: date,
                          onTap: () async {
                            var pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                date.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, bottom: 18),
                              hintText: 'Aug 23-Aug 24',
                              hintStyle: GoogleFonts.lato(
                                color: activeBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        showSelectGuestAndRooms(context);
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            '1 Room, 2 Guests',
                            style: GoogleFonts.lato(
                              color: activeBlueColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.filter_alt_rounded,
                              size: 30,
                              color: activeBlueColor,
                            ),
                            Text(
                              'Filters',
                              style: GoogleFonts.lato(
                                fontSize: 15,
                                color: activeBlueColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: width(context) * 0.23,
                          height: height(context) * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ]),
                          child: Center(
                            child: DropdownButton<String>(
                              isDense: true,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 10,
                              value: dropDownStringValue1,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              items: <String>[
                                'Popular',
                                'Lonavala',
                                'Mumbai',
                                'Pune',
                                'Nashik'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 25,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  dropDownStringValue1 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: width(context) * 0.23,
                          height: height(context) * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ]),
                          child: Center(
                            child: DropdownButton<String>(
                              isDense: true,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 10,
                              value: dropDownStringValue2,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              items: <String>[
                                'Price',
                                '₹4k to 5k',
                                '₹2k to 3k',
                                '₹1k to 2k',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 25,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  dropDownStringValue2 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: width(context) * 0.23,
                          height: height(context) * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ]),
                          child: Center(
                            child: DropdownButton<String>(
                              isDense: true,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 10,
                              value: dropDownStringValue3,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                              items: <String>[
                                'Star rating',
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 25,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  dropDownStringValue3 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
          height: height(context) * 0.75,
          child: ListView.builder(
              itemCount: 8,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) {
                return itemCard(
                  context,
                  4433,
                  3500,
                  4.7,
                  'assets/res/hotel_img.jpg',
                  "Hotel Sunshine Inn",
                  'Near Prem Nagar',
                  'Loreium Ipsumsjdbvvv sd sbv fvbmfvmfsdfweneufmgo',
                );
              })),
    );
  }

  Future<dynamic> showSelectGuestAndRooms(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
            title: const Text("Select rooms and guests"),
            content: Container(
              height: height(context) * 0.3,
              child: Column(
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rooms'),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (count1 > 1) {
                                    count1--;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove_circle_outline)),
                            Text(count1.toString()),
                            IconButton(
                                onPressed: () {
                                  count1++;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add_circle_outline)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Adults'),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (count2 > 1) {
                                    count2--;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove_circle_outline)),
                            Text(count2.toString()),
                            IconButton(
                                onPressed: () {
                                  count2++;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add_circle_outline)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Children'),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (count3 > 1) {
                                    count3--;
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.remove_circle_outline)),
                            Text(count3.toString()),
                            IconButton(
                                onPressed: () {
                                  count3++;
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add_circle_outline)),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.99,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          gradient: blueGradient(),
                          borderRadius: BorderRadius.circular(30)),
                      // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
