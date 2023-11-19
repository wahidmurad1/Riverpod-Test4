import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project3/counter_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).increment();
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).decrement();
                    // if (counter <= 0) {
                    //   ref.invalidate(counterNotifierProvider);
                    // }
                  },
                  child: const Text('-', style: TextStyle(fontSize: 30))),
            ],
          ),
        ],
      ),
    );
  }
}
