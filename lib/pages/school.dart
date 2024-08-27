import 'package:flutter/material.dart';
import 'package:school_apn/pages/ekskul.dart';

class SchoolScreen extends StatefulWidget {
  final Map<String, dynamic> schoolData;

  const SchoolScreen({
    Key? key,
    required this.schoolData,
  }) : super(key: key);

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        iconTheme: const IconThemeData(color: Colors.white),
        title: SchoolInfoWidget(
          schoolData: widget.schoolData,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              ResponsiveImageWidget(
                schoolData: widget.schoolData,
              ),
              const SizedBox(height: 20),
              SectionWidget(schoolData: widget.schoolData),
              InformationCardWidget('Guru Bersetifikat',
                  widget.schoolData['guru'].toString() ?? '0'),
              InformationCardWidget('Murid Laki-laki',
                  widget.schoolData['siswaLaki'].toString() ?? '0'),
              InformationCardWidget('Murid Perempuan',
                  widget.schoolData['siswaPerempuan'].toString() ?? '0'),
              InformationCardWidget('Rombongan Belajar',
                  widget.schoolData['rombonganBelajar'].toString() ?? '0'),
              const ResponsiveButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolInfoWidget extends StatelessWidget {
  final Map<String, dynamic> schoolData;

  const SchoolInfoWidget({Key? key, required this.schoolData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                schoolData['nama'].toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                schoolData['alamat'].toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(255, 189, 189, 189),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ResponsiveImageWidget extends StatelessWidget {
  final Map<String, dynamic> schoolData;

  const ResponsiveImageWidget({Key? key, required this.schoolData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    String imagePath;
    if (schoolData['nama'] == 'SD NEGERI BAROS MANDIRI 3') {
      imagePath = 'assets/images/sklh baros.png';
    } else if (schoolData['nama'] == 'SD PADASUKA MANDIRI 3') {
      imagePath = 'assets/images/sklh padasuka.png';
    } else if (schoolData['nama'] == 'SD NEGERI CIMAHI MANDIRI 1') {
      imagePath = 'assets/images/sklh cimahi 1.png';
    } else if (schoolData['nama'] == 'SD NEGERI CIMINDI 4') {
      imagePath = 'assets/images/sklh cimindi 4.png';
    } else if (schoolData['nama'] == 'SD NEGERI CIMAHI MANDIRI 5') {
      imagePath = 'assets/images/sklh mandiri 5.png';
    } else {
      imagePath = 'assets/images/sekolah 1.png';
    }

    return Container(
      width: screenWidth * 0.9,
      height: (screenWidth * 0.9) * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: const Color.fromARGB(255, 68, 68, 68)),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final Map<String, dynamic> schoolData;

  const SectionWidget({Key? key, required this.schoolData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 68, 68, 68),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.school, size: 24.0, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text(
                            'Kurikulum',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        schoolData['kurikulum'].toString(),
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 68, 68, 68),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.watch_later_outlined,
                              size: 24.0, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text(
                            'Jam Masuk',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Text(
                        schoolData['penyelenggaraan'].toString(),
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 68, 68, 68),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Akreditasi',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  schoolData['akreditasi'].toString(),
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget InformationCardWidget(String kategori, String jumlah) {
  return Card(
    elevation: 4.0,
    color: const Color.fromARGB(255, 68, 68, 68),
    margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 24.0, color: Colors.white),
              const SizedBox(width: 8.0),
              Text(
                kategori,
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          Center(
            child: Text(
              jumlah,
              style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

class ResponsiveButtonWidget extends StatelessWidget {
  const ResponsiveButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ExtracurricularScreen()),
          );
        },
        child: const Center(
          child: Text(
            'Selanjutnya',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
