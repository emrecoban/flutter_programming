import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metin Listesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> metinListesi = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void metniListeyeEkle() {
    String girilenMetin = _controller.text;
    if (girilenMetin.isNotEmpty) {
      setState(() {
        metinListesi.add(girilenMetin);
      });
      _controller.clear();
    }
  }

  void metniListedenSil(int index) {
    setState(() {
      metinListesi.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metin Listesi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Metin giriniz',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: metinListesi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(metinListesi[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => metniListedenSil(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: metniListeyeEkle,
        tooltip: 'Metni listeye ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}
