import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  List _dataList = [];

  @override
  void initState() {
    super.initState();
    _getDataFromApi();
  }

  Future<void> _getDataFromApi() async {
    var url = Uri.parse('https://ishigami.mogax.fr/words');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _dataList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data from API');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          final data = _dataList[index];
          final kanji = data['kanji'];
          final signification = data['signification'];
          final description = data['description'];
          final lines = data['lines'];

          return Card(
            child: ListTile(
              leading: Text(
                '$kanji',
                style: const TextStyle(fontSize: 45),
              ),
              title: Text('$signification ($lines lignes)'),
              subtitle: Text('$description'),
              trailing: const Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
