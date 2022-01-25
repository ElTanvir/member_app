import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/pagination/logic/pagination_provider.dart';
import 'package:member_app/utils/constants.dart';

class PaginationView extends ConsumerWidget {
  const PaginationView({
    required this.child,
    required this.widgetName,
    required this.pagecount,
    this.iconheight,
    this.showStyle = false,
    Key? key,
  }) : super(key: key);
  final double? iconheight;
  final String widgetName;
  final Widget child;
  final int pagecount;
  final bool showStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(paginationMenuBoolProvider(widgetName));
    ref.watch(paginationIndexProvider(widgetName));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: showStyle ? KEltDecoration.boxDecoration1 : null,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                child,
                if (pagecount > 1)
                  AnimatedPositioned(
                    bottom: constraints.biggest.height * 0.06,
                    left: ref
                            .watch(
                              paginationMenuBoolProvider(widgetName).notifier,
                            )
                            .isOpen
                        ? 0
                        : -constraints.biggest.width,
                    right: ref
                            .watch(
                              paginationMenuBoolProvider(widgetName).notifier,
                            )
                            .isOpen
                        ? 0
                        : constraints.biggest.width - (iconheight ?? 50),
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: KEltColor.background,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            elevation: 10,
                            child: SizedBox(
                              height: iconheight ?? 40,
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: pagecount,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(
                                        (iconheight ?? 40) / 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          ref
                                              .watch(
                                                paginationIndexProvider(
                                                  widgetName,
                                                ).notifier,
                                              )
                                              .statevalue = index + 1;
                                        },
                                        child: Container(
                                          decoration: ref
                                                      .watch(
                                                        paginationIndexProvider(
                                                          widgetName,
                                                        ).notifier,
                                                      )
                                                      .statevalue ==
                                                  index + 1
                                              ? KEltDecoration.innerShadow
                                              : KEltDecoration.boxDecoration1,
                                          // borderRadius:
                                          //     BorderRadius.circular(50),
                                          // elevation: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                              5,
                                            ),
                                            child: SizedBox(
                                              width: (iconheight ?? 40) - 20,
                                              child: Center(
                                                child: Text(
                                                    (index + 1).toString()),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .watch(
                                  paginationMenuBoolProvider(widgetName)
                                      .notifier,
                                )
                                .switchOpen();
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: KEltColor.background,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                ref
                                        .watch(
                                          paginationMenuBoolProvider(
                                            widgetName,
                                          ).notifier,
                                        )
                                        .isOpen
                                    ? Icons.chevron_left
                                    : Icons.chevron_right,
                                size: iconheight ?? 40,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                else
                  const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
