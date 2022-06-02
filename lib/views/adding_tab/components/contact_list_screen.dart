import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:monas/constants/constants.dart';
import 'package:monas/viewmodels/adding_transaction/detail_info_vm.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detailInfo = context.watch<DetailInfoViewmodel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact List",
          style: S.headerTextStyles.header2(null),
        ),
        backgroundColor: S.colors.primaryColor,
      ),
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
          future: getContacts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: SizedBox(
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Contact contact = snapshot.data[index];
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                  title: Text(contact.displayName),
                  subtitle: Text(contact.phones[0]),
                  onTap: () {
                    Navigator.pop(context);
                    detailInfo.setWithPerson(contact.displayName);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Future<List<Contact>> getContacts() async {
  bool isGranted = await Permission.contacts.status.isGranted;
  if (isGranted) {
    return await FastContacts.allContacts;
  } else {
    isGranted = await Permission.contacts.request().isGranted;
  }
  return [];
}
