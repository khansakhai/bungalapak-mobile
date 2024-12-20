import 'package:flutter/material.dart';
import 'package:bungalapak_mobile/models/item.dart';
import 'package:bungalapak_mobile/screens/list_item.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ItemPage()),
          ),
        ),
        title: const Text("Item Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.fields.name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Price: ${item.fields.price}",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  item.fields.description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
