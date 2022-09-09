part of 'widgets.dart';

class MovieSearch extends StatelessWidget {
  final Movie movie;
  final Function onTap;
  final int index;

  MovieSearch(this.movie, this.index, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 170,
        margin: (index % 2 == 1)
            ? EdgeInsets.only(left: 5, bottom: 10)
            : EdgeInsets.only(right: 5, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
                fit: BoxFit.cover)),
        child: Container(
          height: 140,
          width: 180,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.61),
                    Colors.black.withOpacity(0)
                  ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: whiteTextFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingStars(
                voteAverage: movie.voteAverage,
                fontSize: 10,
                starSize: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
