import 'package:canteen/domain/entities/admin_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_model.g.dart';

@JsonSerializable()
class AdminModel extends AdminEntity {
  const AdminModel({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required Map<String, dynamic> paymentDetails,
    required Map<String, dynamic> schedule,
  }) : super(
          id: id,
          name: name,
          surname: surname,
          email: email,
          phoneNumber: phoneNumber,
          paymentDetails: paymentDetails,
          schedule: schedule,
        );

  AdminModel.empty()
      : super(
          id: '',
          name: '',
          surname: '',
          email: '',
          phoneNumber: '',
          paymentDetails: {},
          schedule: {},
        );

  factory AdminModel.fromJson(Map<String, Object?> json) =>
      _$AdminModelFromJson(json);

  Map<String, Object?> toJson() => _$AdminModelToJson(this);
}
