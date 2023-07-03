import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:certify_me_kiosk/checkInMultipleSlots.dart';

class VolunteerCheckinCheckOut extends StatefulWidget {
  @override
  Volunteer createState() => Volunteer();
}

class Volunteer extends State<VolunteerCheckinCheckOut> {
  var _imageToShow =
      const Image(image: AssetImage('images/assets/final_logo.png'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Certify.me Kiosk',
        home: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(150, 50, 10, 0),
                                child: Container(
                                  child: _imageToShow,
                                ),
                              ),

                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150, 10, 150, 50),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7.0))),
                                          child: ListView(

                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              35, 5, 0, 0),

                                                      child: TextButton.icon(
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop(context);
                                                        },
                                                        icon: const Icon(
                                                          color: Colors.black,
                                                          Icons.arrow_back_outlined,
                                                          size: 30.0,
                                                        ),
                                                        label: Text(
                                                          "Hi Heena",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 24,
                                                              color: Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.fromLTRB(50, 50, 5, 5),
                                                //   child: Text(
                                                //     "Hi Heena",
                                                //     style: const TextStyle(
                                                //         fontWeight: FontWeight.bold,
                                                //         fontSize: 25),
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          50, 5, 0, 0),
                                                  child: Text(
                                                    "What Would you like to do?",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          50, 5, 0, 0),
                                                  child: Text(
                                                    "Click on Check-In to sign in and Check-Out to \nsign out.",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.grey,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          50, 10, 0, 0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 20, 50, 0),
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            foregroundColor:
                                                                Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        24),
                                                            backgroundColor:
                                                                Colors.green,
                                                            minimumSize: const Size
                                                                .fromHeight(90),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            CheckinSlotsPage()));
                                                          },
                                                          child: const Text(
                                                            "       Check-In       ",
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                5, 20, 50, 0),
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            foregroundColor:
                                                                Colors
                                                                    .redAccent,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        24),
                                                            backgroundColor:
                                                                Colors.red
                                                                    .shade200,
                                                            minimumSize: const Size
                                                                .fromHeight(85),
                                                          ),
                                                          onPressed: () {},
                                                          child: const Text(
                                                            "       Check-Out       ",
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 30, 0, 0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Center(
                                                                child:
                                                                    TextButton(
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    foregroundColor:
                                                                        Colors
                                                                            .black,
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        20.0),
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          24,
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                  child:
                                                                      const Text(
                                                                    "      Service History          ",
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                )
                                                ]))))
                            ]))))));
  }
}
