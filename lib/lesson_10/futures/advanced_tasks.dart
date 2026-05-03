void main() {}

void task1() async {
  print('початок main');

  Future(() => print('майбутня подія 1')).then((_) {
    print('обробка then 1');
    Future(() => print('вкладена майбутня подія'));
  });

  Future.sync(
    () => print('синхронна подія'),
  ).then((_) => print('обробка then синхронної'));

  await Future(
    () => print('майбутня подія 2'),
  ).then((_) => print('обробка then 2'));

  print('кінець main');
}

void task2() async {
  print('1: Початок');

  Future.delayed(Duration.zero, () => print('2: Затримка 0'));

  Future(() => print('3: Звичайна подія')).then((_) {
    print('4: Then звичайної події');
  });

  Future.microtask(() => print('5: Мікрозавдання'));

  await Future.sync(() {
    print('6: Синхронний Future');
    return 'Дані';
  }).then((value) => print('7: Then синхронного ($value)'));

  print('8: Кінець main');
}

void task3() {
  print('1: Старт');

  Future(() {
    print('2: Подія 1');
    Future.microtask(() => print('3: Мікрозавдання всередині Події 1'));
  }).then((_) => print('4: Then Події 1'));

  Future.microtask(() => print('5: Перше мікрозавдання'));

  Future(() => print('6: Подія 2'));

  Future.sync(() => print('7: Синхронний Future'));

  print('8: Фініш main');
}
