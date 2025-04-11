import 'data.dart';

class GetSliderModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GetSliderModel({this.data, this.message, this.error, this.status});

  factory GetSliderModel.fromJson(Map<String, dynamic> json) {
    return GetSliderModel(
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}
