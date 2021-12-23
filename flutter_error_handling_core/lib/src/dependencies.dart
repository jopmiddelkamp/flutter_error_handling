import 'package:get_it/get_it.dart';

class CoreDependencies {
  const CoreDependencies({
    required this.dependencies,
  });

  final List<Dependency> dependencies;

  void registerAll() {
    for (final dependency in dependencies) {
      dependency.register();
    }
  }
}

abstract class Dependency {
  const Dependency();

  void register();
}

class Factory<T extends Object> extends Dependency {
  const Factory(
    this.factoryFunc, {
    this.instanceName,
  });

  final FactoryFunc<T> factoryFunc;
  final String? instanceName;

  @override
  void register() {
    GetIt.instance.registerFactory<T>(
      factoryFunc,
      instanceName: instanceName,
    );
  }
}

class SingletonAsync<T extends Object> extends Dependency {
  const SingletonAsync(
    this.factoryFunc, {
    this.instanceName,
    this.dependsOn,
    this.signalsReady,
    this.dispose,
  });

  final FactoryFuncAsync<T> factoryFunc;
  final String? instanceName;
  final Iterable<Type>? dependsOn;
  final bool? signalsReady;
  final DisposingFunc<T>? dispose;

  @override
  void register() {
    GetIt.instance.registerSingletonAsync<T>(
      factoryFunc,
      instanceName: instanceName,
      dependsOn: dependsOn,
      signalsReady: signalsReady,
      dispose: dispose,
    );
  }
}
