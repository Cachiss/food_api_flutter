class Area {
  final String strArea;

  Area({required this.strArea});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(strArea: json['strArea']);
  }
}

class Areas {
  List<Area> items = [];

  Areas();

  Areas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final area = Area.fromJson(item);
      items.add(area);
    }
  }
}
