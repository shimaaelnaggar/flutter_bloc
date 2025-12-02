class Character {
  late int characterId;
  late String name;
  late String nickname;
  late String img;
  late String birthday;
  late List<dynamic> occupation;
  late String status;
  late List<dynamic> appearance;
  late String actorName;
  late String category;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    characterId = json['char_id'];
    name = json['name'];
    nickname = json['nickname'];
    img = json['img'];
    birthday = json['birthday'];
    occupation = json['occupation'];
    status = json['status'];
    appearance = json['appearance'];
    actorName = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}
