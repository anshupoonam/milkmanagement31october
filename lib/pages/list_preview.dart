import 'package:flutter/material.dart';
import 'package:milkmanagement/model/item_details.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemPreviewAndSave extends StatefulWidget {
  final List<Data> itemNameList;
  Map<String, String> inputs = {};
  Map<String, String> inputsFree = {};
  //final Datum datumObject;
  final int itemLength;
  // ignore: use_key_in_widget_constructors
  ItemPreviewAndSave(
      {required this.itemNameList,
      required this.inputs,
      required this.inputsFree,
      required this.itemLength});

  @override
  _ItemPreviewAndSaveState createState() => _ItemPreviewAndSaveState();
}

class _ItemPreviewAndSaveState extends State<ItemPreviewAndSave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Preview And Save"),
        actions: [
          IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.back();
                //themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
        //leading: const Icon(Icons.pages_outlined),
      ),
      body: Container(
        // padding: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(2.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.79,
                    child: ListView.builder(
                      itemCount: widget.inputs.length,
                      itemBuilder: (BuildContext context, int index) {
                        //  String key = widget.inputs.keys.elementAt(index);
                        int freei = 0;
                        String free = widget.inputsFree.values.elementAt(index);
                        //   print('Free ----------- ${free}');
                        if (free.isEmpty || free == '0' || free == '') {
                          freei = 0;
                        } else {
                          freei = int.parse(
                              widget.inputsFree.values.elementAt(index));
                        }
                        return widget.inputs.values.elementAt(index) == ''
                            ? Column()
                            : Card(
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        widget.inputs.keys.elementAt(index),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            "Qty: ${widget.inputs.values.elementAt(index)}",
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                          const SizedBox(
                                            width: 100,
                                          ),
                                          Text(
                                            "Free: $freei",
                                            style: const TextStyle(
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Success', 'Data Saved Successfully.',
                    snackPosition: SnackPosition.BOTTOM);
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                ),
              child: const Text("Final Save"),
            ),
          ],
        ),
      ),
    );
  }
}
