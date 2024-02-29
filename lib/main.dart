import 'package:zune/service/permissions.dart';
import 'package:zune/service/repositories/file_manager.dart';
import 'package:zune/service/repositories/state_manager.dart';
import 'package:zune/service/utils/states.dart';
// import 'package:zune/service/repositories/state_manager.dart';
// import 'package:zune/service/utils/album.dart';
// import 'package:zune/service/utils/music.dart';
// import 'package:zune/service/utils/states.dart';
import 'package:zune/service/utils.dart';
import 'package:zune/view/components/menu.dart';
import 'package:zune/view/pages/albuns_page.dart';
import 'package:zune/view/pages/artists_page.dart';
// import 'package:zune/view/components/order_by.dart';

import '../assets/palette.dart';
// import 'package:zune/view/pages/albuns_page.dart';
// import 'package:zune/view/pages/artists_page.dart';
import 'package:zune/view/pages/home.dart';
import 'package:zune/view/pages/lib_page.dart';
import 'package:zune/view/pages/search_page.dart';
//
// import 'package:zune/view/pages/music_player.dart';
import 'package:zune/view/pages/musics_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

// ignore: must_be_immutable
class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    PermissionController.checkPermission();
    Utils.setAll();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: null,
          scaffoldBackgroundColor: Palette.background,
          textTheme: GoogleFonts.poppinsTextTheme(),
          fontFamily: 'Poppins',
        ),
        home: AnimatedBuilder(
          animation: StateManager.state,
          builder: (context, child) {
            return stateManagement(StateManager.state.value);
          },
        ));
  }

  Widget stateManagement(States value) {
    switch (value) {
      case States.init:
        return _init();
      case States.loading:
        return _loading();
      case States.success:
        return _success();
      case States.erro:
        return _error();
      default:
        return _init();
    }
  }

  Widget _loading() {
    return Scaffold(
        backgroundColor: Palette.icon_box,
        body: Center(
            child: CircularProgressIndicator(
          color: Palette.various,
        )));
  }

  Widget _success() {
    return ArtistsPage();
  }

  Widget _error() {
    return Scaffold(
        backgroundColor: Palette.icon_box,
        body: Center(
            child: Text(
          'Nenhuma musica encontrada',
          style: TextStyle(color: Palette.text),
        )));
  }

  Widget _init() {
    return Scaffold();
  }
}


// FutureBuilder(
//             future: FileManager.getMusicFiles('/storage/emulated/0/Music'),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting &&
//                   StateManager.state == States.loading) {
//                 return Scaffold(
//                     body: Center(
//                         child: CircularProgressIndicator(
//                   color: Palette.text,
//                 )));
//               } else {
//                 Utils.setAll(snapshot.data!);
//                 Utils.setArts();

//                 return MusicsPage();
//               }
//             }));

        // MusicsPage()

        /* Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: [HomePage(), LibPage(), SearchPage()],
          ),
          bottomNavigationBar: menu(),
        ), */
        // initialRoute: '/',
        /* routes: {
          // '/': (context) => const HomePage(),
          // '/lib': (context) => const LibPage(),
          // '/search': (context) => const SearchPage(),
          '/musics': (context) => const MusicsPage(),
          '/albuns': (context) => const AlbunsPage(),
          '/artists': (context) => const ArtistsPage(),
        } */

/* Widget menu() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Palette.transparent, Palette.icon_box],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 1])),
        child: BottomNavigationBar(
          onTap: (index) => {
            setState(() {
              _selectedIndex = index;
            }),
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.compactDisc),
              label: 'Biblioteca',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              label: 'Pesquisar',
            )
          ],
          selectedFontSize: 8,
          unselectedFontSize: 8,
          unselectedItemColor: Palette.unselected,
          fixedColor: Palette.text,
          backgroundColor: Palette.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
        ));
  } */
