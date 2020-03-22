import 'package:example_hasura_flutter/app/app_module.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/add_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/add_produto_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AddProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => AddProdutoController(i.get<AddProdutoRepository>())),
        //Repositories
        Bind((i) => AddProdutoRepository(AppModule.to.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AddProdutoPage()),
      ];

  static Inject get to => Inject<AddProdutoModule>.of();
}
