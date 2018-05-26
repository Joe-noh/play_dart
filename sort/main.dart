import 'dart:math';

List<int> sort(List<int> list) {
  if (list.length == 0) {
    return [];
  } else {
    final dup = list.toList();

    final pivot = dup.removeAt(0);

    final left  = dup.toList();
    final right = dup.toList();

    left.retainWhere((int e) => e <  pivot);
    right.retainWhere((int e) => e >= pivot);

    return [sort(left), [pivot], sort(right)].expand((pair) => pair).toList();
  }
}

List<int> generateNumbers(int length) {
  final rand = new Random();

  return new List<int>.generate(length, (int index) => rand.nextInt(100));
}

main () {
  final input = generateNumbers(50);
  final sorted = sort(input);

  print(sorted);
}
