import 'package:flutter/material.dart';

import 'data_wisata.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Data Wisata'),
          backgroundColor: Colors.pinkAccent,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'List'),
              Tab(icon: Icon(Icons.grid_on), text: 'Grid'),
            ],
          ),
        ),
        body: TabBarView(children: [buildListView(), buildGridView()]),
      ),
    );
  }
}

Widget buildListView() {
  return ListView.builder(
    itemCount: data_wisata.length,
    itemBuilder: (context, index) {
      final item = data_wisata[index];

      return Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(item: item)),
            );
          },
          leading: Image.network(item['gambar']!, width: 70, fit: BoxFit.cover),
          title: Text(item['nama']!),
          subtitle: Text(item['lokasi']!),
        ),
      );
    },
  );
}

Widget buildGridView() {
  return GridView.builder(
    padding: EdgeInsets.all(10),
    itemCount: data_wisata.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemBuilder: (context, index) {
      final item = data_wisata[index];

      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(item: item)),
          );
        },
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  item['gambar']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(padding: EdgeInsets.all(8), child: Text(item['nama']!)),
              Padding(padding: EdgeInsets.all(8), child: Text(item['lokasi']!)),
            ],
          ),
        ),
      );
    },
  );
}
