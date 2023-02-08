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

class SavedWidget extends StatefulWidget {
  final int _num;
  final bool _like;

  SavedWidget(this._num, this._like);

  @override
  createState() => SavedWidgetState(_num, _like);
}

class SavedWidgetState extends State<SavedWidget> {
  int num;
  bool like = false;

  SavedWidgetState(this.num, this.like);

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
      Text(
          'Saved\n$num',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18.0,
            fontWeight: FontWeight.w900
          ),
      ),
      IconButton(
          onPressed: pressButton,
          icon: Icon(
              like ? Icons.star : Icons.star_border,
              color: Colors.amber
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

  HomePage(
      this._title,
      this._text,
      this._imageUrl,
      this._num,
      this._like
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Articles',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black12,
              height: 150.0,
              child: Row(
                children: [
                  Image.network(
                      _imageUrl,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                _title,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _text,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 0.0),
                    child: SavedWidget(_num, _like),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              color: Colors.black12,
              height: 150.0,
              child: Row(
                children: [
                  Image.network(
                      _imageUrl,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                _title,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _text,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 0.0),
                    child: SavedWidget(_num, _like),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              color: Colors.black12,
              height: 150.0,
              child: Row(
                children: [
                  Image.network(
                      _imageUrl,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                _title,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w900
                                )
                            ),
                            Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _text,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 25.0, 0.0),
                    child: SavedWidget(_num, _like),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25.0),
            const FloatingActionButton(
            onPressed: _launchUrl,
            backgroundColor: Colors.black54,
            child: Icon(
                Icons.contact_mail
            ),
          )
          ],
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