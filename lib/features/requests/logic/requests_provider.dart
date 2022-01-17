import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/logic/pagination_provider.dart';
import 'package:member_app/features/requests/data/data_models/bed_change_response.dart';
import 'package:member_app/features/requests/data/data_models/package_change_response_model.dart';
import 'package:member_app/features/requests/data/requests_repository.dart';
import 'package:member_app/features/requests/logic/requests_notfier.dart';
import 'package:member_app/main.dart';
import 'package:member_app/services/api_state.dart';
import 'package:member_app/utils/utility_provider.dart';

final requestRepoProvider = Provider<IRequestRepopsitory>(
  (ref) {
    if (ref.watch(appIsLiveProvider)) {
      return LiveRequestRepopsitory();
    } else {
      return FakeRequestRepopsitory();
    }
  },
);

final packageChangeListProvider = StateNotifierProvider.family.autoDispose<
    PackageChangeNotifier, ApiState<PackageChageResponseModel>, String>(
  (ref, name) => PackageChangeNotifier(
    ref.watch(requestRepoProvider),
    ref.watch(dioProvider),
    ref.watch(paginationIndexProvider(name)),
  ),
);
final bedChangeListProvider = StateNotifierProvider.family
    .autoDispose<BedChangeNotifier, ApiState<BedChangeResponse>, String>(
  (ref, name) => BedChangeNotifier(
    ref.watch(requestRepoProvider),
    ref.watch(dioProvider),
    ref.watch(paginationIndexProvider(name)),
  ),
);
