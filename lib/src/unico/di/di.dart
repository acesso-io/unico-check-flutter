abstract class Di {
  static final Di _instance = _DiImpletation();

  static final Di I = _instance;

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });

  T get<T extends Object>();

  void clearFactories();
}

typedef FactoryFunc<T> = T Function();

class _DiImpletation<T> implements Di {
  final _factories = Map<Type, Object>();

  @override
  void registerFactory<T extends Object>(FactoryFunc<T> factoryFunc,
      {String? instanceName}) {
    final key = T;

    if (!_factories.containsKey(key)) {
      _factories[key] = factoryFunc();
    }
  }

  @override
  T get<T extends Object>() {
    final result = _factories[T];

    if (result == null) {
      throw Exception('Factory not registered for $T');
    }

    return result as T;
  }

  @override
  void clearFactories() {
    _factories.clear();
  }
}
