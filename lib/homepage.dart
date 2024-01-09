import 'form_data.dart';
import 'model/data.dart';
import 'database/db_helper.dart';
import 'package:flutter/material.dart';
import 'datatable.dart';

class ListDataPage extends StatefulWidget {
  const ListDataPage({Key? key}) : super(key: key);

  @override
  _ListDataPageState createState() => _ListDataPageState();
}

class _ListDataPageState extends State<ListDataPage> {
  List<Data> listData = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Mahasiswa"),
        centerTitle: true,
        primary: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100, // Sesuaikan dengan lebar yang diinginkan
                    height: 100, // Sesuaikan dengan tinggi yang diinginkan
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('assets/icons/foto.jpg'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'M. Gilang M.W. Sabdokafi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text('221240001248'),
              // onTap: () {
              //   // Tambahkan aksi yang diinginkan saat item dipilih
              // },
            ),
            ListTile(
              leading: Icon(Icons.computer),
              title: Text('Teknik Informatika DA'),
              // onTap: () {
              //   // Tambahkan aksi yang diinginkan saat item dipilih
              // },
            ),
            ListTile(
              onTap:_openDataTable,
              leading: Icon(Icons.calendar_view_day_rounded),
              title: Text('Tabel Database'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          Data data = listData[index];
          return Padding(
            padding: const EdgeInsets.only(top: 20,),
            child: GestureDetector(
              onTap: () {
                _openFormEdit(data);
              },
              child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200], // Warna latar belakang avatar jika tidak ada gambar
                child: ClipOval(
                  child: SizedBox(
                    width: 60, // Sesuaikan dengan ukuran diameter lingkaran
                    height: 60,
                    child: data.imageBytes != null
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
                        : Icon(
                            Icons.person,
                            size: 50,
                          ),
                  ),
                ),
              ),
              title: Text('${data.name}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("NIM: ${data.nim}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Phone: ${data.phone}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Text("Alamat: ${data.address}"),
                  )
                ],
              ),
              trailing: FittedBox(
                fit: BoxFit.fill,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteData(data, index);
                      },
                    ),
                  ],
                ),
              ),
            ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerFloat,
      // persistentFooterButtons: <Widget>[
      //   ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       elevation: 10.0,
      //       primary: Colors.green,
      //     ),
      //     child: Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //   ),
      //   ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       elevation: 10.0,
      //       primary: Colors.blueGrey,
      //     ),
      //     child: Icon(
      //       Icons.clear,
      //       color: Colors.white,
      //     ),
      //   ),
      // ],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   fixedColor: Colors.teal,
      //   items: const [
      //     BottomNavigationBarItem(
      //       label: "Home",
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Add",
      //       icon: Icon(Icons.add),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Profile",
      //       icon: Icon(Icons.person),
      //     ),
      //   ],
      //   onTap: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //     if (index == 0) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => ListDataPage()),
      //       );
      //     } else if (index == 1) {
      //       _openFormCreate();
      //     } else if (index == 2) {
      //       Scaffold.of(context).openDrawer();
      //     }
      //   },
      // ),
    );
  }

  Future<void> _getAllData() async {
    var list = await db.getAllDataWithImage();
    setState(() {
      listData.clear();
      list!.forEach((data) {
        listData.add(Data.fromMap(data));
      });
    });
  }

  Future<void> _deleteData(Data data, int position) async {
    await db.deleteDataWithImage(data.id!);
    setState(() {
      listData.removeAt(position);
    });
  }

  Future<void> _openDataTable() async {
    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) => DatabaseReaderPage()));
    if (result == 'save') {
      await _getAllData();
    }
  }

  Future<void> _openFormCreate() async {
    var result =
        await Navigator.push(
          context, MaterialPageRoute(
            builder: (
              context) => FormData(
              )));
    if (result == 'save') {
      await _getAllData();
    }
  }

  Future<void> _openFormEdit(Data data) async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormData(data: data)));
    if (result == 'update') {
      await _getAllData();
    }
  }
}
