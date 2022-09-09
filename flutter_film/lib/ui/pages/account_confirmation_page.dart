part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(
                                      GoToPreferencePage(
                                          widget.registrationData));
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black))),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${widget.registrationData.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF3E9D90),
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 40,
                          child: RaisedButton(
                              color: Color(0xFF3E9D90),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                "Create My Account",
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isSigningUp = true;
                                });
                                RegistrationData dataUser =
                                    widget.registrationData;
                                SharedPref.addUser(widget.registrationData);
                                SharedPref.createSession(User(
                                    "123", dataUser.email,
                                    name: dataUser.name,
                                    profilePicture: "user_pic.png",
                                    selectedGenres: dataUser.selectedGenres,
                                    selectedLanguage: dataUser.selectedLang,
                                    balance: 0));
                                Timer.run(() async {
                                  user = await SharedPref.getSession();
                                  tickets =
                                      await SharedPref.getTickets(user.name);
                                });
                                context.bloc<UserBloc>().add(LoadUser());
                                context.bloc<PageBloc>().add(GoToMainPage());
                              }),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
