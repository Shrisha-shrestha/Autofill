import 'dart:convert';

import 'package:autofill/src/features/autofill/models/search_overview_model.dart';
import 'package:autofill/src/features/autofill/services/search_services.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/blogdetail_model.dart';

class SearchServicesImplementation implements SearchServices {
  @override


   Future<Either<List<SearchOverviewModel>, SearchFailureModel>> getBlogOverviewList(
      {required String categorySlug}) async {
     String url =
        'http://192.168.99.20/api/v1/blog/categories/$categorySlug/posts/';
    final response = await http.get(
      Uri.parse(url),
    );
    // print(response.statusCode.toString());
    if (response.statusCode == 200) {
      List<SearchOverviewModel> responseModel = List<SearchOverviewModel>.from(
          jsonDecode(utf8.decode(response.bodyBytes))["results"]
              .map((x) => SearchOverviewModel.fromJson(x)));
      return Left(responseModel);
    }
    else if( response.statusCode == 404){
      SearchFailureModel responseModel = SearchFailureModel.fromJson(json.decode(response.body));
       return Right(responseModel);    }
    else{
       throw Exception('Error fetching data');
       }
    }

      Future<APIResponseModel?> getPost(String slug) async {
    String url = 'http://192.168.99.20/api/v1/blog/posts/$slug/';
    print(url);
    final response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      APIResponseModel responseModel =
          APIResponseModel.fromJson(json.decode(response.body));
      return responseModel;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
