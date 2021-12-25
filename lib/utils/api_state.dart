import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_app/utils/network_exceptions.dart';
part 'api_state.freezed.dart';

@freezed
abstract class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _ApiStateinitial;
  const factory ApiState.loading() = _ApiStateloading;
  const factory ApiState.loaded({required T data}) = _ApiStateloaded<T>;
  const factory ApiState.error({required NetworkExceptions error}) =
      _ApiStateerror<T>;
}
