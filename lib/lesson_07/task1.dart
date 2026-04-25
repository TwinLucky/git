// ignore_for_file: lines_longer_than_80_chars
// ignore: prefer_final_locals

import 'dart:math';

void main() {
  final list = List.generate(100, (index) => Random().nextInt(101));
  print(
    '=== Створіть список numbers зі 100 елементів. Кожен елемент — випадкове число від 0 до 100',
  );
  print(list);
  print(
    '=== Виведіть на екран 65-й елемент списку у форматі: "65-й елемент: [значення]"',
  );
  print('65-й елемент: ${list[64]}');
  print('=== Вставте число 1000000000 на 50-ту позицію списку."');
  list.insert(49, 1000000000);
  print('$list');
  print('=== Видаліть зі списку елементи зі значеннями: 24, 45, 66, 88."');
  list.remove(24);
  list.remove(45);
  list.remove(66);
  list.remove(88);
  print('$list');
}
