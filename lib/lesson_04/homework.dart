// ignore_for_file: omit_local_variable_types, prefer_final_locals, noop_primitive_operations, lines_longer_than_80_chars

void main() {
  primitives();
  collections();
  varFinalConst();
  record();
  nullable();
}

/// Створи змінні та виведи їх:

/// Завдання 1: Примітивні типи
/// - age (int) — твій вік
/// - height (double) — твій зріст у метрах
/// - name (String) — твоє ім'я
/// - isStudent (bool) — чи ти студент
void primitives() {
  int age = 44;
  double height = 183;
  String name = 'Борис';
  bool isStudent = true;
}

/// Завдання 2: Колекції
/// 1. List — 3 твої улюблені кольори
/// 2. Set — 3 унікальні оцінки, спробуй створити перевір print-ми, що вони не виводяться
/// 3. Map — 3 предмети та їх оцінки
void collections() {}

/// Завдання 3: var, final, const
/// 1. Створи змінну через var — наприклад, місто проживання та зміни її декілька разів (print після кожної зміни)
/// 2. Створи змінну через final — наприклад, країна
/// 3. Створи змінну через const — наприклад, кількість днів у тижні
void varFinalConst() {}

/// Завдання 4: Record
/// Створи іменований та не іменований (позиційний) record з твоїм ім'ям та віком і виведи обидва поля.
void record() {}

/// Завдання 5: Nullable (опціонально)
/// Створи змінну String? nickname — може бути null або ім'я.
/// Виведи її через ??: якщо null — виведи "Немає", інакше — значення.
void nullable() {}
