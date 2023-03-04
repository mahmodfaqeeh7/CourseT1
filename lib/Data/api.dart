import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class CharacterApi {



  List<Champs> champlist =[] ;


  static Future<String> Loadstatus() async{
    var url = Uri.parse("https://restcountries.com/v3.1/all");
    var respon = await http.get(url);
    return respon.body;

  }

   Future<Apilist> Apireturn() async{
    var data = await Loadstatus();

    if(data.isEmpty)
      return Apilist(apilist: []);
  
 var decodeddata = json.decode(data);
 var finallist = Apilist.fromJson(decodeddata);
 return finallist;

}
}