import 'package:example_hasura_flutter/app/shared/custom_combobox/custom_combobox_controller.dart';
import 'package:example_hasura_flutter/app/app_controller.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/add_produto_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:example_hasura_flutter/app/app_widget.dart';
import 'package:example_hasura_flutter/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomComboboxController()),
        Bind((i) => AppController()),
        //Outros
        Bind((i) => HasuraConnect(
            "https://example-hasura-flutter.herokuapp.com/v1/graphql"))
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/AddProduto', module: AddProdutoModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
