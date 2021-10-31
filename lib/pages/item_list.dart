import 'package:flutter/material.dart';
import 'package:milkmanagement/api/api_service.dart';
import 'package:milkmanagement/model/item_details.dart';
import 'package:get/get.dart';
import 'package:milkmanagement/pages/list_preview.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int selectedIndex = -1;
  int itemListLength = 0;
  List<TextEditingController> userNameController = [];
  List<TextEditingController> userNameControllerFree = [];
  late List<Data> itemNameList;
  bool isInSelection = false;
  Map<String, String> inputs = {};
  Map<String, String> inputsFree = {};
  Future<List<Data>>? itemList;
  @override
  void initState() {
    super.initState();
    APIService response = APIService();
    itemList = response.getItemList();
    itemNameList = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item List"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                SizedBox(
                  child: FutureBuilder(
                    future: itemList,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        //return Text("API Data " + snapshot.data!.title);
                        return ListView.builder(
//                  key: UniqueKey(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            userNameController.add(TextEditingController());
                            userNameControllerFree.add(TextEditingController());
                            itemNameList.add(snapshot.data[index]);
                            itemListLength++;

                            return InkWell(
                              onTap: () {
                                //setState(){
                                selectedIndex = index;
                              },
                              //onTap: () => setState(() => selectedIndex=index),
                              child: Card(
                                //key: ValueKey(snapshot.data[index].itemId),
                                color: (selectedIndex == index)
                                    ? Colors.green
                                    : null,
                                shape: (selectedIndex == index)
                                    ? const RoundedRectangleBorder(
                                        side:
                                            // ColoredBox(color: Colors.green,),
                                            BorderSide(color: Colors.yellow),
                                      )
                                    : const RoundedRectangleBorder(
                                        side:
                                            // ColoredBox(color: Colors.green,),
                                            BorderSide(color: Colors.red),
                                      ),
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {
                                    //setState(){
                                    selectedIndex = index;
                                    //}
                                  },
                                  title: Column(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${snapshot.data[index].itemCode} .) $index',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${snapshot.data[index].itemName}',
                                              maxLines: 1,
                                              softWrap: false,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'MRP: ',
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${snapshot.data[index].mrp}',
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Flexible(
                                            child: Text(
                                              'PTR: ',
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data[index].ptr}',
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            ' PTS: ',
                                          ),
                                          Text(
                                            '${snapshot.data[index].pts}',
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Flexible(
                                            child: Text(
                                              'Qty: ',
                                            ),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                                controller:
                                                    userNameController[index],
                                                decoration:
                                                    const InputDecoration(
                                                        //fillColor:Colors.blueGrey,
                                                        //filled: true
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                //textInputAction:TextInputAction.next,
                                                onChanged: (value) {
                                                  inputs['${snapshot.data[index].itemName.toString()}'] =
                                                      value;
                                                  inputsFree[
                                                          '${snapshot.data[index].itemName.toString()}'] =
                                                      "0";
                                                }),
                                          ),
                                          const Flexible(
                                            child: Text(
                                              'Free: ',
                                            ),
                                          ),
                                          Flexible(
                                            child: TextField(
                                                controller:
                                                    userNameControllerFree[
                                                        index],
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  inputsFree[snapshot
                                                      .data[index].itemName
                                                      .toString()] = value;
                                                }),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //leading: Icon(Icons.home),
                                  leading: CircleAvatar(
                                    child: ClipOval(
                                      child: GestureDetector(
                                        child: Image.network(
                                            '${snapshot.data[index].imageUrl}'),
                                        // child: Image.asset(
                                        //   //'assets/images/waiting.png',
                                        //   '${snapshot.data[index].imageUrl}',
                                        //   fit: BoxFit.cover,
                                        //   width: 80,
                                        //   height: 80,
                                        // ),
                                        onTap: () {
                                          print('object hello');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Success--- '),
                                              action: SnackBarAction(
                                                  label: 'Close',
                                                  onPressed: () {}),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data.length,
                        );
                      } else if (snapshot.hasError) {
                        return Text('Else ${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //print('######## ${inputs} -- ${inputsFree}');
              Get.to(() => ItemPreviewAndSave(
                  itemNameList: itemNameList,
                  inputs: inputs,
                  inputsFree: inputsFree,
                  itemLength: itemListLength));
            },
            child: const Text("Preview Data"),
          ),
        ],
      ),
    );
  }
}
