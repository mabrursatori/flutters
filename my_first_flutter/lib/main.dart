import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Belajar Flutter"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Ini Text Pertama Saya',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18),
              ),
              Stack(
                children: <Widget>[
                  Text(
                    'Belajar Flutter :)',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.red[700],
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Belajar Flutter :)',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              Text(
                'Ini Text Pertama Saya saat belajar flutter. Sangat menyenangkan dapat belajar flutter dengan mudah dan menarik',
                style: TextStyle(fontSize: 20, fontFamily: 'DancingScript'),
                textAlign: TextAlign.right,
                overflow: TextOverflow.fade,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}


// TextAlign.left
// TextAlign.center
// TextAlign.right
// TextAlign.justify
// TextAlign.start
// TextAlign.end

// clip	Memotong Text sesuai dengan maxLines
// ellipsis	Memotong Text sesuai dengan maxLines dan diakhiri dengan tanda titik-titik. Apabila parameter maxlines tidak ditemukan maka akan memotong text menjadi satu baris saja
// fade	Memotong text sesuai dengan maxLines dengan efek fade pada perpotongan textnya
// visible	Memunculkan text meskipun melewati ukuran dari container