void main() {
  print('=== Task 1: Асинхронне отримання імені');
  task1();
}

void task1() async {
  print('Початок завдання 1');

  final name = await fetchName();
  print('Мене звати : $name');

  print('Кінець завдання 1');
}

Future<String> fetchName() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  return 'Boris';
}
