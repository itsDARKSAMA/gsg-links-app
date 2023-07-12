// class SearchModel {
//   List<SearchedUser>? searchedUsers;

//   SearchModel({this.searchedUsers});
// }

class SearchModel {
  int? id;
  String? name;

  SearchModel({
    this.id,
    this.name,
  });

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
