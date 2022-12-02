import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Column(
        children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Home Salon Package",
                    style: TextStyle(color: Colors.purple, fontSize: 25),
                  ),
                  Text(
                    "Best Beautition at Home",
                    style: TextStyle(color: Colors.purple[300], fontSize: 20),
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 10,
                            ),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.purple[300]),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: DecorationImage(
                                              ///  scale: 0.7,
                                              image: index == 0
                                                  ? AssetImage(
                                                      "assets/Rectangle 2212.jpg")
                                                  : AssetImage(
                                                      "assets/Rectangle 2211.jpg"),
                                              // fit: BoxFit.cover
                                            )),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 20,
                                      primary: Colors.white,
                                    ),
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                        "Best Look",
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
        
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.black, fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                             border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                              fillColor: Colors.purple[300],
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: "Enter your name",
                            ),
                          ),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                            decoration: InputDecoration(
                             border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                              fillColor: Colors.purple[300],
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: "Enter your email id",
                            ),
                        ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                            decoration: InputDecoration(
                             border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                              fillColor: Colors.purple[300],
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: "Enter your contact no",
                            ),
                        ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                            decoration: InputDecoration(
                             border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                              fillColor: Colors.purple[300],
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: "Enter zip code",
                            ),
                        ),
                         )
                      ],
                    ),
                    width: 300,
                    height: 350,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            )
        ],
      ),
          )),
    );
  }
}
