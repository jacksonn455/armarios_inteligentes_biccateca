class MacClass {
  String mac;

  MacClass({this.mac});

  MacClass.fromJson(Map<String, dynamic> json) {
    mac = json['mac'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mac'] = this.mac;
    return data;
  }
}