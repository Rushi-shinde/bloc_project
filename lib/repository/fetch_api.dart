import 'package:bloc_project/models/product_model.dart';
import 'package:http/http.dart' as http;

class FetchApiRepo {

  Future<List<ProductsModel>> fetchData() async {
    final response = await http.get(Uri.parse("https://fakestoreapi.com/products/"));

    if (response.statusCode == 200) {
      var data = productsModelFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
