import 'package:flutter/material.dart';
import 'package:milkmanagement/model/contact.dart';
import 'package:milkmanagement/utils/database_helper.dart';

class SqliteView extends StatefulWidget {
  const SqliteView({Key? key}) : super(key: key);

  @override
  _SqliteViewState createState() => _SqliteViewState();
}

class _SqliteViewState extends State<SqliteView> {
  late DatabaseHandler handler;
  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqlite Data View"),
      ),
      body: FutureBuilder(
        future: handler.retrieveUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int>(snapshot.data![index].id!),
                  onDismissed: (DismissDirection direction) async {
                    await handler.deleteUser(snapshot.data![index].id!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Card(
                      child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Text(snapshot.data![index].name.toString()),
                    subtitle: Text(snapshot.data![index].age.toString()),
                  )),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
