import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/article_data.dart';
import 'package:tugas7_http_request/model/route.dart';
import 'package:tugas7_http_request/service/api_manager.dart';
import 'package:tugas7_http_request/ui/homepage/search.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  String token = '';

  @override
  Widget build(BuildContext context) {
    Object? args = ModalRoute.of(context)?.settings.arguments;
    if (args is String) {
      token = args;
    }

    Widget _logOutMessage(context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Yakin Meh Metu? Tenan?'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await _logOut();
              Navigator.pop(context);
            },
            child: const Text('IYes'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: const Text('ENo'),
          )
        ],
      );
    }

    Widget status() =>
        (token.isEmpty) ? const Icon(Icons.login) : const Icon(Icons.logout);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BlogApp'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () async {
              if (token.isEmpty) {
                final getToken = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                setState(() => token = getToken);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext contex) => _logOutMessage(contex),
                ).then(
                  (value) => setState(() {}),
                );
              }
            },
            icon: status(),
          )
        ],
      ),
      body: (artikel.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: artikel.length,
              itemBuilder: (BuildContext context, int index) {
                final post = artikel[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title ?? ""),
                    subtitle: Text(
                      post.excerpt ?? "",
                      maxLines: 4,
                    ),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }

  Future initialize() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(Constant.keyToken) ?? '';
    await ApiClient.getData();
    setState(() {});
  }

  Future<void> _logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(Constant.keyToken);
    token = sharedPreferences.getString(Constant.keyToken) ?? '';
  }
}
