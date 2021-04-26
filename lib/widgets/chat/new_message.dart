import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {},
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
