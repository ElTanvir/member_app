import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/core/data/data_models/user_model.dart';
import 'package:member_app/features/core/logic/core_notifier.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/utils/utility_provider.dart';

final homePageButtonIndexProvider =
    StateNotifierProvider<HomePageButtonIndex, int>(
  (ref) => HomePageButtonIndex(),
);
final userProvider = StateNotifierProvider<UserNotifier, ApiState<UserModel>>(
  (ref) => UserNotifier(ref.watch(dioProvider)),
);
