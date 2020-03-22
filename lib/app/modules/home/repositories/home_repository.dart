import 'package:example_hasura_flutter/app/modules/home/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);

  Future<List<ProductModel>> getProduto() async {
    var query = ''' 
              query getProdutos {
                produto {
                  id
                  valor
                  nome
                  tipo_produto {
                    descricao
                  }
                  categoria_produto {
                    descricao
                  }
                }
              }   ''';

    var snapshot = await _hasuraConnect.query(query);

    return ProductModel.fromJsonList(snapshot["data"]["produto"] as List);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
