import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/products.dart';

class ApiServices {
   Dio? dio;

  ApiServices() {
    dio = Dio();
  }

   Future<List<products>> getall() async {
     Response response = await dio!.get("http://10.0.2.2:3000/products/");
     var data = response.data.toList();


     for(var i = 0 ; i <data.length; i++){

       all.add(products.fromJson(data[i]));

     }


     return all;

   }
  List<products>Tshirts=[];
  Future<List<products>> getproudcts() async {
      Response response = await dio!.get("http://10.0.2.2:3000/products/");
      var data = response.data.toList();


      for(var i = 0 ; i <data.length; i++){
        if(products.fromJson(data[i]).category!.startsWith("T"))
          Tshirts.add(products.fromJson(data[i]));

      }


      return Tshirts;

  }
   List<products>Footwear=[];

   Future<List<products>> getFootwear() async {
     Response response = await dio!.get("http://10.0.2.2:3000/products/");
     var data = response.data.toList();


     for(var i = 0 ; i <data.length; i++){
       if(products.fromJson(data[i]).category!.startsWith("F"))
       Footwear.add(products.fromJson(data[i]));

     }


    return Footwear;
   }
   List<products>Watches=[];

   Future<List<products>> getWatches() async {
     Response response = await dio!.get("http://10.0.2.2:3000/products/");
     var data = response.data.toList();


     for(var i = 0 ; i <data.length; i++){
       if(products.fromJson(data[i]).category!.startsWith("W"))
         Watches.add(products.fromJson(data[i]));

     }

      print(Watches[1].title);
     return Watches;
   }
}
