import 'package:dmi_practica11_200070/model/Media.dart';
import 'package:flutter/material.dart';
// import 'package:dmi_practica08_200070/common/HttpHandler.dart';
import 'package:dmi_practica11_200070/media_list.dart';
import 'package:dmi_practica11_200070/common/MediaProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp - 200570"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Material()),
            ListTile(
              title: Text("Peliculas"),
              selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Televisión"),
              selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv_rounded),
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: _getMediaList()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _obtenerIconos(),
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_rounded), label: "Populares"),
      BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded), label: "Próximamente"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded), label: "Mejor Valoradas"),
    ];
  }

  void _changeMediaType(MediaType type){
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList(){
    return (mediaType == MediaType.movie) ?
    <Widget>[
      MediaList(movieProvider)
    ]:<Widget>[
      MediaList(showProvider)
    ];
  }

}
