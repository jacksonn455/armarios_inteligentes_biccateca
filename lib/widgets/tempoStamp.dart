class tempoStamp {
  int _timestamp;

  Teste({int timestamp}) {
    this._timestamp = timestamp;
  }

  int get timestamp => _timestamp;
  set timestamp(int timestamp) => _timestamp = timestamp;

  tempoStamp.fromJson(Map<String, dynamic> json) {
    _timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this._timestamp;
    return data;
  }
}