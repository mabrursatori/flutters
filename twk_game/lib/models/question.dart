part of 'models.dart';

class Question extends Equatable {
  final int id;
  final String title;
  final String question;
  final String trueAnswer;
  final String falseAnswer1;
  final String falseAnswer2;
  final String falseAnswer3;
  final String description;
  final String quran;
  final String quranTranslate;
  final String hadits;
  final String haditsTranslate;
  final String kitab;
  final String kitabTranslate;
  final String type;
  final String mode;
  final String createdAt;
  final String updatedAt;
  final String assetUrl;

  Question(
      {@required this.id,
      @required this.title,
      @required this.question,
      @required this.trueAnswer,
      @required this.falseAnswer1,
      @required this.falseAnswer2,
      @required this.falseAnswer3,
      @required this.description,
      @required this.quran,
      @required this.quranTranslate,
      @required this.hadits,
      @required this.haditsTranslate,
      @required this.kitab,
      @required this.kitabTranslate,
      @required this.type,
      @required this.mode,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.assetUrl});

  @override
  List<Object> get props => [
        id,
        title,
        question,
        trueAnswer,
        falseAnswer1,
        falseAnswer2,
        falseAnswer3,
        description,
        quran,
        quranTranslate,
        hadits,
        haditsTranslate,
        kitab,
        kitabTranslate,
        type,
        mode,
        createdAt,
        updatedAt,
        assetUrl
      ];

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['id'],
        question: json['question'],
        title: json['title'],
        trueAnswer: json['trueAnswer'],
        falseAnswer1: json['falseAnswer1'],
        falseAnswer2: json['falseAnswer2'],
        falseAnswer3: json['falseAnswer3'],
        description: json['description'],
        quran: json['quran'],
        quranTranslate: json['quranTranslate'],
        hadits: json['hadits'],
        haditsTranslate: json['haditsTranslate'],
        kitab: json['kitabTranslate'],
        kitabTranslate: json['kitabTranslate'],
        type: json['type'],
        mode: json['mode'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        assetUrl: json['asset_url']);
  }
}
