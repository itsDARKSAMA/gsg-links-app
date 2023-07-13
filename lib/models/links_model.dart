class Links {
  List<LinksData>? links;

  Links({this.links});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['links'] != null) {
      links = <LinksData>[];
      json['links'].forEach((v) {
        links!.add(LinksData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LinksData {
  int? id;
  String? title;
  String? link;
  String? username;
  int? isActive;
  int? userId;
  String? createdAt;
  String? updatedAt;

  LinksData(
      {this.id,
      this.title,
      this.link,
      this.username,
      this.isActive,
      this.userId,
      this.createdAt,
      this.updatedAt});

  LinksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    username = json['username'];
    isActive = json['isActive'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['username'] = username;
    data['isActive'] = isActive;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
