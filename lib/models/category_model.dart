class Category {
  //Fields
  String id;
  String name;
  String iconUrl;
  String type;
  String href;

  //Constructor
  Category({
    required this.id,
    required this.name,
    required this.iconUrl,
    required this.type,
    required this.href,
  });

  factory Category.fromJson(Map<dynamic, dynamic> mapCategoryData) => Category(
        id: mapCategoryData["id"],
        name: mapCategoryData["name"],
        iconUrl: mapCategoryData["icons"][0]["url"],
        type: mapCategoryData["type"],
        href: mapCategoryData["href"],
      );
}
