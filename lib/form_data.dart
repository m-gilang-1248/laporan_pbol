import 'model/data.dart';
import 'dart:typed_data';
import 'database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormData extends StatefulWidget {
  final Data? data;

  FormData({this.data});

  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  DbHelper dbHelper = DbHelper();
  final _formKey = GlobalKey<FormState>();

  TextEditingController? nameController;
  TextEditingController? nimController;
  TextEditingController? phoneController;
  TextEditingController? addressController;

  Uint8List? _imageBytes;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.data?.name ?? '');
    nimController = TextEditingController(text: widget.data?.nim ?? '');
    phoneController = TextEditingController(text: widget.data?.phone ?? '');
    addressController = TextEditingController(text: widget.data?.address ?? '');
    if (widget.data?.imageBytes != null) {
      setState(() {
        _imageBytes = widget.data!.imageBytes;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengisian Data Mahasiswa'),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: _getImageFromGallery,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 50,
                child: _imageBytes != null
                    ? ClipOval(
                        child: SizedBox(
                          width: 100, // Sesuaikan dengan ukuran diameter lingkaran
                          height: 100,
                            child: Image.memory(
                              _imageBytes!,
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                print('Error loading image: $exception');
                                return Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                  size: 60,
                                );
                              },
                            ),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blue,
                      ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: nameController,
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: nimController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'NIM',
                      hintText: 'Masukkan Nomor Induk Mahasiswa',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Masukkan nomor Handphone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      hintText: 'Masukkan alamat anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _saveDataToDatabase();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form tidak valid. Periksa kembali isian Anda.')),
                );
              }
            },
            child: widget.data == null
                ? Text('Save', style: TextStyle(color: Colors.white))
                : Text('Update', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }


  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  Future<void> _saveDataToDatabase() async {
    try {
      // Membuat objek Data dari nilai-nilai yang dimasukkan dalam form
      Data newData = Data(
        name: nameController!.text,
        nim: nimController!.text,
        phone: phoneController!.text,
        address: addressController!.text,
        imageBytes: _imageBytes ?? Uint8List(0),
      );

      if (widget.data == null) {
        await dbHelper.saveDataWithImage(newData);
        Navigator.pop(context, 'save');
      } else {
        newData.id = widget.data!.id;
        await dbHelper.updateDataWithImage(newData);
        Navigator.pop(context, 'update');
      }
    } catch (e) {
      _showErrorDialog("Error saving data", e.toString());
      print("Error saving data to database: $e");
      // Tambahkan penanganan kesalahan sesuai kebutuhan aplikasi Anda
      // Contoh: menampilkan pesan kesalahan kepada pengguna, logging, dsb.
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Baik'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nameController?.dispose();
    nimController?.dispose();
    phoneController?.dispose();
    addressController?.dispose();
    super.dispose();
  }
}
