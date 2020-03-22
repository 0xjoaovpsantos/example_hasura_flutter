// To parse this JSON data, do
//
//     final tipoCategoriaProdutoDto = tipoCategoriaProdutoDtoFromJson(jsonString);

import 'dart:convert';

TipoCategoriaProdutoDto tipoCategoriaProdutoDtoFromJson(String str) =>
    TipoCategoriaProdutoDto.fromJson(json.decode(str));

String tipoCategoriaProdutoDtoToJson(TipoCategoriaProdutoDto data) =>
    json.encode(data.toJson());

class TipoCategoriaProdutoDto {
  List<TipoECategoriaDTO> tipoProduto;
  List<TipoECategoriaDTO> categoriaProduto;

  TipoCategoriaProdutoDto({
    this.tipoProduto,
    this.categoriaProduto,
  });

  factory TipoCategoriaProdutoDto.fromJson(Map<String, dynamic> json) =>
      TipoCategoriaProdutoDto(
        tipoProduto: List<TipoECategoriaDTO>.from(
            json["tipo_produto"].map((x) => TipoECategoriaDTO.fromJson(x))),
        categoriaProduto: List<TipoECategoriaDTO>.from(json["categoria_produto"]
            .map((x) => TipoECategoriaDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tipo_produto": List<dynamic>.from(tipoProduto.map((x) => x.toJson())),
        "categoria_produto":
            List<dynamic>.from(categoriaProduto.map((x) => x.toJson())),
      };

  static List<TipoCategoriaProdutoDto> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<TipoCategoriaProdutoDto>(
            (item) => TipoCategoriaProdutoDto.fromJson(item))
        .toList();
  }
}

class TipoECategoriaDTO {
  String id;
  String descricao;

  TipoECategoriaDTO({
    this.id,
    this.descricao,
  });

  factory TipoECategoriaDTO.fromJson(Map<String, dynamic> json) =>
      TipoECategoriaDTO(
        id: json["id"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descricao": descricao,
      };
}
