import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:certify_me_kiosk/common/color_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_service.dart';
import 'api/response/response_data_voluntear.dart';
import 'common/sharepref.dart';
import 'confirm_screen.dart';
import 'home_screen.dart';

class FacilityList extends StatelessWidget {
  const FacilityList(
      {Key? key,
      required this.itemId,
      required this.name,
      required this.attendanceMode,
      required this.documentType,
      required this.volunteerList})
      : super(key: key);
  final int itemId;
  final String name;
  final String attendanceMode;
  final int documentType;
  final List<VolunteerSchedulingDetailList> volunteerList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certify.me KIOSK',
      debugShowCheckedModeBanner: false,
      home: ConfirmLanch(
          itemId, name, attendanceMode, documentType, volunteerList),
    );
  }
}

class ConfirmLanch extends StatefulWidget {
  ConfirmLanch(this.itemId, this.name, this.attendanceMode, this.documentType,
      this.volunteerList);

  final int itemId;
  final String name;
  final String attendanceMode;
  final int documentType;
  final List<VolunteerSchedulingDetailList> volunteerList;

  @override
  CheckInSlots createState() => CheckInSlots();
}

class CheckInSlots extends State<ConfirmLanch> {
  var _imageToShow =
      const Image(image: AssetImage('images/assets/final_logo.png'));
  late Timer timerDelay;
  var lineOneText = "";
  Map<String, dynamic> diveInfo = HashMap();

  @override
  void initState() {
    super.initState();
    //  updateUI();
    screenDelay();
  }

  Future<void> screenDelay() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    diveInfo['institutionid'] = pref.getString(Sharepref.institutionID);
    diveInfo['certifyId'] = widget.itemId;
    ApiService().getAvailabilityFacilityListForKiosk(
        pref.getString(Sharepref.accessToken), diveInfo);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return MaterialApp(
        title: 'Certify.me KIOSK',
        home: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(45, 55, 45, 0),
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Container(
                            child: _imageToShow,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Hi ${widget.name} !',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ColorCode.titleFont,
                                color: Color(ColorCode.line1color)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            lineOneText,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: ColorCode.subTextFont,
                                color: Color(ColorCode.line2color)),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: _width * 0.14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffE0E9F2),
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                      splashColor: Colors.lime,
                                      onPressed: () {
                                        cancelTimer();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomeScreen()));
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: Text(
                                    'Select the Facility',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: ColorCode.subTitleFont,
                                        color: Color(ColorCode.line1color)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20,
                                left: _width * 0.18,
                                right: _width * 0.10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.volunteerList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                      // color: Colors.white,
                                      // margin: EdgeInsets.all(15),
                                      // alignment: Alignment.center,

                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ConfirmScreen(
                                                    dataStr: '',
                                                    attendanceMode:
                                                        widget.attendanceMode,
                                                    type: "pin",
                                                    name: widget.name,
                                                    id: widget.itemId,
                                                    documentType:
                                                        widget.documentType,
                                                    scheduleId: widget
                                                        .volunteerList[index]
                                                        .scheduleId!,
                                                    scheduleEventName: widget
                                                        .volunteerList[index]
                                                        .scheduleTitle!,
                                                    scheduleEventTime:
                                                        '${widget.volunteerList[index].fromTime} - ${widget.volunteerList[index].toTime}',
                                                    enableWalkin: widget
                                                        .volunteerList[index]
                                                        .enableWalkin)));
                                        cancelTimer();
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xffE0E9F2)),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xffE0E9F2),
                                                  blurRadius: 5.0,
                                                  // soften the shadow
                                                  spreadRadius: 3.0,
                                                  //extend the shadow
                                                  offset: Offset(
                                                    3.0,
                                                    // Move to right 5  horizontally
                                                    3.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ]),
                                          child: Row(
                                            children: [
                                              AutoSizeText(
                                                '${widget.volunteerList[index].fromTime} - ${widget.volunteerList[index].toTime}',
                                                style: const TextStyle(
                                                  color: Color(0xff245F99),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Flexible(
                                                child: AutoSizeText(
                                                  '${widget.volunteerList[index].scheduleTitle}',
                                                  style: const TextStyle(
                                                    color: Color(0xff15395C),
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )));
                                }),
                          ),
                          const SizedBox(
                            width: 45,
                            height: 16,
                          ),
                        ]))))));
  }

  Future<void> updateUI() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      String? base64 = pref.getString(Sharepref.logoHomePageView) ?? "";
      if (base64.isNotEmpty) {
        _imageToShow = Image.memory(const Base64Decoder().convert(base64));
      } else {
        _imageToShow =
            const Image(image: AssetImage('images/assets/final_logo.png'));
      }
      if (widget.attendanceMode == "1") {
        lineOneText = 'Select the facility where you would like to check-in';
      } else {
        lineOneText = 'Select the facility where you would like to check-out';
      }
    });
    timerDelay = Timer(Duration(seconds: 15), () {
      try {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } catch (e) {
        print("Error :" + e.toString());
      }
    });
  }

  Future<void> cancelTimer() async {
    try {
      print("cancelTimer ccccccccccccc");
      timerDelay.cancel();
    } catch (e) {
      print("cancelTimer ${e.toString()}");
    }
  }
}
