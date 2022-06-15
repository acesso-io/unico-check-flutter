/// Abstract class to help dependency injection.
abstract class Injection {
  static final Injection _instance = _DiImpletation();

  static final Injection I = _instance;

  void factory<T extends Object>(FactoryFunc<T> factoryFunc);

  T get<T extends Object>();

  void clearFactories();
}

typedef FactoryFunc<T> = T Function();

class _DiImpletation<T> implements Injection {
  final _factories = <Type, Object>{};

  @override
  // ignore: avoid_shadowing_type_parameters
  void factory<T extends Object>(FactoryFunc<T> factoryFunc) {
    final key = T;

    if (!_factories.containsKey(key)) {
      _factories[key] = factoryFunc();
    }
  }

  @override
  // ignore: avoid_shadowing_type_parameters
  T get<T extends Object>() {
    final result = _factories[T];

    if (result == null) {
      throw Exception('Factory is not registered for $T');
    }

    return result as T;
  }

  @override
  void clearFactories() {
    _factories.clear();
  }
}
