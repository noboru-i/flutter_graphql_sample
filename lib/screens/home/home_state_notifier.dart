import 'package:fluttergraphqlsample/data/api/graphql_api_client.dart';
import 'package:fluttergraphqlsample/generated/graphql_api.graphql.dart';
import 'package:fluttergraphqlsample/screens/home/home_state.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeStateNotifier extends StateNotifier<HomeState> with LocatorMixin {
  HomeStateNotifier() : super(const HomeState());

  @override
  void initState() {
    _fetch();
  }

  Future<void> _fetch() async {
    final client = GraphqlApiClient();

    final query = ListQuery();
    final result = await client.query(query);
    final data = query.parse(result.data);

    state = state.copyWith(posts: data.posts);
  }

  Future<void> upvote(int postId) async {
    final client = GraphqlApiClient();

    final query = UpvotePostMutation(
      variables: UpvotePostArguments(
        postId: postId,
      ),
    );
    final result = await client.mutate(query);
    final data = query.parse(result.data);
    print('data = ${data.upvotePost.toJson()}');

    _fetch();
  }
}
