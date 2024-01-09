// class Mahasiswa{
//   String nama='Gilang';

//   void view(){
//     print(nama);
//   }
// }

// void main(List<String> args) {
//   Mahasiswa s = new Mahasiswa('Gilang');
// }

// class Mahasiswa{
//   Mahasiswa(String nama){
//     print(nama);
//   }
// }

//Getters dan Setters
// class Mahasiswa{
//   late String nama;
//   late int umur;

//   String get nama_mahasiswa{
//     return nama;
//   }
//   void set nama_mahasiswa(String nama){
//     this.nama = nama;
//   }
//   void set umur_mahasiswa(int umur){
//     if (umur <= 0){
//       print('Umur harus lebih besar dari 5');
//     }else{
//       this.umur = umur;
//     }
//   }
//   int get umur_mahasiswa{
//     return umur;
//   }
// }
// void main(List<String> args) {
//   Mahasiswa s1 = new Mahasiswa();
//   s1.nama_mahasiswa = 'Gilang';
//   s1.umur_mahasiswa = 20;
//   print(s1.nama_mahasiswa);
//   print(s1.umur_mahasiswa);
// }

//Kelas Inheritance
// void main(List<String> args) {
//   var item = new Segitiga();
//   item.luas_item();
// }

// class Object{
//   void luas_item(){
//     print('Menghitung luas segitiga');
//   }
// }

// class Segitiga extends Object{}

//Multilevel inheritance
// void main(List<String> args) {
//   var item = new Pesan();
//   item.str = 'Selamat Belajar';
//   print(item.str);
// }

// class Root{
//   String str = '';
// }

// class Child extends Root{}
// class Pesan extends Child{}

//class inheritance & overriding
// void main(List<String> args) {
//   Mahasiswa s = new Mahasiswa();
//   s.w1(5);
// }

// class Wali{
//   void w1(int x){
//     print('Nilai dari x: ${x}');
//   }
// }

// class Mahasiswa extends Wali{
//   @override
//   void w1(int y){
//     print('Nilai daeri y: ${y}');
//   }
// }

//Static key
// class StaticVal{
//   static int angka = 0;
//   static view(){
//     print('Nilai dari angka adalah ${StaticVal.angka}');
//   }
// }

// void main(List<String> args) {
//   StaticVal.angka=5;
//   //Inisialisasi variabel statis
//   StaticVal.view();
//   //memanggil metode statis
// }

//Super keyword
void main(List<String> args) {
  Mahasiswa s = new Mahasiswa();
  s.w1(5);
}

class Wali{
  String pesan = 'Pesan variabel dari kelas wali';
  void w1(int x){
    print('Nilai dari x: ${x}');
  }
}

class Mahasiswa extends Wali{
  @override
  void w1(int y){
    print('Nilai dari y: ${y}');
    super.w1(7);
    print('${super.pesan}');
  }
}