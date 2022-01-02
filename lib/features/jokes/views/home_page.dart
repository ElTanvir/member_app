import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/core/views/ctckupper.dart';
import 'package:member_app/features/jokes/logic/jokes_provider.dart';
import 'package:member_app/services/network_exceptions.dart';
import 'package:member_app/utils/constants.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final zero = ref.watch(jokesProvider);
                return SizedBox(
                  child: zero.map(
                    initial: (_) => const SizedBox(),
                    loading: (_) => const CircularProgressIndicator(),
                    loaded: (_) {
                      if (_.data.type == 'twopart') {
                        return Container(
                          decoration: KEltDecoration.boxDecoration1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _.data.setup!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  decoration: ConcaveDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    colors: [
                                      KEltColor.primary.withOpacity(0.2),
                                      KEltColor.background.withOpacity(0.7),
                                    ],
                                    depression: 5,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      _.data.delivery!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          decoration: KEltDecoration.boxDecoration1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              _.data.joke!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    error: (_) => Text(
                      NetworkExceptions.getErrorMessage(_.error),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClickButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickButton extends ConsumerStatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ClickButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ClickButton> createState() => _ClickButtonState();
}

class _ClickButtonState extends ConsumerState<ClickButton> {
  bool tapped = false;
  void tapdown() {
    setState(() {
      tapped = true;
    });
  }

  void tapUp() {
    setState(() {
      tapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        tapdown();
      },
      onTapUp: (details) {
        tapUp();
      },
      child: Container(
        decoration: tapped
            ? ConcaveDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                depression: 5,
              )
            : KEltDecoration.boxDecoration1,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Hello'),
        ),
      ),
      onTap: () {
        ref
            .watch(jokesProvider.notifier)
            .getJoke(category: 'any', type: 'twopart');
      },
    );
  }
}
