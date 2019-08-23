import 'package:cart_app/Buyitem.dart';
import 'package:flutter/material.dart';

import 'manager.dart';
import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Manager manger = Manager();
  bool ontab = false;

  List<ItemForSell> liked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<ItemForSell>>(
          stream: manger.sellerList,
          builder: (context, snapShot) {
            return ListView.builder(
              itemCount: snapShot.data.length -1 ?? null,
              itemBuilder: (context, index) => MySell(
                liked: liked,
                myGoods: snapShot.data[index],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectedItem(
                        items: liked,
                      )));
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  @override
  void dispose() {
    manger.controller.close();
    super.dispose();
  }
}

class MySell extends StatefulWidget {
  final List<ItemForSell> liked;
  final ItemForSell myGoods;

  const MySell({Key key, this.liked, this.myGoods}) : super(key: key);

  @override
  _MySellState createState() => _MySellState();
}

class _MySellState extends State<MySell> {
  bool buying = false;


  addedItem(bool buying){

    if(buying== true){
      widget.liked.add(widget.myGoods);
    }
    if(buying== false){

      if(widget.liked.contains(widget.myGoods)){
        widget.liked.remove(widget.myGoods);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.myGoods.items),
      trailing: IconButton(
          icon: buying == false ? Icon(Icons.add) : Icon(Icons.done),
          onPressed: (){
            setState(() {
              buying = !buying;
              addedItem(buying);
            });
          }),subtitle: Text('${widget.myGoods.amount}'),
    );
  }
}
