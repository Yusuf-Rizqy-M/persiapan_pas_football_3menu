// models/register_response_model.dart
class RegisterModel {
  final bool status;
  final String message;

  RegisterModel.RegisterModel({
    required this.status,
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel.RegisterModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}