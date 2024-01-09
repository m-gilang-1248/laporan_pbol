// //Function Short Expression
// int sum(int awal, int akhir) => awal + akhir;

// void main(List<String> args) {
//   print(sum(10, 20));
//   print(sum(30, 20));
// }

//Inner Function
// void main(List<String> args) {
//   void sapa(){
//     print('Ini adalah Inner Function');
//   }

//   sapa();
//   sapa();
// }

// void main(List<String> args) {
//   print('Argument: $args');
// }

// void sayHello(String awal, String Function(String) filter){
//   var filterNama = filter(awal);
//   print('Hi $filterNama');
// }

// String toxic(String nama){
//   if (nama == 'gila'){
//     return '****';
//   }else{
//     return nama;
//   }
// }

// void main(List<String> args) {
//   sayHello('Gilang', toxic);
//   sayHello('gila', toxic);
// }

//Anonymous Function as Variable
// void main(List<String> args) {
//   var upperFunction = (String nama){
//     return nama.toUpperCase();
//   };
//   var lowerFunction=(String nama)=>nama.toLowerCase();

//   print('Uppercase: ${upperFunction('gilang')}');
//   print('Lowercase: ${lowerFunction('GILANG')}');
// }

// void main(List<String> args) {
//   var nama='Gilang';

//   void ucapSalam(){
//     var salam="Assalamualikum $nama";
//     print(salam);
//   }

//   ucapSalam();
//   print(salam); //Undefined name 'salam'.
// }