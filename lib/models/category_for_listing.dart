class Category {
  int categoryId;
  String categoryName;
  String createdAt;

  Category({
    this.categoryId,
    this.categoryName,
    this.createdAt,
  });

  factory Category.getfromJson(Map<String, dynamic> json) {
    return new Category(
      categoryId: json['id'],
      categoryName: json['categoryName'],
      createdAt: json['created_at'],
    );
  }
}
