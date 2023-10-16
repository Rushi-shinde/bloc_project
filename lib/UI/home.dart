import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Home_Page_Bloc/product_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "My App",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(builder: (context, constraints) {
              // Adjust the crossAxisCount based on screen width

              int crossAxisCount = 4;

              if (constraints.maxWidth <= 600) {
                crossAxisCount = 2;
              } else if (constraints.maxWidth <= 1200) {
                crossAxisCount = 3;
              } else {
                crossAxisCount = 4;
              }

              return BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if(state is ProductInitialState){
                    return Center(
                      child: SizedBox(
                        width: 500,
                        child : InkWell(
                          onTap: () {
                            context.read<ProductBloc>().add(ProductLoadedEvent());
                          },
                          child: Container(
                            width: 300.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFF7F265B),
                              borderRadius: BorderRadius.circular(
                                  40.0),
                            ),
                            child: const Center(
                                child: Text(
                                  "GET DATA",
                                  style: TextStyle(
                                      fontSize: 18.00, color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is ProductLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProductLoadedState) {
                    return GridView.builder(
                        itemCount: state.productsModel.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 30,
                        ),
                        itemBuilder: (context, index) {
                          return GridTile(
                            header: Card(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    state.productsModel[index].title.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            ),
                            footer: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                    'Price : ${state.productsModel[index].price} Rs.',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.00))),
                            child: Card(
                                child: Image.network(
                              state.productsModel[index].image.toString(),
                              width: 100.00,
                            )),
                          );
                        });
                  }

                  if (state is ProductErrorState) {
                    return Center(child: Text(state.errorMsg));
                  }

                  return const SizedBox();
                },
              );
            }),
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
