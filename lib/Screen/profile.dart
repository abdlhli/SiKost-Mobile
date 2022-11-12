import 'package:flutter/material.dart';

// void main() {
//   runApp(Profile());
// }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 43, 50, 178),
                  Color.fromARGB(255, 20, 136, 204),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Profil",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(123, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama"),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue: "halo",
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Nama"),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue: "halo",
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Nama"),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            initialValue: "halo",
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Text("Save")),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Keluar")),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
