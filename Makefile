unit-tests:
	flutter test

unit-tests-coverage:
	flutter test --coverage
	lcov --remove coverage/lcov.info 'lib/src/unico/domain/entities/*' 'lib/src/unico/domain/entities/*/*' -o coverage/lcov.info
	genhtml coverage/lcov.info -o coverage/html

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs