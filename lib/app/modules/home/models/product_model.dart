// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  int valor;
  String nome;
  TipoOuCategoriaDTO tipoProduto;
  TipoOuCategoriaDTO categoriaProduto;

  ProductModel({
    this.id,
    this.valor,
    this.nome,
    this.tipoProduto,
    this.categoriaProduto,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        valor: json["valor"],
        nome: json["nome"],
        tipoProduto: TipoOuCategoriaDTO.fromJson(json["tipo_produto"]),
        categoriaProduto:
            TipoOuCategoriaDTO.fromJson(json["categoria_produto"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
        "nome": nome,
        "tipo_produto": tipoProduto.toJson(),
        "categoria_produto": categoriaProduto.toJson(),
      };

  static List<ProductModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<ProductModel>((item) => ProductModel.fromJson(item))
        .toList();
  }
}

class TipoOuCategoriaDTO {
  String descricao;

  TipoOuCategoriaDTO({
    this.descricao,
  });

  factory TipoOuCategoriaDTO.fromJson(Map<String, dynamic> json) =>
      TipoOuCategoriaDTO(
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "descricao": descricao,
      };
}
