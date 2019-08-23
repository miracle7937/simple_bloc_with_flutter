

import 'dart:math';

class ValueList{

   List<ItemForSell> myItems(){
    List<ItemForSell> _items = [];

    for(int i = 0; i< getitem().length; i++ ){
      _items.add(ItemForSell(items:getitem()[i],amount:amount()[i]  ));
    }
  return _items;
}
  List<String> getitem(){
    var item= List.generate(100, (index)=>'item${[index]}');

    return item;

  }
  List<int> amount(){
    Random random = Random();
    var amount = List.generate(100, (index)=> random.nextInt(5000));
    return amount;
  }


}
class  ItemForSell  {
  final String items;
final int amount;

       ItemForSell({this.items, this.amount});
}