class CategoryModel {
  final int category;

  CategoryModel({required this.category});

  factory CategoryModel.fromJson(Map<int, dynamic> json) {
    return CategoryModel(category: json['category']);
  }
}
