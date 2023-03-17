class Category {
  final String id;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  Category({
    required this.id,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });
}

class Categories {
  List<Category> items = [];

  Categories();

  Categories.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final category = Category(
        id: item['idCategory'],
        strCategory: item['strCategory'],
        strCategoryThumb: item['strCategoryThumb'],
        strCategoryDescription: item['strCategoryDescription'],
      );
      items.add(category);
    }
  }
}
