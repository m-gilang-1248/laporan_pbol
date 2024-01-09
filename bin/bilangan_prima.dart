import 'dart:io';

bool cekPrima(int bil) {
  if (bil <= 1) {
    return false;
  }
  for (int i = 2; i <= bil / 2; i++) {
    if (bil % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write('Masukkan angka: ');
  int input = int.parse(stdin.readLineSync()!);

  if (cekPrima(input)) {
    print('$input adalah bilangan prima.');
  } else {
    print('$input bukan bilangan prima.');
  }
}
