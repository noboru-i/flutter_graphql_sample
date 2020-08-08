// ref: https://aakira.app/blog/2020/06/flutter-graphql/
import 'package:artemis/artemis.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlApiClient {
  GraphqlApiClient()
      : graphQLClient = GraphQLClient(
          cache: InMemoryCache(),
          link: HttpLink(
            uri: 'http://10.0.2.2:3000/graphql',
          ),
        );

  final GraphQLClient graphQLClient;

  Future<QueryResult> query(GraphQLQuery query) async {
    final QueryResult result = await graphQLClient.query(QueryOptions(
      documentNode: query.document,
      variables: query.variables?.toJson(),
    ));

    if (result.hasException) {
      print(result.exception);
      for (final GraphQLError error in result.exception.graphqlErrors) {
        print(error.message);
      }
    }

    return result;
  }

  Future<QueryResult> mutate(GraphQLQuery query) async {
    final QueryResult result = await graphQLClient.mutate(MutationOptions(
      documentNode: query.document,
      variables: query.variables?.toJson(),
    ));

    if (result.hasException) {
      print(result.exception);
      for (final GraphQLError error in result.exception.graphqlErrors) {
        print(error.message);
      }
    }

    return result;
  }
}
