import 'dart:io';

class Categories {
  final int categoryId;
  final String categoryName;
  final String categoryIconPath;

  Categories({this.categoryId, this.categoryName, this.categoryIconPath});
}

List<Categories> availablecategories = [
  Categories(
    categoryId: 1,
    categoryName: "Cardiologist",
    categoryIconPath: 'cardiology-clipart.png',
  ),
  Categories(
    categoryId: 2,
    categoryName: "Dentist",
    categoryIconPath: 'dental-clipart.png',
  ),
  Categories(
    categoryId: 3,
    categoryName: "ENT",
    categoryIconPath: 'ent-clipart.png',
  ),
  Categories(
    categoryId: 4,
    categoryName: "Neurologist",
    categoryIconPath: 'brain-clipart.png',
  ),
  Categories(
    categoryId: 5,
    categoryName: "Gynecologist",
    categoryIconPath: 'gynecology-clipart.png',
  ),
  Categories(
    categoryId: 6,
    categoryName: "Surgeon",
    categoryIconPath: 'surgery-clipart.png',
  ),
];
