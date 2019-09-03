class SinalWifi{
  int rssi;

  SinalWifi({this.rssi});

  SinalWifi.fromJson(Map<String, dynamic> json) {
    rssi = json['rssi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rssi'] = this.rssi;
    return data;
  }
}