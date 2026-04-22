import 'package:flutter/material.dart';
import 'package:travel_app/description_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final List<String> categories = [
      "Most Viewed",
      "Nearby",
      "Latest",
      "Tiny Homes",
    ];
    final List<Map<String, dynamic>> places = [
      {
        'name': 'Mount Fuji, Tokyo',
        'location': 'Tokyo, Japan',
        'image': 'assets/images/fuji.png',
        'rating': '4.8',
        'price': '210',
        'time': '8 hours',
        'temperature': '16 °C',
        'description': 'This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. A stunning snow-capped volcano known for its symmetrical beauty, peaceful nature, and iconic sunrise views.'
      },
      {
        'name': 'Andes Mountain',
        'location': 'South, America',
        'image': 'assets/images/andes.png',
        'rating': '4.5',
        'price': '230',
        'time': '19 hours',
        'temperature': '6 °C',
        'description': 'The world\'s longest mountain range stretching across seven countries, offering glaciers, valleys, and breathtaking high-altitude scenery. It features towering peaks, active volcanoes, deep canyons, expansive plateaus, and so on.'
      },
      {
        'name': 'Swiss Alps',
        'location': 'Zermatt, Switzerland',
        'image': 'assets/images/alps.png',
        'rating': '4.9',
        'price': '310',
        'time': '13 hours',
        'temperature': '5 °C',
        'description': 'A stunning alpine region known for snowy peaks, scenic villages, ski resorts, crystal lakes, and luxurious mountain experiences. This vast mountain range is renowned for its remarkable diversity in terms of topography and climate.'
      }
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 40,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Hi, Salu👋",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Explore the world",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 2,
                    left: 25,
                    right: 15,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Start your Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      // suffixIcon: Icon(Icons.saved_search, color: Colors.grey),
                      // fillColor: Colors.white,
                      // filled: true,
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.white70, width: 1),
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      //   borderSide: BorderSide(color: Colors.indigo, width: 2),
                      // )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular places",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (item == 'Most Viewed' ? Color(0xff0923b5) : Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20)
                        ),
                        child: Text(
                          item,
                          style: TextStyle(
                            color: (item == 'Most Viewed' ? Colors.white : Colors.grey),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 8),
                child: SizedBox(
                  height: 360,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionPage(place: places[index])
                            ),
                          );
                        },
                        child: Container(
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                              image: AssetImage(place['image']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 8),
                                blurRadius: 10,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Positioned(
                                  child: IconButton(onPressed: () {},
                                    icon: Icon(Icons.favorite_border),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.grey.shade700,
                                      foregroundColor: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xff363d63),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        place['name'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
                                              SizedBox(width: 4),
                                              Text(
                                                place['location'],
                                                style: TextStyle(color: Colors.white, fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Icon(Icons.star_border, color: Colors.white, size: 16),
                                              SizedBox(width: 4),
                                              Text("${place['rating']}",
                                                style: TextStyle(color: Colors.white, fontSize: 13),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 20),
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
