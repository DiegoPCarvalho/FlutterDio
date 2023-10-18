import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:myapp/pages/auto_size_text_page.dart';
import 'package:myapp/pages/bateryPlus/battery_plus_page.dart';
import 'package:myapp/pages/geolocator/geolocator_page.dart';
import 'package:myapp/pages/percentual%20Indicator/percentual_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.album_rounded),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blueAccent),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        'https://publicdomainvectors.org/photos/abstract-user-flat-4.png')),
                accountName: const Text("Diego Carvalho"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("https://dio.me"));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.internetExplorer,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Abrir Dio"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              await launchUrl(Uri.parse("google.navigation:q=santos&mode=d"));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.mapLocation,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Abrir Google Maps"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              await Share.share('Site top https://dio.me');
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.shareNodes,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Compartilhar"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              var dir = await path_provider.getTemporaryDirectory();
              print(dir.path);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.pager,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("path"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BatteryPlusPage()));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.batteryHalf,
                        color: Colors.green, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Bateria"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;

              print(appName);
              print(packageName);
              print(version);
              print(buildNumber);
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.appStoreIos,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Informacoes app"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
              print('Running on ${androidInfo.model}');
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.dev, color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Informacao Device"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              final connectivityResult =
                  await (Connectivity().checkConnectivity());
              if (connectivityResult == ConnectivityResult.mobile) {
                // I am connected to a mobile network.
              } else if (connectivityResult == ConnectivityResult.wifi) {
                // I am connected to a wifi network.
                print(connectivityResult);
              } else if (connectivityResult == ConnectivityResult.ethernet) {
                // I am connected to a ethernet network.
              } else if (connectivityResult == ConnectivityResult.vpn) {
                // I am connected to a vpn network.
                // Note for iOS and macOS:
                // There is no separate network interface type for [vpn].
                // It returns [other] on any device (also simulator)
              } else if (connectivityResult == ConnectivityResult.bluetooth) {
                // I am connected to a bluetooth.
              } else if (connectivityResult == ConnectivityResult.other) {
                // I am connected to a network which is not in the above mentioned networks.
              } else if (connectivityResult == ConnectivityResult.none) {
                // I am not connected to any network.
              }
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.wifi, color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Conexao"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PercentualPage()));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.percent,
                        color: Colors.green, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Porcentagem"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AutoSizePage()));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.textHeight,
                        color: Colors.green, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Auto SIze"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Intl.defaultLocale = 'pt_BR';
              var f = NumberFormat('###.0#', 'en_US');
              var fbr = NumberFormat('###.0#', 'pt_BR');
              print(f.format(12.345));
              print(fbr.format(12.345));

              var data = DateTime(2022, 05, 09);
              print(DateFormat('EEEEE', 'en_US').format(data));
              // print(DateFormat('EEEEE', 'pt_BR').format(data));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.home,
                        color: Colors.green, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                    Text("INTL"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const GeolocatorPage()));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.gasPump,
                        color: Colors.blue, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text("GPS"),
                  ],
                )),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
