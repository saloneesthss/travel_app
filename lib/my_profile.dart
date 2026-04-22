import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_back),
                      Text("My Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 1.5,
                        ),
                      ),
                      Icon(Icons.settings_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/profile.jpg",
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Salonee Shrestha",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                  ),
                                ),
                                Text("mesaloneeshrestha@gmail.com",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(height: 14),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0923b5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                                  ),
                                  child: Text("Edit Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border_rounded),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Favorites",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.fact_check_outlined),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Bookings",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xfff1f0f0),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.language_rounded),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Language",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Location",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.subscriptions_outlined),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Subscription",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xfff1f0f0),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cached),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Clear cache",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time_rounded),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Clear history",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Color(0xff0923b5)),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text("Log out",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
