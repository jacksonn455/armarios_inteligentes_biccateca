class NumeroPortas {
  int numerodeportas;

  NumeroPortas({this.numerodeportas});

  NumeroPortas.fromJson(Map<String, dynamic> json) {
    numerodeportas = json['numerodeportas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numerodeportas'] = this.numerodeportas;
    return data;
  }
}