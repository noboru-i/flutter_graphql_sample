import 'package:flutter/material.dart';
import 'package:fluttergraphqlsample/data/api/graphql_api_client.dart';
import 'package:fluttergraphqlsample/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => _Providers(child: child),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class _Providers extends StatelessWidget {
  const _Providers({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GraphqlApiClient>(
          create: (_) => GraphqlApiClient(),
        ),
      ],
      child: child,
    );
  }
}
