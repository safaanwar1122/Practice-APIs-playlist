class GetCommentsModel {
  GetCommentsModel({
    required  this.postId,
    required   this.id,
    required   this.name,
    required   this.email,
    required   this.body,});

  GetCommentsModel.fromJson(dynamic json) {
   postId = json['postId'];
  id = json['id'];
    name = json['name'];
   email = json['email'];
   body = json['body'];
  }
  late   int postId;
  late   int id;
  late   String name;
  late   String email;
  late   String body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }

}