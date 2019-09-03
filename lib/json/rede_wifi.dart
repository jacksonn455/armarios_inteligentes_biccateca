class RedeWifi {
  String ssid;
  String ipGateway;

  RedeWifi({this.ssid, this.ipGateway});

  RedeWifi.fromJson(Map<String, dynamic> json) {
    ssid = json['ssid'];
    ipGateway = json['ip_gateway'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ssid'] = this.ssid;
    data['ip_gateway'] = this.ipGateway;
    return data;
  }
}