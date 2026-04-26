void main() async {
  print('----------------Початок програми----------------\n');

  final result = await fetchData();
  print(result);

  print('\n----------------Кінець програми----------------\n');
}

// Що таке async
// Якщо ти зробив функцію асинхронною, вона має повертати Future
// Що таке Future.delayed і вхідні параметри.
// Що таке then - і що воно є у всіх Future.
// Про await.
// Коли на практиці використовують then, а коли await.

// Приклад асинхронної функції - отримання даних з сервера
Future<String> fetchData() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  return 'Data from server';
}
