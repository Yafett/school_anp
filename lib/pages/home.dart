import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_apn/pages/profile.dart';

import 'compare.dart';
import 'school.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Daftar Sekolah',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                          },
                          child:
                              Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toUpperCase();
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff434343),
                    hintText: 'Search by school name',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('school')
                      .where('nama', isGreaterThanOrEqualTo: searchQuery)
                      .where('nama',
                          isLessThanOrEqualTo: searchQuery + '\uf8ff')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No data available'));
                    }

                    List<Widget> cards = snapshot.data!.docs.map((doc) {
                      Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      String imagePath;

                      // Map the school name to an image path
                      switch (data['nama']) {
                        case 'SD NEGERI BAROS MANDIRI 3':
                          imagePath = 'assets/images/sklh baros.png';
                          break;
                        case 'SD PADASUKA MANDIRI 3':
                          imagePath = 'assets/images/sklh padasuka.png';
                          break;
                        case 'SD NEGERI CIMAHI MANDIRI 1':
                          imagePath = 'assets/images/sklh cimahi 1.png';
                          break;
                        case 'SD NEGERI CIMINDI 4':
                          imagePath = 'assets/images/sklh cimindi 4.png';
                          break;
                        case 'SD NEGERI CIMAHI MANDIRI 5':
                          imagePath = 'assets/images/sklh mandiri 5.png';
                          break;
                        default:
                          imagePath = 'assets/images/sekolah 1.png';
                      }

                      return ImageCard(
                        title: data['nama'],
                        location: data['alamat'],
                        imageUrl: imagePath,
                        data: data,
                      );
                    }).toList();

                    return Column(
                      children: cards,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final Map<String, dynamic> data;

  const ImageCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff434343),
      elevation: 4.0, // Adds a shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: const Color.fromARGB(255, 68, 68, 68), // Border color
          width: 2.0, // Border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Shrinks to fit content
        children: <Widget>[
          // Image on top with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity, // Makes the image fit the card width
            ),
          ),
          // Text below the image
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0, // Font size for the text
                    fontWeight: FontWeight.bold, // Font weight for the text
                  ),
                  textAlign: TextAlign.center, // Centers the text
                ),
                SizedBox(height: 8),
                Text(
                  location,

                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 189, 189, 189),
                  ),
                  textAlign: TextAlign.start, // Centers the text
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          ButtonBar(
            alignment: MainAxisAlignment.end, // Center the buttons horizontally
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                  ),
                  backgroundColor: Color(0xFF9370DB), // Background color
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SchoolScreen(
                              schoolData: data,
                            )),
                  );
                },
                child: Text(
                  'Lihat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  showPickerModal(context);
                },
                child: Text(
                  'Bandingkan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showPickerModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return PickerModal();
    },
  );
}

class PickerModal extends StatefulWidget {
  @override
  _PickerModalState createState() => _PickerModalState();
}

class _PickerModalState extends State<PickerModal> {
  String? selectedItem1;
  String? selectedItem2;

