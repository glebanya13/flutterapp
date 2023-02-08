import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() {
  runApp(
      HomePage(
          'Image',
          'This article is about visual artifacts or reproductions. For other uses, see Image (disambiguation). "Picture" redirects here. For other uses, see Picture (disambiguation). For Wikipedia image use guidelines, see Wikipedia:Images.',
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/330px-Image_created_with_a_mobile_phone.png',
          100,
          true
      )
  );
}

class StartPage extends StatefulWidget {
  final int _num;
  final bool _like;

  StartPage(this._num, this._like);

  @override
  createState() => StartPageState(_num, _like);
}

class StartPageState extends State<StartPage> {
  int num;
  bool like = false;

  StartPageState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if(like) {
        num++;
      } else {
        num--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Saved\n$num', textAlign: TextAlign.center),
      IconButton(
          onPressed: pressButton,
          icon: Icon(like ? Icons.star : Icons.star_border, size: 30.0, color: Colors.purple
          )
      )
    ]);
  }
}


class HomePage extends StatelessWidget {

  final String _title;
  final String _text;
  final String _imageUrl;
  int _num;
  bool _like = false;

  HomePage(this._title, this._text, this._imageUrl, this._num, this._like);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
          color: Colors.black12,
          height: 100.0,
          child: Row(
            children: <Widget>[
              Image.network(
                  _imageUrl,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                            _title,
                            style: TextStyle(fontSize: 20.0)
                        ),
                        Expanded(
                            child: Text(
                              _text + _text,
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                            )
                        )
                      ],
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 0.0),
                child: StartPage(_num, _like)
                ,
              )
            ],
          ),
        )
      ),
    );
  }
}

// Widget container = Column(
//   children: [
//     const SizedBox(height: 50.0),
//     Image.asset("assets/images/image.png"),
//     const SizedBox(height: 25.0),
//     const Text(
//         "Hello, World!",
//         style: TextStyle(
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: "Raleway"
//         )
//     ),
//     const SizedBox(height: 25.0),
//     const FloatingActionButton(
//       onPressed: _launchUrl,
//       backgroundColor: Colors.purple,
//       child: Icon(
//           Icons.contact_mail_sharp
//       ),
//     )
//   ],
// );


Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}