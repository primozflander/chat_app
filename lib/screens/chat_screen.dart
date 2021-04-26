import 'package:chat_app/widgets/chat/messages.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
                value: 'logout',
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('chats/5yepBGCLjrJk5hRZgr4y/messages')
      //       .snapshots(),
      //   builder: (ctx, streamSnapshot) {
      //     if (streamSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     final docs = streamSnapshot.data.docs;
      //     return ListView.builder(
      //       itemCount: docs.length,
      //       itemBuilder: (ctx, index) => Container(
      //         padding: EdgeInsets.all(8),
      //         child: Text(docs[index]['text']),
      //       ),
      //     );
      //   },
      // ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messsages(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/5yepBGCLjrJk5hRZgr4y/messages')
              .add({'text': 'This was added by clicking a button'});
        },
      ),
    );
  }
}
