import 'package:idev/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:equatable/equatable.dart';
part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel<TestModel> with EquatableMixin {
  TestModel({
    this.userId,
    this.id,
    this.title,
  });
  final int? userId;
  final int? id;
  final String? title;

  @override
  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }

  @override
  List<Object?> get props => [userId, id, title];
}
