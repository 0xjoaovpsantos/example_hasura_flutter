import 'package:example_hasura_flutter/app/modules/home/repositories/home_repository.dart';
import 'package:example_hasura_flutter/app/modules/home/widgets/card_produto/card_produto_controller.dart';
import 'package:example_hasura_flutter/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:example_hasura_flutter/app/modules/home/home_page.dart';
import 'package:hasura_connect/hasura_connect.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //Controllers
        Bind((i) => CardProdutoController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        //Repositories
        Bind((i) => HomeRepository(i.get<HasuraConnect>())),
        //Outros
        Bind((i) => HasuraConnect(
            "https://example-hasura-flutter.herokuapp.com/v1/graphql"))
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
