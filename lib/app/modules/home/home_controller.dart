import 'package:example_hasura_flutter/app/modules/home/models/product_model.dart';
import 'package:example_hasura_flutter/app/modules/home/repositories/home_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeRepository _respository;
  _HomeBase(this._respository) {
    _respository.getProduto().then((value) => listaProdutos = value);
  }

  @observable
  List<ProductModel> listaProdutos = [];
}
