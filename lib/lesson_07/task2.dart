// ignore_for_file: lines_longer_than_80_chars, unused_import
import 'package:git_lesson/lesson_07/homework/names_deepseek.dart' as deepseek;
import 'package:git_lesson/lesson_07/homework/names_gpt.dart' as gpt;

void main() {
  final setDeepseek = deepseek.ukrainianNamesDeepseek.toSet();
  final setGpt = gpt.ukrainianNamesGPT.toSet();

  print(
    '=== В методі main cтворіть новий Set зі спільними іменами обох списків (names_deepseek та names_gpt). Виведіть кількість елементів у цій множині.',
  );
  final union = setDeepseek.intersection(setGpt);
  print('Кількість спільних імен: ${union.length}');
  print(
    '=== Імена, що є в ukrainianNamesGPT, але немає в ukrainianNamesDeepseek:',
  );
  final differenceGpt = setGpt.difference(setDeepseek);
  print(differenceGpt);
  print(
    '=== Імена, що є в ukrainianNamesDeepseek, але немає в ukrainianNamesGPT:',
  );
  final differenceDeepseek = setDeepseek.difference(setGpt);
  print(differenceDeepseek);
}
