import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    //thêm link ở đây
    final String jsonString =
        await rootBundle.loadString('assets/image/member_list.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      contacts = jsonList.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Bạ'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact['name']),
            subtitle: Text(contact['phone']),
          );
        },
      ),
      floatingActionButton: buildAddContactFAB(),
    );
  }

  Widget buildAddContactFAB() {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Xử lý sự kiện khi nhấn vào nút thêm
      },
      child: Icon(Icons.add),
    );
  }
}
