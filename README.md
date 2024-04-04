I am checking out the flutter_riverpod package. 
I am also experimenting and documenting my learnings in between the code.

I'll make a list of things I learnt here.

A. Types of providers {Provider, StateProvider, StateNotifier+StateNotifierProvider, ChangeNotifier+ChangeNotifierProvider}

1. Consumer(Builder) vs ConsumerWidget (when to use what) and using ConsumerStatefulWidget w/ ConsumerState.
2. WidgetRef and ref.read, ref.watch,ref.read(providerName.notifier).update((state)=>value);, ref.read(providerName.select((value)=>null))
3. only ChangeNotifierProvider is mutable while others are immutable (bad thing!)
4. FutureProvider is better than FutureBuilder for handling data,error and loading. >> ref.watch(providerName).when() ,ref.watch(providerName).map)() .. {AsyncValue, AsyncData}
5. use a provider, a diff class and a method to achieve this like ![img.png](img.png)
6. similarly using StreamProvider.
7. FutureProvider.family allows for additional parameter. (but only one parameter... can work with immutable class tho)
8. .autoDispose and ref.keepAlive(), ref.onDispose(), ref.onCancel(), ref.onResume(), ... onAddListener ,onRemoveListener.
9. ProviderObserver for logging and debugging, useful in bigger apps.

packages riverpod_generator, riverpod_annotations, build_runner (remember to run it from the network not root!)
Riverpod generator for using intuitive functions for the same work. (@riverpod)
-> can add multiple parameters, even named parameters!


