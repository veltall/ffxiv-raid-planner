void main() {
  List<int> a = <int>[];
  a.add(1);
  a.add(2);
  a.add(3);
  a.add(4);
  a.add(5);
  int end = a.length > 10 ? 10 : a.length;
  print("a = $a");
  List<int> b = a.sublist(0, end);
  print("b = $b");
  List<int> c = a.sublist(0, end);
  print("c = $c");
  print("a[4] = ${a[4]}");
  var d = a.sublist(0,0);
  print('a.sublist(0,0) = $d');
}