class User {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;

  User({
    this.email,
    this.name,
    this.profilePhoto,
    this.state,
    this.status,
    this.uid,
    this.username,
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data['status'] = user.status;
    data['state'] = user.state;
    data['profile_photo'] = user.profilePhoto;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.username = mapData['username'];
    this.status = mapData['status'];
    this.state = mapData['state'];
    this.profilePhoto = mapData['profile_photo'];
  }

  User.froJson(Map<String, dynamic> JsonData) {
    this.uid = JsonData['uid'];
    this.name = JsonData['name'];
    this.email = JsonData['email'];
    this.username = JsonData['username'];
    this.status = JsonData['status'];
    this.state = JsonData['state'];
    this.profilePhoto = JsonData['profile_photo'];
  }
}
