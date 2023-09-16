import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  final dynamic id;
  final String name;
  final String place;
  UpdateScreen({
    super.key,
    required this.id,
    required this.name,
    required this.place,
  });

  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: name),
          ),
          TextField(
            controller: _placeController,
            decoration: InputDecoration(hintText: place),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('datas')
                  .doc(id)
                  .update({
                'name': _nameController.text,
                'place': _placeController.text,
              });
              Navigator.pop(context);
            },
            child: Text('update'),
          )
        ],
      ),
    );
  }
}
