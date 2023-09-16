import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/update.dart';
import 'package:flutter/material.dart';

class ViewSreen extends StatefulWidget {
  final List<DocumentSnapshot> docs;
  const ViewSreen({super.key, required this.docs});

  @override
  State<ViewSreen> createState() => _ViewSreenState();
}

class _ViewSreenState extends State<ViewSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read and delete'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final name = widget.docs[index]['name'];
          final place = widget.docs[index]['place'];
          final id = widget.docs[index].id;
          return ListTile(
              title: Text(name),
              subtitle: Text(place),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: () async {
                      await widget.docs[index].reference.delete();
                      setState(() {
                        widget.docs.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateScreen(
                            id: id,
                            name: name,
                            place: place,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              ));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: widget.docs.length,
      ),
    );
  }
}
