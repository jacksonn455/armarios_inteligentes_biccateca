class Compartimentos {
  int id_compartimento;
  int id_tamanho;

  Compartimentos({this.id_compartimento, this.id_tamanho});

  Compartimentos.fromJson(Map<String, dynamic> json) {
    id_compartimento = json["id_compartimento"];
    id_tamanho = json["id_tamanho"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_compartimento': id_compartimento,
      'id_tamanho': id_tamanho
    };
  }
}