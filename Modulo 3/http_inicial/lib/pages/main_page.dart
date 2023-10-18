import 'package:flutter/material.dart';
import 'package:trilhapp/pages/card_page.dart';
import 'package:trilhapp/pages/image_assets.dart';
// import 'package:trilhapp/pages/list_view.dart';
import 'package:trilhapp/pages/consulta_cep.dart';
import 'package:trilhapp/shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Main Page",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  children: const [
                    ConsultaCep(),
                    CardPage(),
                    Pagina2Page(),
                    // ListViewPage()
                  ]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  // setState(() {
                  //   posicaoPagina = value;
                  // });
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "HTTP", icon: Icon(Icons.apps_rounded)),
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  // BottomNavigationBarItem(
                  //     label: "Pag3", icon: Icon(Icons.person)),
                  // BottomNavigationBarItem(
                  //     label: "Pag4", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
