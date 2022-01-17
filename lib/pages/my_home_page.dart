import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/pages/payment_page.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:flutter_payment_app/widgets/large_buttons.dart';
import 'package:flutter_payment_app/widgets/text_size.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
            Positioned(
                bottom: 0,
                height: 90,
                child: Container(
                  color: Colors.grey.withOpacity(0.6),
                  height: 80,
                  width: w,
                )),
            _payButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          _mainBackGround(),
          _curveImageContainer(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackGround() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Container(
        height: 300,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("images/background.png"))),
      ),
    );
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -2,
        bottom: 10,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/curve.png",
                  ))),
        ));
  }

  _buttonContainer() {
    return Positioned(
        bottom: 15,
        right: 58,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 240,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height - 300,
                            )),
                        Positioned(
                          right: 58,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 25),
                            width: 60,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(29),
                                color: AppColor.mainColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppButtons(
                                  icon: Icons.cancel,
                                  iconColor: AppColor.mainColor,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                AppButtons(
                                  icon: Icons.add,
                                  iconColor: AppColor.mainColor,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  text: "Add Bill",
                                ),
                                AppButtons(
                                  icon: Icons.history,
                                  iconColor: AppColor.mainColor,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.white,
                                  text: "History",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    offset: Offset(0, 1),
                    color: Color(0xff315986),
                  )
                ],
                image: DecorationImage(
                    image: AssetImage(
                      "images/lines.png",
                    ))),
          ),
        ));
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.only(top: 20, right: 20),
                height: 110,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFd8dbe0),
                        offset: Offset(1, 1),
                        blurRadius: 20.0,
                        spreadRadius: 10,
                      ),
                    ]),
                child: Container(
                  margin: const EdgeInsets.only(top: 8, left: 18),
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3, color: Colors.grey),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "images/brand1.png",
                                        ))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "KenGen Power",
                                    style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text("ID: 194659479",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedText(
                            text: "Auto pay on 24th May 18",
                            color: AppColor.green,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.selectBackground),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.selectColor),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$ 1248.00',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.mainColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Due in 3 days',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: AppColor.idColor),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: AppColor.halfOval,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  _payButton() {
    return Positioned(
        bottom: 20,
        child: AppLargeButton(
          text: "Pay all bills",
          onTap: () {
            print('hello');
            Get.to(() => PaymentPage());
          },
          backgroundColor: AppColor.mainColor,
          textColor: Colors.white,
        ));
  }

  _textContainer() {
    return Stack(
      children: [
        Positioned(
            top: 100,
            left: 0,
            child: Text(
              'My Bills',
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF293952)),
            )),
        Positioned(
            top: 80,
            left: 40,
            child: Text(
              'My Bills',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
      ],
    );
  }
}
