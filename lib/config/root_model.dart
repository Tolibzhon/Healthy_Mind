class RootModel {
  late String healthy1;
  late String mind2;
  late String notes3;
  late String relaxation4;
  late bool meditationOn;

  RootModel({
    required this.healthy1,
    required this.mind2,
    required this.notes3,
    required this.relaxation4,
    required this.meditationOn,
  });

  RootModel.fromJson(Map<dynamic, dynamic> json) {
    healthy1 = json['healthy1'];
    mind2 = json['mind2'];
    notes3 = json['notes3'];
    relaxation4 = json['relaxation4'];
    meditationOn = json['meditationOn'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['healthy1'] = this.healthy1;
    data['mind2'] = this.mind2;
    data['notes3'] = this.notes3;
    data['relaxation4'] = this.relaxation4;
    data['meditationOn'] = this.meditationOn;
    return data;
  }
}
