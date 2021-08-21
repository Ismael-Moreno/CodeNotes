void main() {
  List<int> numeros = [1, 2, 3, 4, 5];
  print(numeros);

  numeros.add(6);
  print(numeros);

  // Tamaño fijo
  List masNumeros = List.filled(10, null);
  print(masNumeros);
//   masNumeros.add(1); Esto no es correcto
  masNumeros[0] = 1;
  print(masNumeros);
}
