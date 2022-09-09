part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  int balance;

  User(
    this.id,
    this.email, {
    this.name,
    this.balance,
    this.profilePicture,
    this.selectedGenres,
    this.selectedLanguage,
  });

  Map toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "profilePicture": profilePicture,
        "selectedGenres": jsonEncode(selectedGenres),
        "selectedLanguage": selectedLanguage,
        "balance": balance
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        json["id"],
        json["email"],
        name: json["name"],
        balance: (json["balance"] as num).toInt(),
        profilePicture: json["profilePicture"],
        selectedGenres: (jsonDecode(json["selectedGenres"]) as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: json["selectedLanguage"],
      );
  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
