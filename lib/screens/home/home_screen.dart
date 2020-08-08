import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:fluttergraphqlsample/generated/graphql_api.graphql.dart';
import 'package:fluttergraphqlsample/screens/home/home_state.dart';
import 'package:fluttergraphqlsample/screens/home/home_state_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeStateNotifier, HomeState>(
      create: (_) => HomeStateNotifier(),
      lazy: false,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text('Sample'),
        ),
        body: _List(),
      ),
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = context.select((HomeState state) => state.posts);
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => _buildListItem(context, posts[index]),
    );
  }

  Widget _buildListItem(BuildContext context, List$Query$Post item) {
    return ListTile(
      title: Text(item.title),
      trailing: Text('vote: ${item.votes}'),
      onTap: () {
        context.read<HomeStateNotifier>().upvote(item.id);
      },
    );
  }
}
