import 'package:flutter/material.dart';

// MainAxisAlignment.center	Memposisikan widget pada tengah layar
// MainAxisAlignment.start	Memposisikan widget mengikuti posisi widget pertama
// MainAxisAlignment.end	Memposisikan widget mengikuti posisi widget terakhir
// MainAxisAlignment.spaceEvenly	Memberi jarak antara masing-masing child secara merata pada ruang yang tersedia
// MainAxisAlignment.spaceAround	Memberi jarak antar widget secara merata namun hanya memberikan setengah jarak pada awal dan akhir widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Layout"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.greenAccent,
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
              Container(
                color: Colors.orangeAccent,
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
              Container(
                color: Colors.purpleAccent,
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
