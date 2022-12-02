import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "Top reated salon courses at Home",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        primary: Colors.white),
                    onPressed: () {},
                    child: Container(
                      height: 250,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      "Good Look ",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/Rectangle 2098.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Exp: 4-8 Years",style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text("View Package",style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        primary: Colors.white),
                    onPressed: () {},
                    child: Container(
                      height: 250,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      "Good Look ",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/Rectangle 2099.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Exp: 4-8 Years",style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text("View Package",style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        primary: Colors.white),
                    onPressed: () {},
                    child: Container(
                      height: 250,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      "Good Look ",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/Rectangle 2100.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Exp: 4-8 Years",style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text("View Package",style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        primary: Colors.white),
                    onPressed: () {},
                    child: Container(
                      height: 250,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      "Good Look ",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/Rectangle 2101.jpg"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Exp: 4-8 Years",style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text("View Package",style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
