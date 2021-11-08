// ignore: import_of_legacy_library_into_null_safe
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_news/backend/rss_to_json.dart';
import 'package:ten_news/screens/home/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Map<String, List> newsData = Map<String, List>();
  bool isLoading = true;

  getData() async {
    Future.wait([
      rssToJson('topnews'),
      rssToJson('india'),
      rssToJson('world'),
      rssToJson('business'),
      rssToJson('sports'),
      rssToJson('cricket'),
      rssToJson('tech-features'),
      rssToJson('education'),
      rssToJson('entertainment'),
      rssToJson('music'),
      rssToJson('lifestyle'),
      rssToJson('health-fitness'),
      rssToJson('fashion-trends'),
      rssToJson('art-culture'),
      rssToJson('travel'),
      rssToJson('books'),
      rssToJson('realstate'),
      rssToJson('its-viral'),
    ]).then((value) {
      newsData['topnews'] = value[0];
      newsData['india'] = value[1];
      newsData['world'] = value[2];
      newsData['business'] = value[3];
      newsData['sports'] = value[4];
      newsData['cricket'] = value[5];
      newsData['tech'] = value[6];
      newsData['education'] = value[7];
      newsData['entertainment'] = value[8];
      newsData['music'] = value[9];
      newsData['lifestyle'] = value[10];
      newsData['health-fitness'] = value[11];
      newsData['fashion-trends'] = value[12];
      newsData['art-culture'] = value[13];
      newsData['travel'] = value[14];
      newsData['books'] = value[15];
      newsData['realstate'] = value[16];
      newsData['its-viral'] = value[17];
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Builder(
              builder: (context) => IconButton(
                  icon: SvgPicture.asset("assets/icons/drawer.svg"),
                  onPressed: () => Scaffold.of(context).openDrawer()) // p) ,),
              ),
        ),
        titleSpacing: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(
              child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/image/ada-derana.jpg",
                  )),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'Log Out',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'v1.0.1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : <Widget>[
              HomePage(
                newsData: newsData,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        //   fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black54,
                height: 21,
              ),
              title: Text("Bookmarks")),
          BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff5c00000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: Text("Profile")),
        ],
      ),
    );
  }
}
