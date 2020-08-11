import 'package:graphql_flutter/graphql_flutter.dart';

final server_url = "http://127.0.0.1:8000";

final HttpLink httpLink = HttpLink(
  uri: server_url+"/graphql/",
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    cache: InMemoryCache(),
    link: httpLink,
  );
}