import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/logic/pagination_notfier.dart';

final paginationMenuBoolProvider =
    ChangeNotifierProvider.autoDispose.family<PaginationOpenNotifier, String>(
  (ref, id) => PaginationOpenNotifier(),
);
final paginationIndexProvider = StateNotifierProvider.autoDispose
    .family<PaginationIndexNotfier, int, String>(
  (ref, id) => PaginationIndexNotfier(),
);
final paginationCountProvider = StateNotifierProvider.autoDispose
    .family<PaginationMaxCountNotfier, int, String>(
  (ref, id) => PaginationMaxCountNotfier(),
);
