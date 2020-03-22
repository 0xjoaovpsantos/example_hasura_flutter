import 'package:example_hasura_flutter/app/shared/custom_combobox/custom_combobox_widget.dart';
import 'package:example_hasura_flutter/app/shared/widgets/label/label_widget.dart';
import 'package:flutter/material.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState extends State<AddProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
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
                            color: Theme.of(context).primaryColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2))),
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
                            color: Theme.of(context).primaryColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2))),
              ),
              SizedBox(height: 20),
              LabelWidget(title: "Categoria do Produto:"),
              CustomComboboxWidget(
                items: [
                  Model("01", "Brasil"),
                  Model("02", "Italia"),
                  Model("03", "Estados Unidos")
                ],
                onChange: (item) {
                  print(item.id);
                },
                itemSelecionado: Model("01", "Brasil"),
              ),

              LabelWidget(title: "Tipo Produto:"),
              SizedBox(
                height: 20,
              ),
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
      ),
    );
  }
}
