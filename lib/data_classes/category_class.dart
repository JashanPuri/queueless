import 'dart:io';

class Categories{
    final int categoryId;
    final String categoryName;
    final File categoryIcon;

    Categories({
      this.categoryId,this.categoryName,this.categoryIcon
});
}
List<Categories> availablecategories= [
  Categories(categoryId: 1,categoryName: "Cardiologist"),
  Categories(categoryId: 2,categoryName: "Dentist"),
  Categories(categoryId: 3,categoryName: "EnT"),
  Categories(categoryId: 4,categoryName: "Neurologist"),
  Categories(categoryId: 5,categoryName: "Gynaecologist"),
  Categories(categoryId: 6,categoryName: "Surgeon"),
];

List<Categories> getCategories(){
    return availablecategories;
}
