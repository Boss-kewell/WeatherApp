//ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_Local_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/getlocation.dart';
import 'package:weather_app/weatherData.dart';
import 'package:http/http.dart';
import 'package:weather_app/weatherModel.dart';

class HomePage extends StatefulWidget {
  //final String url = 'http://api.weatherapi.com/v1/current.json';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client = WeatherData();
  WeatherModel? data;
  bool loading = false;

  @override
  void initState() {
    info();
    super.initState();
  }

  info() async {
    setState(() {
      loading = true;
    });
    WeatherModel? result = await client.getData();
    setState(() {
      loading = false;
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentDate = DateTime.now();
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 40),
                      margin: EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: const [
                            Color(0xFFAF84DC),
                            Color(0xFFA2D2FD),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85],
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: CupertinoSearchTextField(
                                placeholder: 'Search User',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Nicosia',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 35,
                              fontFamily: 'MavenPro',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            formatDate(currentDate.toString()),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 18,
                              fontFamily: 'MavenPro',
                            ),
                          ),
                          SizedBox(height: 17),
                          Image.asset(
                            'assets/images/sun.png',
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            data?.current?.condition?.text.toString() ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Hubbali',
                            ),
                          ),
                          Text(
                            data?.current?.tempC?.toString() ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 75,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Hubbali',
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wind.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                    ),
                                    Text(
                                      data?.current?.windMph?.toString() ?? " ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubbali',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/humidity.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                    ),
                                    Text(
                                      data?.current?.humidity?.toString() ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubbali',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/wind-direction.png',
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                    ),
                                    Text(
                                      data?.current?.windDir?.toString() ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Hubbali',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Wind Direction',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontFamily: 'MavenPro',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              'Gust',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.humidity?.toString() ?? " ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontSize: 27,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.pressureMb?.toString() ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontSize: 27,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              'UV',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.uv?.toString() ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontSize: 27,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Precipitation',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.precipIn?.toString() ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontSize: 27,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.windKph.toString() ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MavenPro',
                                fontSize: 27,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Last Update',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontFamily: 'MavenPro',
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              data?.current?.lastUpdated?.toString() ?? "",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontFamily: 'MavenPro',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  formatDate(String date) {
    String dateString = date;
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    String formattedDate = DateFormat('MMMM d, y').format(dateTime);
    return formattedDate;
  }
}
