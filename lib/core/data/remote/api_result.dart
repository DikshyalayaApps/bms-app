/// Author:    Nabraj Khadka
/// Created:   12.03.2023
/// Description:
/// (c) Copyright by Dikshyalaya.com
///*/

import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_result.freezed.dart';
@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required dynamic error}) =
      Failure<T>;
}
