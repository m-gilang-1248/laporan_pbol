// import 'dart:async';

// void main() {
//  Future.delayed(Duration.zero, () {
//     print("Aku Bangga Menjadi ");
//  });

//  Future.delayed(Duration(seconds: 2), () {
//     print("UNISNU");
//  });

//  Future.delayed(Duration(seconds: 3), () {
//     print("Jepara");
//  });

//  Future.delayed(Duration(seconds: 1), () {
//     print("Mahasiswa");
//  });
// }

// void main(List<String> args) {
//   fetchUserOrder();
//   print('Ambil Datanya');
// }

// Future<void> fetchUserOrder(){
//   return Future.delayed(
//     Duration(seconds: 2), () => print('Selamat datang di UNISNU')
//   );
// }

//Syncronous
// void main(List<String> args) {
//   print('Muhammad');
//   print('Gilang');
//   print('Manggala');
//   print('Wijayawan');
//   print('Sabdokafi');
// }

//Asynchronus
// void main(List<String> args) {
//   var data=Mahasiswa();

//   print('Halo');
//   print('Selamat datang');
//   print('Tuan ${data.nama}');
//   print('Apa Kabar');
// }
// class Mahasiswa{
//   var nama='tanpa nama';
//   Future<void> dataMahasiswa() async{
//     await Future.delayed(Duration(seconds: 4));
//     nama='Gilang';
//   }
// }

void main(List<String> args) {
  var data=Mahasiswa();

  print('Halo');
  print('Selamat datang');
  data.dataMahasiswa().then((_){
    print('Tuan ${data.nama}');
  });
  print('Apa Kabar');
}
class Mahasiswa{
  var nama='tanpa nama';
  Future<void> dataMahasiswa() async{
    await Future.delayed(Duration(seconds: 4));
    nama='Gilang';
  }
}