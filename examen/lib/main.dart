import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: MyTabBarView(),
    );
  }
}

class MyTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Lista'),
              Tab(text: 'Otra Sección'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                MyListView(),
                Center(child: Text('Contenido de Otra Sección')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> items = ['Elemento 1', 'Elemento 2', 'Elemento 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(item: items[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String item;

  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detalles de $item'),
            // Aquí puedes añadir más información o características
          ],
        ),
      ),
    );
  }
}
