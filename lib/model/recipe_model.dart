class Recipe {
  int id;
  String? userImageUrl;
  String name;
  String description;
  double duration;
  bool? isLiked;
  String? imageUrl;
  String? username;

  Recipe({
    required this.id,
    this.userImageUrl,
    required this.name,
    required this.description,
    this.username,
    required this.duration,
    this.isLiked,
    required this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, Object?> json) => Recipe(
        id: json["id"] as int,
        userImageUrl: json["userImageUrl"] as String?,
        name: json["name"] as String,
        description: json["description"] as String,
        username: json["username"] as String?,
        duration: json["duration"] as double,
        isLiked: json["isLiked"] as bool?,
        imageUrl: json["imageUrl"] as String?,
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "userImageUrl": userImageUrl,
        "name": name,
        "description": description,
        "duration": duration,
        "username": username,
        "isLiked": isLiked,
        "imageUrl": imageUrl,
      };

  @override
  String toString() {
    return "Recipe{id:$id,userImageUrl:$userImageUrl,name:$name,description:$description,username:$username,duration:$duration,imagUrl:$imageUrl,isLiked:$isLiked }";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}
