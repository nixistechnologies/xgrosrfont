import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:xgrosr/GraphQL/queries.dart';
import 'package:xgrosr/GraphQL/connection.dart';
import 'package:xgrosr/models/categoryModel.dart';

class CategoryRepository{
  GraphQLClient _client = clientToQuery();
  
  fetchCategory() async{
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(getCategoryQuery)
      )
    );

    if(!result.hasException){

      List data = result.data["categorys"]["edges"];
      List<CategoryModel> prd= [];
      // print("XXXX");
      // final cat = CategoryModel.fromJson(result.data["categorys"]["edges"]);
      // final cat = CategoryModel(id, name, imgUrl)
      // print(data.length);
      data.forEach((e) => prd.add(CategoryModel(e["node"]["id"],e["node"]["name"],e["node"]["image"])) );
      // print(prd.length);
      return prd;
    }
  }

}