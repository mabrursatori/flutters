part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "bloc a new Movie much\neasier than any before",
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 19),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: accentColor2,
                  child: RaisedButton(
                    onPressed: () {
                      login = true;
                      context
                          .bloc<PageBloc>()
                          .add(GoToRegistrationPage(RegistrationData()));
                    },
                    child: Text(
                      "Get Started",
                      style: whiteTextFont.copyWith(fontSize: 16),
                    ),
                    color: mainColor,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already ha an account? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    signin = true;
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Sign In",
                    style: purpleTextFont,
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
