class versaoClass {
  String versao;

  versaoClass({this.versao});

  versaoClass.fromJson(Map<String, dynamic> json) {
    versao = json['versao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['versao'] = this.versao;
    return data;
  }
}