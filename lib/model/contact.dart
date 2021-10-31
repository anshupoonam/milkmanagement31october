class Contact {
  int? id;
  String? name;
  int? age;
  String? country;
  String? email;
 
 Contact({this.id, this.name, this.age, this.country, this.email});

  Contact.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        age = res["age"],
        country = res["country"],
        email = res["email"];
        
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'country': country,
      'email': email
      
    };
  }
}
