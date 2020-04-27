class Category {
  String categoryId;
  String categoryName;
  DateTime createdAt;

  Category({
    this.categoryId,
    this.categoryName,
    this.createdAt,
  });

  factory Category.getfromJson(Map<String, dynamic> json) {
    return new Category(
      categoryId: json['CategoryId'],
      categoryName: json['categoryName'],
     // createdAt: json['created_at'],
    );
  }
}
