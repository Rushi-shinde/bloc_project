import 'package:bloc_project/repository/fetch_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/first_bloc/product_bloc.dart';
import 'UI/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    FetchApi fetchApi = FetchApi();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(fetchApi: fetchApi),
      child: const MaterialApp(
        home: HomePage(title: 'Bloc Project'),
      ),
    );
  }
}

