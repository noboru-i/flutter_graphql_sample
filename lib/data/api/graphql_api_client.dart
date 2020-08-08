// ref: https://aakira.app/blog/2020/06/flutter-graphql/

import 'package:artemis/artemis.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final networkOnlyPolicies = Policies(
  fetch: FetchPolicy.networkOnly,
);

class GraphqlApiClient {
  GraphqlApiClient()
      : _client = GraphQLClient(
          cache: InMemoryCache(),
          link: HttpLink(
            uri: 'http://10.0.2.2:3000/graphql',
          ),
          defaultPolicies: DefaultPolicies(
            watchQuery: networkOnlyPolicies,
            query: networkOnlyPolicies,
            mutate: networkOnlyPolicies,
          ),
        );

  final GraphQLClient _client;

  Future<QueryResult> query(GraphQLQuery query) async {
    final QueryResult result = await _client.query(QueryOptions(
      documentNode: query.document,
      variables: query.variables?.toJson(),
    ));

    if (result.hasException) {
      // TODO any handling.
      print(result.exception);
      for (final GraphQLError error in result.exception.graphqlErrors) {
        print(error.message);
      }
    }

    return result;
  }

  Future<QueryResult> mutate(GraphQLQuery query) async {
    final QueryResult result = await _client.mutate(MutationOptions(
      documentNode: query.document,
      variables: query.variables?.toJson(),
    ));

    if (result.hasException) {
      // TODO any handling.
      print(result.exception);
      for (final GraphQLError error in result.exception.graphqlErrors) {
        print(error.message);
      }
    }

    return result;
  }
}
