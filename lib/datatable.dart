import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database/db_helper.dart'; // Sesuaikan dengan lokasi DbHelper.dart
import 'model/data.dart'; // Sesuaikan dengan lokasi Data.dart

class DatabaseReaderPage extends StatefulWidget {
  @override
  _DatabaseReaderPageState createState() => _DatabaseReaderPageState();
}

class _DatabaseReaderPageState extends State<DatabaseReaderPage> {
  DbHelper dbHelper = DbHelper(); // Membuat instance DbHelper

  List<Data> dataList = []; // List untuk menampung data dari database

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase(); // Memanggil fungsi untuk mengambil data dari database saat widget pertama kali dibuat
  }

  Future<void> fetchDataFromDatabase() async {
    List? fetchedList = await dbHelper.getAllDataWithImage(); // Mengambil data dari database
    if (fetchedList != null) {
      setState(() {
        dataList = fetchedList.map((item) => Data.fromMap(item)).toList(); // Mengubah hasil yang diperoleh menjadi list Data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabel Database'),
      ),
      body: dataList.isEmpty
          ? Center(
              child: Text('No data available'),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('NIM')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Address')),
                  DataColumn(label: Text('Image')),
                ],
                rows: dataList.map((data) {
                  return DataRow(cells: [
                    DataCell(Text(data.id.toString())),
                    DataCell(Text(data.name ?? '')),
                    DataCell(Text(data.nim ?? '')),
                    DataCell(Text(data.phone ?? '')),
                    DataCell(Text(data.address ?? '')),
                    DataCell(
                      data.imageBytes != null
                          ? Image.memory(
                          data.imageBytes!,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            print('Error loading image: $exception');
                            return Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 30,
                            );
                          },
                        )
                          : Text('No Image'),
                    ),
                  ]);
                }).toList(),
              ),
            ),
    );
  }
}