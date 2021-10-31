import 'package:flutter/material.dart';
import 'package:milkmanagement/constant/drawer_header.dart';
import 'package:milkmanagement/constant/drawer_footer.dart';
import 'package:milkmanagement/constant/drawer_list_tile.dart';
class DrawerCode extends StatelessWidget {
  const DrawerCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            createDrawerHeader(context),
            Container(
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.7,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Drawer(
                child: DrawerList(context),
              ),
            ),
            FooterDrawer(context),
          ],
        ),
      ),
    );
  }
}
