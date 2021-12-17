class Message {
  final String text;
  final String date;

  Message(this.text, this.date);

  Message.fromJson(Map<dynamic, dynamic> json)
      : date = json['date'] as String,
        text = json['text'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'date': date.toString(),
    'text': text,
  };
}


/*
part 'Login.g.dart';

@JsonSerializable()
class Login {
  String? username;
  String? password;

  Login({this.username, this.password});
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
*/
