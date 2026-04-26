// ignore_for_file: omit_local_variable_types, lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() {
  // print('=== Task 1: Асинхронне отримання імені');
  // task1();
  // print('=== Task 2: Асинхронне отримання віку');
  // task2();
  // print('=== Task 3: Послідовне виконання Future');
  // task3();
  // print('=== Task 4: Паралельне виконання Future (Future.wait)');
  // task4();
  // print('=== Task 5: Зворотний відлік з затримкою');
  // task5();
  // print('=== Task 6: Стрім з чисел (fromIterable)');
  // task6();
  print('=== Task 7: Зворотний відлік зі стріму (periodic)');
  task7();
}

// Завдання:
void task1() async {
  print('Початок завдання 1');

  final name = await fetchName();
  print('Мене звати : $name');

  print('Кінець завдання 1');
}

void task2() async {
  print('Початок завдання 2');

  final age = await fetchAge();
  print('Мені ${getAgeString(age)}');

  print('Кінець завдання 2');
}

void task3() async {
  // 1. Створюємо та запускаємо секундомір
  final stopwatch = Stopwatch()..start();

  print('Початок завантаження...');

  // 2. Послідовне виконання методів
  final name = await fetchName();
  final ageRaw = await fetchAge();

  // Зупиняємо секундомір
  stopwatch.stop();

  print('Мене звати $name, мені ${getAgeString(ageRaw)}');
  print('Загальний час виконання: ${stopwatch.elapsedMilliseconds} мс');
}

void task4() async {
  final stopwatch = Stopwatch()..start();
  print('Початок паралельного завантаження...');

  // Future.wait повертає список результатів у тому ж порядку,
  // у якому були передані Future-об'єкти.
  final results = await Future.wait([fetchName(), fetchAge()]);

  stopwatch.stop();

  final name = results[0] as String;
  final ageRaw = results[1] as int;

  print('Мене звати $name, мені ${getAgeString(ageRaw)}');
  print(
    'Загальний час виконання (паралельно): ${stopwatch.elapsedMilliseconds} мс',
  );
}

void task5() async {
  print('Приготуватись!...');

  final String result = await delayedCountdown(3);

  print(result);
}

void task6() async {
  final numbers = List.generate(5, (index) => Random().nextInt(5) + 1);
  print('Згенерований список чисел: $numbers');

  print('--- Вивід через await for ---');
  final streamForAwait = Stream<int>.fromIterable(numbers);
  await for (final number in streamForAwait) {
    stdout.write(number);
    await Future<void>.delayed(const Duration(milliseconds: 500));
    // print('Число: $number');
  }

  print('\n--- Вивід через listen ---');
  final streamForListen = Stream<int>.fromIterable(numbers);
  streamForListen.listen((number) {
    print('Слухач отримав: $number');
    // streamForListen.listen((number) async {
    //   stdout.write(number);
    //   await Future<void>.delayed(const Duration(milliseconds: 1000));
  });
}

void task7() async {
  final stream = Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) =>
        count +
        1, // Генеруємо числа від 1 і далі (count починається з 0, тому додаємо 1)
  );

  final limitedStream = stream.take(10);

  print('Відлік почато:');

  await for (final number in limitedStream) {
    stdout.write('$number... ');
  }

  print('\nВідлік завершено!');
}

// асинхронні функції для отримання даних (імітація запиту до сервера)
Future<String> fetchName() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  return 'Борис';
}

Future<int> fetchAge() async {
  await Future<void>.delayed(const Duration(milliseconds: 1500));
  return 44;
}

Future<String> delayedCountdown(int seconds) async {
  for (int i = seconds; i > 0; i--) {
    print('$i...');
    await Future<void>.delayed(const Duration(seconds: 1));
  }
  return 'Старт!';
}

// Функція для правильного відображення віку з урахуванням української граматики
String getAgeString(int age) {
  final lastDigit = age % 10;
  final lastTwoDigits = age % 100;

  // 1. Виняток для 11-14 (і всіх чисел, що закінчуються на 11-14) -> років
  if (lastTwoDigits >= 11 && lastTwoDigits <= 14) {
    return '$age років';
  }
  // 2. Якщо закінчується на 1 -> рік
  if (lastDigit == 1) {
    return '$age рік';
  }
  // 3. Якщо закінчується на 2, 3, 4 -> роки
  if (lastDigit >= 2 && lastDigit <= 4) {
    return '$age роки';
  }
  // 4. Решта: 0, 5-9 -> років
  return '$age років';
}
