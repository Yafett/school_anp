import 'package:flutter/material.dart';

class CompareScreen extends StatefulWidget {
  final String anama1;
  final String aguru1;
  final String asiswaLaki1;
  final String asiswaPerempuan1;
  final String akelas1;
  final String alab1;
  final String aakreditasi1;

  final String anama2;
  final String aguru2;
  final String asiswaLaki2;
  final String asiswaPerempuan2;
  final String akelas2;
  final String alab2;
  final String aakreditasi2;

  CompareScreen({
    required this.anama1,
    required this.aguru1,
    required this.asiswaLaki1,
    required this.asiswaPerempuan1,
    required this.akelas1,
    required this.alab1,
    required this.aakreditasi1,
    required this.anama2,
    required this.aguru2,
    required this.asiswaLaki2,
    required this.asiswaPerempuan2,
    required this.akelas2,
    required this.alab2,
    required this.aakreditasi2,
  });

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  @override
  Widget build(BuildContext context) {
    String imagePath1;
    String imagePath2;
    print('guru ' + widget.aguru1);

    if (widget.anama1.toString() == 'SD NEGERI BAROS MANDIRI 3') {
      imagePath1 = 'assets/images/sklh baros.png';
    } else if (widget.anama1.toString() == 'SD PADASUKA MANDIRI 3') {
      imagePath1 = 'assets/images/sklh padasuka.png';
    } else if (widget.anama1.toString() == 'SD NEGERI CIMAHI MANDIRI 1') {
      imagePath1 = 'assets/images/sklh cimahi 1.png';
    } else if (widget.anama1.toString() == 'SD NEGERI CIMINDI 4') {
      imagePath1 = 'assets/images/sklh cimindi 4.png';
    } else if (widget.anama1.toString() == 'SD NEGERI CIMAHI MANDIRI 5') {
      imagePath1 = 'assets/images/sklh mandiri 5.png';
    } else {
      imagePath1 = 'assets/images/sekolah 1.png';
    }

    if (widget.anama2.toString() == 'SD NEGERI BAROS MANDIRI 3') {
      imagePath2 = 'assets/images/sklh baros.png';
    } else if (widget.anama2.toString() == 'SD PADASUKA MANDIRI 3') {
      imagePath2 = 'assets/images/sklh padasuka.png';
    } else if (widget.anama2.toString() == 'SD NEGERI CIMAHI MANDIRI 1') {
      imagePath2 = 'assets/images/sklh cimahi 1.png';
    } else if (widget.anama2.toString() == 'SD NEGERI CIMINDI 4') {
      imagePath2 = 'assets/images/sklh cimindi 4.png';
    } else if (widget.anama2.toString() == 'SD NEGERI CIMAHI MANDIRI 5') {
      imagePath2 = 'assets/images/sklh mandiri 5.png';
    } else {
      imagePath2 = 'assets/images/sekolah 1.png';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Perbandingan Data',
          style: TextStyle(
            fontSize: 30, // Font size for the title
            fontWeight: FontWeight.bold, // Bold text for the title
            color: const Color.fromARGB(255, 255, 255, 255), // Text color
          ),
        ),
      ),
      backgroundColor: Color(0xff252525),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Map the school name to an image path

                ResponsiveImageRow(
                  imagePath1: imagePath1,
                  imagePath2: imagePath2,
                  nama1: widget.anama1,
                  nama2: widget.anama2,
                ),
                SizedBox(height: 30),
                // ComparisonWidget(
                //   title: 'Pilihan Terbaik',
                //   description:
                //       'Dari perbandingan yang dilakukan SDN PAMU lebih baik',
                //   reasons: [
                //     'Alasan 1',
                //     'Alasan 2',
                //     'Alasan 3',
                //   ],
                // ),
                // SizedBox(height: 30),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Perbandingan',
                //       style: TextStyle(fontSize: 26.0, color: Colors.white),
                //     ),
                //     SizedBox(width: 8.0), // Space between text and icon
                //     // Icon(Icons.thumb_up_sharp, size: 30.0, color: Colors.white),
                //   ],
                // ),
                SizedBox(height: 15),
                KualitasAkademi(
                  guru1: widget.aguru1,
                  guru2: widget.aguru2,
                  akreditasi1: widget.aakreditasi1,
                  akreditasi2: widget.aakreditasi2,
                ),
                SizedBox(height: 15),
                FasilitasSekolah(
                  kelas1: widget.akelas1,
                  kelas2: widget.akelas2,
                  lab1: widget.alab1,
                  lab2: widget.alab2,
                ),
                SizedBox(height: 15),
                BiayaSekolah(),
                SizedBox(height: 15),
                LokasiSekolah(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveImageRow extends StatelessWidget {
  final String nama1;
  final String nama2;
  final String imagePath1;
  final String imagePath2;

  ResponsiveImageRow({
    required this.imagePath1,
    required this.imagePath2,
    required this.nama1,
    required this.nama2,
  });

  @override
  Widget build(BuildContext context) {
    print(imagePath1 + imagePath2);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1, // Ensures the image is square
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Image.asset(
                      imagePath1, // Path to the first image
                      fit: BoxFit.cover, // Image fits the container
                    ),
                  ),
                ),
                SizedBox(height: 8.0), // Space between image and text
                Text(
                  nama1.toString(), // Replace with your desired text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0), // Space between the two images
          // Second Image with Text
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1, // Ensures the image is square
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Image.asset(
                      imagePath2, // Path to the second image
                      fit: BoxFit.cover, // Image fits the container
                    ),
                  ),
                ),
                SizedBox(height: 8.0), // Space between image and text
                Text(
                  nama2.toString(), // Replace with your desired text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComparisonWidget extends StatelessWidget {
  final String title; // Title text
  final String description; // Description text
  final List<String> reasons; // List of reasons

  ComparisonWidget({
    required this.title,
    required this.description,
    required this.reasons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title with thumbs-up icon
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 26.0, color: Colors.white),
            ),
            SizedBox(width: 8.0), // Space between text and icon
            // Icon(Icons.thumb_up_sharp, size: 30.0, color: Colors.white),
          ],
        ),
        SizedBox(height: 8.0), // Space between title and description
        // Description text
        Text(
          description,
          style: TextStyle(
            fontSize: 14.0,
            color: const Color.fromARGB(255, 170, 170, 170),
          ),
        ),
        SizedBox(height: 10.0), // Space between description and reasons
        // List of reasons with checklist icon
        ...reasons.map((reason) => ChecklistItem(text: reason)).toList(),
      ],
    );
  }
}

