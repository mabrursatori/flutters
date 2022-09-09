part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double widht;
  final double heigth;
  final DateTime date;
  final Function onTap;

  DateCard(this.date,
      {this.isSelected = false, this.widht = 70, this.heigth = 90, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          width: widht,
          height: heigth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: isSelected ? accentColor2 : Colors.transparent,
              border: Border.all(
                  color: isSelected ? Colors.transparent : Color(0xFFE4E4E4))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(date.shortDayName,
                  style: blackTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400)),
              SizedBox(
                height: 6,
              ),
              Text(date.day.toString(),
                  style: whiteNumberFont.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ));
  }
}
