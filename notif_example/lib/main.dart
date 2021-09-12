import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setAppId("cb9f92e6-f0a1-477b-a016-006f982b91f9");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "Title";
  String content = "Content";
  String url = "";
  @override
  void initState() {
    super.initState();

    

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      setState(() {
        title = event.notification.title;
        content = event.notification.body;
        url = event.notification.bigPicture;
      });
      event.complete(event.notification);
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print("Notifikasi Di-TAP");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              SizedBox(),
              Text(content),
              ElevatedButton(
                  onPressed: () async {
                   OneSignal.shared.setExternalUserId("12345678");
                  },
                  child: Text("Test"))
            ],
          ),
        ),
      ),
    );
  }
}
