import 'dart:async';

void main() {
  // print('=== Task 1: Асинхронне отримання імені');
  // task1();
  // print('=== Task 2: Асинхронне отримання віку');
  // task2();
  print('=== Task 3: Послідовне виконання Future');
  task3();
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

// асинхронні функції для отримання даних (імітація запиту до сервера)
Future<String> fetchName() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  return 'Борис';
}

Future<int> fetchAge() async {
  await Future<void>.delayed(const Duration(milliseconds: 1500));
  return 44;
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
