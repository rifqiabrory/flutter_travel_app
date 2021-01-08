import 'package:flutter/material.dart';
import 'package:flutter_travel_app/widgets/destination_carousel.dart';
import 'package:flutter_travel_app/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentBottomTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildIcons(map.key))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel()
          ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentBottomTab,
        type: BottomNavigationBarType.fixed,
        onTap: (int value) {
          setState(() {
            _currentBottomTab = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 32.0),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, size: 32.0),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined, size: 32.0),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 16.0,
                  backgroundImage: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/30140460?s=460&u=6ec8741d8106c7f18d4ef2d7fd8578d4ff1b0d15&v=4")),
              title: SizedBox.shrink())
        ],
      ),
    );
  }
}
