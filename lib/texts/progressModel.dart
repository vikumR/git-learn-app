class ProgressModel {
  int pid;
  String _topic;
  String _date;

  ProgressModel(this._topic, this._date);

  ProgressModel.map(dynamic obj) {
    this._topic = obj['topic'];
    this._date = obj['date'];
  }

  String get topic => _topic;

  String get date => _date;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['topic'] = topic;
    map['date'] = _date;
    return map;
  }

  void setID(int pid) {
    this.pid = pid;
  }
}
