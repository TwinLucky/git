import 'package:mocky/mocky.dart';

void main() {
  Mocky.setLocale(Locale.uk);

  print(
    '''=== Створіть список randomNouns з 100 різними словами  (як це зробити, подивіться в документації  до пакету):''',
  );
  final randomNouns = Mocky.names(100);
  print(randomNouns);

  print('=== Мапа імен та їх довжин:');
  final nounsMap = {for (final noun in randomNouns) noun: noun.length};
  print(nounsMap);

  print(
    '''=== Створіть нову змінну Map<String, int> nounsMapFiltered. Додайте у nounsMapFiltered лише ті пари зі nounsMap, де довжина слова — парне число.''',
  );
  final nounsMapFiltered = {
    for (final entry in nounsMap.entries)
      if (entry.value.isEven) entry.key: entry.value,
  };

  print('Ключі з парною довжиною: ${nounsMapFiltered.keys.join(', ')}');
}
