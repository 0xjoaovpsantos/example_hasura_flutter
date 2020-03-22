import 'package:example_hasura_flutter/app/modules/add_produto/add_produto_controller.dart';
import 'package:example_hasura_flutter/app/modules/add_produto/add_produto_module.dart';
import 'package:example_hasura_flutter/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:example_hasura_flutter/app/shared/widgets/label/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  AddProdutoController addProdutoController = AddProdutoModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height - 250,
            right: -50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
              radius: 130,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 200,
            right: 50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
              radius: 130,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 150,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.4),
              radius: 130,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LabelWidget(title: "Descricao"),
                  TextField(
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                        hintText: "Descricao do Produto",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelWidget(title: "Valor"),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                        hintText: "Valor",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2))),
                  ),
                  SizedBox(height: 20),
                  LabelWidget(title: "Categoria do Produto:"),
                  Observer(builder: (BuildContext context) {
                    if (addProdutoController.tipoProduto == null) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: CircularProgressIndicator())
                          ],
                        ),
                      );
                    }

                    return CustomComboboxWidget(
                      items: addProdutoController.tipoProduto.categoriaProduto
                          .map((data) => Model(data.id, data.descricao))
                          .toList(),
                      onChange: (item) {
                        print(item.id);
                      },
                      itemSelecionado: null,
                    );
                  }),

                  LabelWidget(title: "Tipo Produto:"),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(builder: (BuildContext context) {
                    if (addProdutoController.tipoProduto == null) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            )
                          ],
                        ),
                      );
                    }

                    return CustomComboboxWidget(
                      items: addProdutoController.tipoProduto.tipoProduto
                          .map((data) => Model(data.id, data.descricao))
                          .toList(),
                      onChange: (item) {
                        print(item.id);
                      },
                      itemSelecionado: null,
                    );
                  }),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Salvar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  )
                  //CustomComboboxWidget()
                ]),
          )
        ],
      ),
    );
  }
}
