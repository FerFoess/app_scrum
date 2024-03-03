import 'dart:convert';
import 'package:flutter/material.dart';
import 'item.dart';
import 'item_detail.dart'; 
class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('data_scrum.json');
    List<dynamic> jsonList = json.decode(jsonString);

    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrum Elements'),
        backgroundColor: Color.fromARGB(255, 32, 69, 255),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailScreen(item: items[index])),
                );
              },
              child: Text(items[index].name),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 178, 178, 178), 
                textStyle: const TextStyle(fontSize: 18),
                padding: const EdgeInsets.all(20), 
              ),
            ),
          );
        },
      ),
    );
  }
}
