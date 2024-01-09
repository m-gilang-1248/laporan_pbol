// void salam() {
//   print('Assalamualikum');
// }

// void main(List<String> args) {
//   salam();
// }

// void salam(String namaAwal, String namaAkhir) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam('Gilang', 'Kafi');
// }

// void salam(String namaAwal, [String? namaAkhir]) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam('Gilang');
//   salam('Gilang', 'Kafi');
// }

// void salam(String namaAwal, [String namaAkhir='']) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam('Gilang');
//   salam('Gilang', 'Kafi');
// }

// void salam({String? namaAwal, String? namaAkhir}) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam(namaAwal: 'Gilang', namaAkhir: 'Kafi');
//   salam(namaAkhir: 'Kafi', namaAwal: 'Gilang');
//   salam();
//   salam(namaAwal: 'Gilang');
//   salam(namaAkhir: 'Kafi');
// }

// void salam({String? namaAwal, String namaAkhir=''}) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam(namaAwal: 'Gilang', namaAkhir: 'Kafi');
//   salam(namaAkhir: 'Kafi', namaAwal: 'Gilang');
//   salam();
//   salam(namaAwal: 'Gilang');
//   salam(namaAkhir: 'Kafi');
// }

//Required Parameter
// void salam({required String namaAwal, String namaAkhir=''}) {
//   print('Assalamualikum $namaAwal $namaAkhir');
// }

// void main(List<String> args) {
//   salam(namaAwal: 'Gilang', namaAkhir: 'Kafi');
//   salam(namaAkhir: 'Kafi', namaAwal: 'Gilang');
//   salam(namaAwal: 'Gilang');
//   salam(namaAwal: 'Gilang');
//   salam(namaAwal: 'Gilang',namaAkhir: 'Kafi');
// }

// dynamic sum(List<int> numbers){
//   var total = 0;
//   for(var value in numbers){
//     total += value;
//   }
//   return 'Total: '+ total.toString();
// }

// void main(List<String> args) {
//   print(sum([100,200,300,400,500]));
// }

String sum(List<int> numbers){
  var total = 0;
  var hasil = 'Total ';
  for(var i = 0; i < numbers.length; i++){
    total += numbers[i];
    hasil += numbers[i].toString();
    if (i < numbers.length - 1) {
      hasil += ' + ';
    }
  }
  hasil += ' = $total';
  return hasil;
}

void main(List<String> args) {
  print(sum([100,200,300,400,500]));
}
