import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/article_data.dart';
import 'package:tugas7_http_request/service/api_manager.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';
import 'package:tugas7_http_request/ui/widget/custom_navigation.dart';

import 'profile.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Artikelmodel> _artikelModels;
  @override
  void initState() {
    _artikelModels = ApiClient.getData() as Future<Artikelmodel>;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: FutureBuilder<Artikelmodel>(
          future: _artikelModels,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.infoartikel.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.infoartikel[index];
                  return Container(
                    height: 100,
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                article.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                article.excerpt,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // late Future<Artikel> _artikel;
  // @override
  // void initState() {
  // TODO: implement initState
  // _artikel = ApiClient.getData();
  //   super.initState();
  //   init();
  // }

  // String token = '';
  // int selectedPage = 0;
  // final pageOptions = [
  //   HomePage(),
  //   SearchPage(),
  //   ProfilePage(),
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   Object? args = ModalRoute.of(context)?.settings.arguments;
  //   if (args is String) {
  //     token = args;
  //   }
  // Widget _widgetHasData(Artikel data) {
  //   Article? news = data.infoartikel?.article;
  //   return ListView(
  //     children: <Widget>[
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Text(
  //               '${Constant.baseUrl}${news?.title}',
  //               textAlign: TextAlign.center,
  //             ),
  //             Text(
  //               '${Constant.baseUrl}${news?.excerpt}',
  //               textAlign: TextAlign.center,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Object? args = ModalRoute.of(context)?.settings.arguments;
  // if (args is String) token = args;

  // Widget _signOutDialog(BuildContext context) {
  //   return AlertDialog(
  //     title: const Text('Sign Out'),
  //     content: const Text('Do you want to sign out?'),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () async {
  //           await _signOut();
  //           Navigator.pop(context);
  //         },
  //         child: const Text('YES'),
  //       ),
  //       TextButton(
  //         onPressed: () => Navigator.pop(context),
  //         child: const Text('NO'),
  //       ),
  //     ],
  //   );
  // }

  // Widget iconStatus() => (token.isEmpty)
  //     ? const Icon(
  //         Icons.login,
  //       )
  //     : const Icon(
  //         Icons.logout,
  //         color: Colors.black,
  //       );

  // return Scaffold(
  // backgroundColor: Colors.white,
  // body: (post.isEmpty)
  //     ? const Center(
  //         child: CircularProgressIndicator(),
  //       )
  //     : ListView.separated(
  //         itemBuilder: (context, index) {
  //           final posts = post[index];
  //           return ListTile(
  //             title: Text(posts.title ?? ""),
  //             subtitle: Text(
  //               posts.excerpt ?? "",
  //               maxLines: 5,
  //             ),
  //             trailing: const Icon(Icons.more_vert),
  //             isThreeLine: true,
  //           );
  //         },
  //         separatorBuilder: (context, index) => const Divider(),
  //         itemCount: post.length),
  // bottomNavigationBar: CustomNavigation(
  //   selectedNavbar: selectedPage,
  // ),
  //     body: (post.isEmpty)
  //         ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //         : ListView.separated(
  //             itemBuilder: (context, index) {
  //               final posts = post[index];
  //               return ListTile(
  //                 title: Text(posts.title),
  //                 subtitle: Text(
  //                   posts.excerpt,
  //                   maxLines: 4,
  //                 ),
  //                 trailing: const Icon(Icons.more_vert),
  //                 isThreeLine: true,
  //               );
  //             },
  //             separatorBuilder: (context, index) => const Divider(),
  //             itemCount: post.length,
  //           ),
  //   );
  // }

  // Future init() async {
  //   SharedPreferences _preferences = await SharedPreferences.getInstance();
  //   token = _preferences.getString(Constant.keyToken) ?? '';
  //   await ApiClient.getData();
  //   setState(() {});
  // }

  // Future<void> _signOut() async {
  //   SharedPreferences _preferences = await SharedPreferences.getInstance();
  //   await _preferences.remove(Constant.keyToken);
  //   token = _preferences.getString(Constant.keyToken) ?? '';
  // }

  // void moveToLoginPage() async {
  //   final getToken = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginPage(),
  //     ),
  //   );
  //   setState(() {
  //     token = getToken;
  //   });
  // }
}
