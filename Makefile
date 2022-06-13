unit-tests:
	flutter test	./test/src/unico/domain/usecase/*.test.dart	\
					./test/src/unico/repository/*.test.dart

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs