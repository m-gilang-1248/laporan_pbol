// void main(List<String> args) {
//   for (;;){
//     print('Perulangan tanpa henti');
//   }
// }

// void main(List<String> args) {
//   var counter=1;

//   for(;counter <= 10;){
//     print('Perulangan ke-$counter');
//     counter++;
//   }
// }

// void main(List<String> args) {
//   for (var counter=1; counter <= 10;){
//     print('Perulangan ke-$counter');
//     counter++;
//   }
// }

// void main(List<String> args) {
//   for (var counter=1;counter <= 10;counter++){
//     print('Perulangan ke-$counter');
//   }
// }

// void main(List<String> args) {
//   var counter=1;

//   while (counter<=10){
//     print('Perulangan ke-$counter');
//     counter++;
//   }
// }

// void main(List<String> args) {
//   var counter=100;

//   do{
//     print('Perulangan ke-$counter');
//     counter++;
//   }while(counter<=10);
// }

// void main(List<String> args) {
//   var counter=1;

//   while(true){
//     print('Perulangan ke-$counter');
//     counter++;

//     if(counter>10){
//     break;
//     }
//   }
// }

// void main(List<String> args) {
//   for(var counter=1;counter<=100;counter++){
//     if(counter %2 == 1){
//       continue;
//     }
//     print('Perulangan genap-$counter');
//   }
// }

// void main(List<String> args) {
//   var array=<String>['Muhammad','Gilang','Manggala'];

//   for(var i=0;i<array.length;i ++){
//     print(array[i]);
//   }
// }

void main(List<String> args) {
  var array=<String>['Muhammad', 'Gilang','Manggala'];

  for (var value in array){
    print(value);
  }
}