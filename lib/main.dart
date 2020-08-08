import 'package:artemis/artemis.dart';
import 'package:flutter/material.dart';
import 'package:fluttergraphqlsample/generated/graphql_api.graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List$Query$Post> posts = [];

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    final client = GraphQLApiClient();

    final query = ListQuery();
    final result = await client.query(query);
    final data = query.parse(result.data);
    setState(() {
      posts = data.posts;
    });
  }

  Future<void> _upvote(int postId) async {
    final client = GraphQLApiClient();

    final query = UpvotePostMutation(
      variables: UpvotePostArguments(
        postId: postId,
      ),
    );
    final result = await client.mutate(query);
    final data = query.parse(result.data);
    print('data = ${data.upvotePost.toJson()}');

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => _buildListItem(index),
      ),
    );
  }

  Widget _buildListItem(int index) {
    final item = posts[index];
    return ListTile(
      title: Text(item.title),
      trailing: Text('vote: ${item.votes}'),
      onTap: () {
        _upvote(item.id);
      },
    );
  }
}

// ref: https://aakira.app/blog/2020/06/flutter-graphql/
class GraphQLApiClient {
  GraphQLApiClient()
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

    if (!result.hasException) {
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

    if (!result.hasException) {
      print(result.exception);
      for (final GraphQLError error in result.exception.graphqlErrors) {
        print(error.message);
      }
    }

    return result;
  }
}
