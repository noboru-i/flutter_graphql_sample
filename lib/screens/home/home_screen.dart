import 'package:flutter/material.dart';
import 'package:fluttergraphqlsample/data/api/graphql_api_client.dart';
import 'package:fluttergraphqlsample/generated/graphql_api.graphql.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List$Query$Post> posts = [];

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    final client = GraphqlApiClient();

    final query = ListQuery();
    final result = await client.query(query);
    final data = query.parse(result.data);
    setState(() {
      posts = data.posts;
    });
  }

  Future<void> _upvote(int postId) async {
    final client = GraphqlApiClient();

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
        title: Text('Sample'),
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
