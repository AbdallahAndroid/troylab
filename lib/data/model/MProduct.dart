class MProduct {

  int id;
  int category_id;
  String name ;
  double price;
  String image; //
  int stock;
  int kcal;

  MProduct(this.id, this.category_id, this.name, this.price, this.image,
      this.stock, this.kcal);

  @override
  String toString() {
    return 'MProduct{category_id: $category_id, name: $name}';
  }
}