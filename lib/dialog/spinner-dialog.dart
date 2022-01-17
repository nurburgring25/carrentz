import 'package:carrentz/model/spinner-item.dart';
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class SpinnerDialog extends StatefulWidget {
  String title;
  ValueSetter<SpinnerItem> callback;
  List<SpinnerItem> items;

  SpinnerDialog({
    required this.title,
    required this.callback,
    required this.items,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SpinnerDialogState();
  }
}

class SpinnerDialogState extends State<SpinnerDialog> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.searchController.addListener(() {
      setState(() {

      });
    });

    return SimpleDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    (context.widget as SpinnerDialog).title
                ),
                Spacer(),
                SizedBox(
                    width: 20,
                    height: 20,
                    child: IconButton(
                        splashRadius: 20,
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.close, size: 20),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }
                    )
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              decoration: new InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  hintText: 'Cari'
              ),
              controller: searchController,
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
        contentPadding: EdgeInsets.only(top: 0),
        children: (context.widget as SpinnerDialog).items
            .where((element) => (element.description).toLowerCase().contains(searchController.value.text.toLowerCase()))
            .map(
                (element) =>
                ListTile(
                    title: Text(
                        element.description
                    ),
                    onTap: () {
                      (context.widget as SpinnerDialog).callback(element);

                      Navigator.of(context).pop();
                    }
                ))
            .toList()
    );
  }
}