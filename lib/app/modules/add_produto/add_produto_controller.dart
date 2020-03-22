import 'package:example_hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoBase with _$AddProdutoController;

abstract class _AddProdutoBase with Store {
  final AddProdutoRepository addProdutoRepository;

  _AddProdutoBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;
}