  // This list should be dynamically populated from your Firestore data
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _fetchSchoolNames();
  }

  Future<void> _fetchSchoolNames() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection('school').get();
      List<String> schoolNames =
          querySnapshot.docs.map((doc) => doc['nama'] as String).toList();
      setState(() {
        items = schoolNames;
      });
    } catch (e) {
      // Handle error
      print('Error fetching school names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pilih Sekolah',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Sekolah 1'),
            value: selectedItem1,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem1 = value;
              });
            },
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Sekolah 2'),
            value: selectedItem2,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem2 = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String guru1 = '';
              String siswaLaki1 = '';
              String siswaPerempuan1 = '';
              String kelas1 = '';
              String lab1 = '';
              String akreditasi1 = '';

              String nama2 = '';
              String guru2 = '';
              String siswaLaki2 = '';
              String siswaPerempuan2 = '';
              String kelas2 = '';
              String lab2 = '';
              String akreditasi2 = '';

              if (selectedItem1 != null && selectedItem2 != null) {
                setState(() {
                  if (selectedItem1 == 'SD NEGERI BAROS MANDIRI 3') {
                    guru1 = '7';
                    siswaLaki1 = '142';
                    siswaPerempuan1 = '163';
                    kelas1 = '29';
                    lab1 = '1';
                    akreditasi1 = 'B';
                  } else if (selectedItem1 == 'SD NEGERI CIMAHI MANDIRI 1') {
                    guru1 = '11';
                    siswaLaki1 = '520';
                    siswaPerempuan1 = '441';
                    kelas1 = '26';
                    lab1 = '0';
                    akreditasi1 = 'A';
                  } else if (selectedItem1 == 'SD NEGERI CIMAHI MANDIRI 5') {
                    guru1 = '16';
                    siswaLaki1 = '327';
                    siswaPerempuan1 = '288';
                    kelas1 = '22';
                    lab1 = '0';
                    akreditasi1 = 'A';
                  } else if (selectedItem1 == 'SD NEGERI CIMINDI 4') {
                    guru1 = '0';
                    siswaLaki1 = '76';
                    siswaPerempuan1 = '65';
                    kelas1 = '3';
                    lab1 = '0';
                    akreditasi1 = 'B';
                  } else if (selectedItem1 == 'SD PADASUKA MANDIRI 3') {
                    guru1 = '5';
                    siswaLaki1 = '256';
                    siswaPerempuan1 = '249';
                    kelas1 = '12';
                    lab1 = '0';
                    akreditasi1 = 'A';
                  }

                  if (selectedItem2 == 'SD NEGERI BAROS MANDIRI 3') {
                    guru2 = '7';
                    siswaLaki2 = '142';
                    siswaPerempuan2 = '163';
                    kelas2 = '29';
                    lab2 = '1';
                    akreditasi2 = 'B';
                  } else if (selectedItem2 == 'SD NEGERI CIMAHI MANDIRI 1') {
                    guru2 = '11';
                    siswaLaki2 = '520';
                    siswaPerempuan2 = '441';
                    kelas2 = '26';
                    lab2 = '0';
                    akreditasi2 = 'A';
                  } else if (selectedItem2 == 'SD NEGERI CIMAHI MANDIRI 5') {
                    guru2 = '16';
                    siswaLaki2 = '327';
                    siswaPerempuan2 = '288';
                    kelas2 = '22';
                    lab2 = '0';
                    akreditasi2 = 'A';
                  } else if (selectedItem2 == 'SD NEGERI CIMINDI 4') {
                    guru2 = '0';
                    siswaLaki2 = '76';
                    siswaPerempuan2 = '65';
                    kelas2 = '3';
                    lab2 = '0';
                    akreditasi2 = 'B';
                  } else if (selectedItem2 == 'SD PADASUKA MANDIRI 3') {
                    guru2 = '5';
                    siswaLaki2 = '256';
                    siswaPerempuan2 = '249';
                    kelas2 = '12';
                    lab2 = '0';
                    akreditasi2 = 'A';
                  }
                });

                print('asdad ' + guru2.toString());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompareScreen(
                      anama1: selectedItem1.toString(),
                      aguru1: guru1,
                      asiswaLaki1: siswaLaki1,
                      asiswaPerempuan1: siswaPerempuan1,
                      akelas1: kelas1,
                      alab1: lab1,
                      aakreditasi1: akreditasi1,
                      anama2: selectedItem2.toString(),
                      aguru2: guru2,
                      asiswaLaki2: siswaLaki2,
                      asiswaPerempuan2: siswaPerempuan2,
                      akelas2: kelas2,
                      alab2: lab2,
                      aakreditasi2: akreditasi2,
                    ),
                  ),
                );
              } else {
                // Optionally, show a message if items are not selected
              }
            },
            child: Text('Bandingkan'),
          ),
        ],
      ),
    );
  }
}
