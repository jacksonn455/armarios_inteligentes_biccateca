class ObjetoJson {
  String mensagem;

  ObjetoJson({this.mensagem});

  ObjetoJson.fromJson(Map<String, dynamic> json) {
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mensagem'] = this.mensagem;
    return data;
  }
}