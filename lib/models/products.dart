class products {
  String? id;
  String? title;
  String? description;
  int? price;
  String? size;
  String? color;
  String? image;
  String? category;
  String? date;
  int? iV;

  products(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.size,
        this.color,
        this.image,
        this.category,
        this.date,
        this.iV});

  products.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    category = json['category'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['size'] = this.size;
    data['color'] = this.color;
    data['image'] = this.image;
    data['category'] = this.category;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