class KualitasAkademi extends StatelessWidget {
  String guru1 = '0';
  String guru2 = '0';
  String akreditasi1 = 'B';
  String akreditasi2 = 'B';

  KualitasAkademi({
    required this.guru1,
    required this.guru2,
    required this.akreditasi1,
    required this.akreditasi2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff434343),
        border: Border.all(color: Color(0xff727272), width: 1.0),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildSectionTitle('Kualitas Kurikulum'),
          _buildTable(guru1, guru2),
          _buildSectionTitle('Akreditas'),
          _buildTable(akreditasi1, akreditasi2),
          _buildSectionTitle('Kualitas Guru'),
          _buildTable(guru1, guru2),
          _buildSectionTitle('Kinerja Siswa'),
          _buildTable('-', '-'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Color(0xff434343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Kualitas Akademi',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff727272),
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTable(valA, valB) {
    print('val : ' + valA);
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        top: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        left: BorderSide.none,
        right: BorderSide.none,
      ),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valA.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valB.toString(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FasilitasSekolah extends StatelessWidget {
  String kelas1 = '0';
  String kelas2 = '0';
  String lab1 = '0';
  String lab2 = '0';

  FasilitasSekolah({
    required this.kelas1,
    required this.kelas2,
    required this.lab1,
    required this.lab2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff434343),
        border: Border.all(color: Color(0xff727272), width: 1.0),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildSectionTitle('Ruang Kelas'),
          _buildTable(kelas1, kelas2),
          _buildSectionTitle('Laboratorium'),
          _buildTable(lab1, lab2),
          _buildSectionTitle('Fasilitas Playground'),
          _buildTable('-', '-'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Color(0xff434343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Fasilitas Akademi',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff727272),
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTable(valA, valB) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        top: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        left: BorderSide.none,
        right: BorderSide.none,
      ),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valA, style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valB, style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BiayaSekolah extends StatelessWidget {
  const BiayaSekolah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff434343),
        border: Border.all(color: Color(0xff727272), width: 1.0),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildSectionTitle('Biaya Sekolah'),
          _buildTable('-', '-'),
          _buildSectionTitle('Biaya Tambahan'),
          _buildTable('-', '-'),
          _buildSectionTitle('Beasiswa'),
          _buildTable('-', '-'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Color(0xff434343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Biaya',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff727272),
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTable(valA, valB) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        top: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        left: BorderSide.none,
        right: BorderSide.none,
      ),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valA, style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(valB, style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LokasiSekolah extends StatelessWidget {
  const LokasiSekolah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff434343),
        border: Border.all(color: Color(0xff727272), width: 1.0),
        // borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _buildHeader(),
          _buildSectionTitle('Jarak ke Sekolah'),
          _buildTable('', ''),
          _buildSectionTitle('Keamanan Lingkungan'),
          _buildTable('', ''),
          _buildSectionTitle('Akses Transportasi'),
          _buildTable('', ''),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Color(0xff434343),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lokasi',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff727272),
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTable(valA, valB) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        verticalInside: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        top: BorderSide(
          color: Color(0xff727272),
          width: 1.0,
        ),
        left: BorderSide.none,
        right: BorderSide.none,
      ),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Checklist item widget
class ChecklistItem extends StatelessWidget {
  final String text; // Text to display beside the checklist icon

  ChecklistItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0), // Space between items
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 24.0,
          ),
          SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
