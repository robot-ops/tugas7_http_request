import 'package:flutter/material.dart';
import 'package:tugas7_http_request/model/search_data.dart';
import 'package:tugas7_http_request/service/api_manager.dart';
import 'package:tugas7_http_request/ui/widget/cust_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool onSearch = false;
  List<SearchData> searchData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onSearch = true;
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          CustomSearch(labelText: 'Input Title Here', onChange: _searchData),
          Expanded(
            child: (onSearch)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : searchResult(),
          )
        ],
      ),
    );
  }

  Future initialize() async {
    final resultData = await ApiClient.getResult('');
    setState(() {
      onSearch = false;
      searchData = resultData;
    });
  }

  Future<void> _searchData(String query) async {
    setState(() {
      onSearch = true;
    });
    final resultData = await ApiClient.getResult(query);
    setState(() {
      onSearch = false;
      searchData = resultData;
    });
  }

  Widget searchResult() {
    return (searchData.isEmpty)
        ? const Center(
            child: Text('Data Not Found !'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              final post = searchData[index];
              return Card(
                child: ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.url!),
                ),
              );
            },
            itemCount: searchData.length,
          );
  }
}
