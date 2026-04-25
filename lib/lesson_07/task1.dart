// ignore_for_file: prefer_final_locals, lines_longer_than_80_chars

import 'dart:math';

void main() {
  final numbers = List.generate(100, (index) => Random().nextInt(101));
  print(
    '=== Створіть список numbers зі 100 елементів. Кожен елемент — випадкове число від 0 до 100',
  );
  print(numbers);
  print(
    '=== Виведіть на екран 65-й елемент списку у форматі: "65-й елемент: [значення]"',
  );
  print('65-й елемент: ${numbers[64]}');
  print('=== Вставте число 1000000000 на 50-ту позицію списку."');
  numbers.insert(49, 1000000000);
  print('$numbers');
  print('=== Видаліть зі списку елементи зі значеннями: 24, 45, 66, 88."');
  numbers.remove(24);
  numbers.remove(45);
  numbers.remove(66);
  numbers.remove(88);
  print('$numbers');
  print(
    '=== За допомогою циклу for переберіть список. Під час перебору: - Порахуйте суму всіх елементів, що діляться на 3 без залишку',
  );
  var sum = 0;
  for (var i = 0; i < numbers.length; i++) {
    if (numbers[i] % 3 == 0) {
      sum += numbers[i];
    }
  }
  print('Сума елементів, що діляться на 3: $sum');
  print(
    '=== Створіть порожній список temp. За допомогою циклу for-in переберіть numbers. Додайте до temp лише ті елементи, що діляться на 2 без залишку',
  );
  var temp = <int>[];
  for (final element in numbers) {
    if (element % 2 == 0) {
      temp.add(element);
    }
  }
  print(temp);
  print('=== Виведіть довжину списку temp');
  print('Довжина списку temp: ${temp.length}');
}
