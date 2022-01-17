import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/auth/data/data_models/auth_model.dart';
import 'package:member_app/features/auth/logic/auth_notfier.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/utils/utility_provider.dart';

final authProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, ApiState<AuthModel>>(
  (ref) => LoginNotifier(ref.watch(dioProvider)),
);
final logOutProvider =
    StateNotifierProvider.autoDispose<LogOutNotifier, ApiState<String>>(
  (ref) => LogOutNotifier(),
);
