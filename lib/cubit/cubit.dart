

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fongi/cubit/states.dart';
import 'package:fongi/dio/dio.dart';

import '../models/products.dart';
import '../models/products.dart';

class EcommerceCubit extends Cubit<EcommerceStates>
{
  EcommerceCubit() : super (EcommerceInitialState());
  static EcommerceCubit get(context) => BlocProvider.of(context);

  List<products> all =[];
  void getAll(){
    ApiServices().getall().then((value)
    {
      all = value;
    }
    );

  }
   List<products> data =[];
     void getProducts(){
    ApiServices().getproudcts().then((value)
    {
     data = value;
    }
    );

  }
  List<products> foot =[];

  void getFootwear(){
    ApiServices().getFootwear().then((value)
    {
      foot = value;

    }
    );

  }
  List<products> Watches =[];

  void getWatches(){
    ApiServices().getWatches().then((value)
    {
      Watches = value;

    }
    );

  }


}