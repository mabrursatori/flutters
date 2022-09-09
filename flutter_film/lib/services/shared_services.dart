part of 'services.dart';

class SharedPref {
  static FlutterSession session = FlutterSession();

  static void addUser(RegistrationData dataUser) async {
    List<dynamic> list = await FlutterSession().get("users");
    List<User> users =
        (list != null) ? list.map((e) => User.fromJson(e)).toList() : [];
    users.add(User("123", dataUser.email,
        name: dataUser.name,
        profilePicture: "user_pic.png",
        selectedGenres: dataUser.selectedGenres,
        selectedLanguage: dataUser.selectedLang,
        balance: 0));
    String json = jsonEncode(users);
    await session.set("users", json);
  }

  static Future<User> getUser(String email) async {
    List<dynamic> list = await FlutterSession().get("users");
    User user;
    list.forEach((e) {
      if (e["email"] == email) {
        user = User(e["id"], e["email"],
            name: e["name"],
            profilePicture: e["profilePicture"],
            selectedGenres: (jsonDecode(e["selectedGenres"]) as List)
                .map((e) => e.toString())
                .toList(),
            selectedLanguage: e["selectedLanguage"],
            balance: e["balance"]);
      }
    });
    return user;
  }

  static void addTicket(Ticket ticket) async {
    List<dynamic> list = await FlutterSession().get("tickets");
    List<Ticket> tickets =
        (list != null) ? list.map((e) => Ticket.fromJson(e)).toList() : [];
    tickets.add(ticket);
    String json = jsonEncode(tickets);
    await session.set("tickets", json);
  }

  static Future<List<Ticket>> getTickets(String name) async {
    List<dynamic> list = await FlutterSession().get("tickets");
    List<Ticket> tickets = [];
    if (list != null) {
      list.forEach((e) {
        if (e["name"] == name) {
          tickets.add(Ticket.fromJson(e));
        }
      });
    }
    return tickets;
  }

  static void createSession(User dataUser) async {
    User user = User("123", dataUser.email,
        name: dataUser.name,
        profilePicture: "user_pic.png",
        selectedGenres: dataUser.selectedGenres,
        selectedLanguage: dataUser.selectedLanguage,
        balance: dataUser.balance);
    String json = jsonEncode(user);
    await session.set("login", json);
  }

  static void deleteSession() async {
    await session.set("login", "");
  }

  static Future<User> getSession() async {
    var json = await FlutterSession().get("login");
    User user;
    if (json != "") {
      user = (json != null) ? User.fromJson(json) : null;
    } else {
      user = null;
    }
    return user;
  }

  static void topUp(User user, int topUp) async {
    List<dynamic> listDy = await FlutterSession().get("users");
    List<User> users = listDy
        .map((e) => User(e["id"], e["email"],
            name: e["name"],
            profilePicture: e["profilePicture"],
            selectedGenres: (jsonDecode(e["selectedGenres"]) as List)
                .map((e) => e.toString())
                .toList(),
            selectedLanguage: e["selectedLanguage"],
            balance: e["balance"]))
        .toList();
    var k = User(user.id, user.email,
        name: user.name,
        balance: user.balance,
        profilePicture: user.profilePicture,
        selectedGenres: user.selectedGenres,
        selectedLanguage: user.selectedLanguage);
    int index = users.indexOf(k);
    users[index].balance += topUp;
    String json = jsonEncode(users);
    await session.set("users", json);
    SharedPref.createSession(User(user.id, user.email,
        name: user.name,
        profilePicture: user.profilePicture,
        selectedGenres: user.selectedGenres,
        selectedLanguage: user.selectedLanguage,
        balance: user.balance + topUp));
  }

  static void buyTicket(User user, int value) async {
    List<dynamic> listDy = await FlutterSession().get("users");
    List<User> users = listDy
        .map((e) => User(e["id"], e["email"],
            name: e["name"],
            profilePicture: e["profilePicture"],
            selectedGenres: (jsonDecode(e["selectedGenres"]) as List)
                .map((e) => e.toString())
                .toList(),
            selectedLanguage: e["selectedLanguage"],
            balance: e["balance"]))
        .toList();
    var k = User(user.id, user.email,
        name: user.name,
        balance: user.balance,
        profilePicture: user.profilePicture,
        selectedGenres: user.selectedGenres,
        selectedLanguage: user.selectedLanguage);
    int index = users.indexOf(k);
    users[index].balance -= value;
    String json = jsonEncode(users);
    await session.set("users", json);
    SharedPref.createSession(User(user.id, user.email,
        name: user.name,
        profilePicture: user.profilePicture,
        selectedGenres: user.selectedGenres,
        selectedLanguage: user.selectedLanguage,
        balance: user.balance - value));
  }
}
