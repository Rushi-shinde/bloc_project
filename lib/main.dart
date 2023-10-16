import 'package:bloc_project/repository/fetch_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/Home_Page_Bloc/product_bloc.dart';
import 'UI/home.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => FetchApiRepo(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FetchApiRepo fetchApiRepo = FetchApiRepo();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(fetchApiRepo: fetchApiRepo),
      child: const MaterialApp(
        home: HomePage(title: 'Bloc Project'),
      ),
    );
  }
}

