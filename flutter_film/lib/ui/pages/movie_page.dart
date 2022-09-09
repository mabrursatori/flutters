part of 'pages.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<Movie> listOfSearch = [];
  bool isBrowse = false;
  TextEditingController browseController = TextEditingController();

  onSearch(String value) {
    listOfSearch.clear();
    if (value.isEmpty) {
      isBrowse = false;
      setState(() {});
      return;
    }
    isBrowse = true;
    listMovies.forEach((e) {
      if (e.title.toLowerCase().contains(value.toLowerCase())) {
        listOfSearch.add(e);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: HEADER
        Container(
            decoration: BoxDecoration(
                color: accentColor1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                return Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () async {
                          context.bloc<PageBloc>().add(GoToProfilePage());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFF5F558B), width: 1)),
                          child: Stack(
                            children: <Widget>[
                              SpinKitFadingCircle(
                                color: accentColor2,
                                size: 50,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            (AssetImage("assets/user_pic.png")),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            userState.user.name,
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // context
                            //     .bloc<PageBloc>()
                            //     .add(GoToWalletPage(GoToMainPage()));
                          },
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(userState.user.balance ?? 0),
                            style: yellowNumberFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            })),

        //note: BROWSE MOVIE
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 12),
          child: TextField(
            controller: browseController,
            onChanged: onSearch,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Search By Title"),
          ),
        ),
        (isBrowse)
            ? Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 12),
                child: ResponsiveGridRow(
                    children: listOfSearch.map((e) {
                  return ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: MovieSearch(
                      e,
                      listOfSearch.lastIndexOf(e),
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToMovieDetailPage(e));
                      },
                    ),
                  );
                }).toList()))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // note: NOW PLAYING
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 10, defaultMargin, 12),
                    child: Text(
                      "Now Playing",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoaded) {
                          List<Movie> movies = movieState.movies.sublist(0, 10);

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? defaultMargin : 0,
                                  right: (index == movies.length - 1)
                                      ? defaultMargin
                                      : 16),
                              child: MovieCard(
                                movies[index],
                                onTap: () {
                                  context.bloc<PageBloc>().add(
                                      GoToMovieDetailPage(movies[index],
                                          isBooked: true));
                                },
                              ),
                            ),
                          );
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ),

                  //note: COMING SOON
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text(
                      "Coming Soon",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoaded) {
                          List<Movie> movies = movieState.movies.sublist(10);

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? defaultMargin : 0,
                                  right: (index == movies.length - 1)
                                      ? defaultMargin
                                      : 16),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .bloc<PageBloc>()
                                      .add(GoToMovieDetailPage(movies[index]));
                                },
                                child: ComingSoonCard(movies[index]),
                              ),
                            ),
                          );
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ),

                  //note: GET LUCKY DAY
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text(
                      "Get Lucky Day",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: dummyPromos
                        .map((e) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 16),
                              child: PromoCard(e),
                            ))
                        .toList(),
                  ),
                ],
              ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
