import 'package:example_hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddProdutoRepository extends Disposable {
  final HasuraConnect hasuraConnect;

  AddProdutoRepository(this.hasuraConnect);

  Future<TipoCategoriaProdutoDto> getTipoCategoriaProduto() async {
    var query = ''' 
                query getTipoCategoriaProduto {
                    tipo_produto {
                      id
                      descricao
                    }
                    categoria_produto {
                      id
                      descricao
                    }
                }  ''';

    var snapshot = await hasuraConnect.query(query);
    return TipoCategoriaProdutoDto.fromJson(snapshot["data"]);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
