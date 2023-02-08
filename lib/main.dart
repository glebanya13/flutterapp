import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter App'),
            centerTitle: true,
            backgroundColor: Colors.purple,
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                Image.asset("assets/images/image.png"),
                const SizedBox(height: 25.0),
                const Text(
                    "Hello, World!",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway"
                    )
                ),
                const SizedBox(height: 25.0),
                const FloatingActionButton(
                    onPressed: _launchUrl,
                    backgroundColor: Colors.purple,
                    child: Icon(
                      Icons.contact_mail_sharp
                    ),
                )
              ],
            ),
          ),
        ),
    )
  );
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}