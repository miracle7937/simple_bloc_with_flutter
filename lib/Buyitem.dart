import 'package:flutter/material.dart';

import 'manager.dart';
import 'model.dart';

class SelectedItem extends StatefulWidget {
  final List<ItemForSell> items;

  const SelectedItem({Key key, this.items}) : super(key: key);

  @override
  _SelectedItemState createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  Manager manger = Manager();
  int amount =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selected Item'),
        ),
        body: ListView.builder(
            itemCount: widget.items?.length ?? 0,
            itemBuilder: (context, index) {
             amount= amount+ widget.items[index].amount;
              return Dismissible(
                resizeDuration :const Duration(milliseconds: 700),
                direction: DismissDirection.endToStart,
                background: Container(color: Colors.lightGreen,),
                key: Key('${widget.items[index].items}'),
                  movementDuration: const Duration(milliseconds: 100),
                onDismissed: (direction ){

                  setState(() {
                    widget.items.removeAt(index);
                  });
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("${widget.items[index].items} dismissed")));
                },
                child: ListTile(
                    leading: Text(widget.items[index].items),
                    trailing: Text('${widget.items[index].amount}'),
                  ),
              );}),
    floatingActionButton: FloatingActionButton(onPressed: (){

      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Amount of Goods"),
            content: new Text('$amount dollar'),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    }),
    );
  }
}
