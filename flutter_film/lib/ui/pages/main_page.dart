part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;

  MainPage({this.bottomNavBarIndex = 0, this.isExpired = false});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(child: Container(color: Color(0xFFF6F7F9))),
          PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                });
              },
              children: <Widget>[
                MoviePage(),
                TicketPage(
                  isExpiredTicket: widget.isExpired,
                )
              ]),
          createCustomBottomNavbar(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: accentColor2,
                  onPressed: () {
                    wallet = true;
                    context.bloc<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                  },
                  child: SizedBox(
                      height: 46,
                      width: 46,
                      child: Icon(
                        MdiIcons.walletPlus,
                        color: Colors.black.withOpacity(0.54),
                      )),
                ),
              ))
        ],
      ),
    );
  }

  Widget createCustomBottomNavbar() => Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle:
                GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w600),
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: mainColor,
            unselectedItemColor: Color(0xFFE5E5E5),
            currentIndex: bottomNavbarIndex,
            onTap: (index) {
              setState(() {
                bottomNavbarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavbarIndex == 0)
                          ? "assets/ic_movie.png"
                          : "assets/ic_movie_grey.png")),
                  label: "My Movies"),
              BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavbarIndex == 1)
                          ? "assets/ic_tickets.png"
                          : "assets/ic_tickets_grey.png")),
                  label: "My Tickets")
            ],
          ),
        ),
      ));
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
