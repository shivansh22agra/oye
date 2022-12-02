import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController otpEditingController = TextEditingController();
  String location = "city";
  String area = "state";
  bool address = false;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  String verID = " ";
  double? Otp;
  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  int screenState = 0;
  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent!");
        verID = verificationId;
        setState(() {
          screenState = 1;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Timeout!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpEditingController.text,
      ),
    )
        .whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  Future<void> getaddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark[0].name);
    location = placemark[0].locality!;
    area = placemark[0].administrativeArea!;
    address = true;
    setState(() {});
  }

  Future showbootom() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("assets/Group 8130.jpg")),
                ),
                CarouselSlider(
                    items: [
                      Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Enter email",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextField(
                              controller: emailEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Enter Your email",
                                filled: true,
                                fillColor: Colors.grey[100],
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Send OTP",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Enter OTP",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: TextField(
                              onChanged: (value) {
                                Otp = double.parse(value);
                              },
                              controller: otpEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Search Your otp",
                                filled: true,
                                fillColor: Colors.grey[100],
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {
                                verifyOTP();
                                Navigator.pop(context, false);
                              },
                              child: Text(
                                "FINISH",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                    ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: MaterialButton(
          onPressed: () async {
            Position position = await _determinePosition();

            getaddress(position);
          },
          child: Container(
            child: Icon(
              Icons.location_on,
              color: address ? Colors.red : Colors.black,
            ),
          ),
        ),
        title: Text(
          "${location},${area}",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showbootom();
                },
                child: Text("Login",
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
          )
          // Icon(
          //   Icons.arrow_downward,
          //   color: Colors.black,
          // ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120, left: 100),
                  child: Column(children: [
                    Container(
                      height: 30,
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Search Your Courses",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ]),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/first.jpg"),
                  fit: BoxFit.fitWidth,
                ))),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  mainAxisSpacing: 20,
                  //   crossAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Home Beauty  Tutor ",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purple),
                              ),
                              Text(
                                "chose best courses for u",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: index == 0
                                  ? AssetImage("assets/index1.jpg")
                                  : index == 2
                                      ? AssetImage("assets/index2.jpg")
                                      : AssetImage("assets/index3.jpg"),
                              fit: BoxFit.fitHeight),
                          color: Colors.grey,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
