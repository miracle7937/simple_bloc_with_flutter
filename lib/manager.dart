import 'dart:async';

import 'model.dart';






class Manager{
 ValueList valueList = new ValueList();
 StreamController controller = StreamController<List<ItemForSell>>();

  // ignore: close_sinks
  StreamController myLiked = StreamController<List<String>>();



    Stream get sellerList => controller.stream;
 Stream get getAmount => myLiked.stream;




    Manager(){
      controller.add(valueList.myItems());



    }

}