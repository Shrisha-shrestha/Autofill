import 'package:dartz/dartz.dart';

import '../models/blogdetail_model.dart';
import '../models/search_overview_model.dart';

abstract class SearchServices {
  //  /// Retrieves the list of blogs overview.
  // ///
  // /// Returns a [Future] that completes with a list of [BlogOverviewModel]
  Future<Either<List<SearchOverviewModel>, SearchFailureModel>>
      getBlogOverviewList({required String categorySlug});

      
  Future<APIResponseModel?> getPost(String slug);
}
