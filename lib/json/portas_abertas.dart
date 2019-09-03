class PortasAbertas {
  int i;
  int n;

  PortasAbertas({this.i, this.n});

  PortasAbertas.fromJson(Map<String, dynamic> json) {
    i = json["i"];
    n = json["n"];
  }

  Map<String, dynamic> toJson() {
    return {
      'i': i,
      'n': n
    };
  }
}