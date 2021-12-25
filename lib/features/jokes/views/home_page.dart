import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/jokes/logic/jokes_provider.dart';
import 'package:member_app/utils/network_exceptions.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
                          return Text(
                            '${_.data.setup}\n\n${_.data.delivery}',
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return Text(
                            _.data.joke!,
                            textAlign: TextAlign.center,
                          );
                        }
                      },
                      error: (_) =>
                          Text(NetworkExceptions.getErrorMessage(_.error))));
            },
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Hello'),
              onPressed: () {
                ref
                    .watch(jokesProvider.notifier)
                    .getJoke(category: 'any', type: 'twopart');
              },
            ),
          ),
        ],
      ),
    ));
  }
}
