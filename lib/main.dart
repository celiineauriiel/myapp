import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: AboutPage(), debugShowCheckedModeBanner: false));
}

class CustomColors {
  static const Color primaryColor = Color.fromARGB(255, 183, 14, 14);
  static const Color secondaryColor = Color.fromARGB(255, 253, 240, 246);
  static const Color primaryText = Color(0xFF000000);
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.secondaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.purple], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 80, backgroundImage: AssetImage('img/foto.jpeg')),
              const SizedBox(height: 20),
              const Text('Welcome', style: TextStyle(color: CustomColors.secondaryColor, fontSize: 40, fontWeight: FontWeight.bold)),
              const Text('To Celine Profile', style: TextStyle(color: CustomColors.secondaryColor, fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              const Text('Click on "Explore" To Explore About Me', style: TextStyle(color: CustomColors.secondaryColor, fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage())),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24), backgroundColor: CustomColors.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text('Explore!', style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('About Me', style: TextStyle(color: CustomColors.secondaryColor, fontSize: 26)),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded, color: Colors.white), onPressed: () => Navigator.pop(context)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 238, 170, 149), Color.fromARGB(255, 193, 168, 238)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.orange, Colors.purple], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            const SizedBox(height: 40), // Tambahkan jarak di atas foto profil
            CircleAvatar(radius: 80, backgroundImage: AssetImage('img/foto2.jpeg')),
            const SizedBox(height: 20),
            const Text('I\'m Celine Auriel', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            const Text('Information System | ITS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white)),
            const SizedBox(height: 20),
            // Membuat bagian card saja yang bisa digulir
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoCard(icon: Icons.mail, label: 'Email', value: '5026221004@student.its.ac.id'),
                    InfoCard(icon: Icons.location_pin, label: 'NRP', value: '5026221004'),
                    FunFactsCard(funFacts: [
                      'Tidak suka Nasi Goreng', 'Pernah mengunjungi 5 negara', 'Memiliki koleksi lebih dari 100 buku', 'Suka bermain game komputer',
                      'Mengerti sedikit bahasa isyarat', 'Menyukai masakan Italia', 'Punya hobi bersepeda', 'Tertarik dengan teknologi AI',
                      'Pernah ikut lomba cybersecurity tingkat nasional', 'Hobi mendengarkan musik klasik'
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({Key? key, required this.icon, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 5)]),
        child: Row(
          children: [
            Icon(icon, color: CustomColors.primaryColor, size: 28),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(label, style: const TextStyle(fontSize: 14, color: Color.fromARGB(137, 255, 255, 255))),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            ]),
          ],
        ),
      ),
    );
  }
}

class FunFactsCard extends StatelessWidget {
  final List<String> funFacts;

  const FunFactsCard({Key? key, required this.funFacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 5)]),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.star, color: Color.fromARGB(255, 163, 41, 41), size: 28),
                SizedBox(width: 16),
                Text('Fun Facts', style: TextStyle(fontSize: 14, color: Color.fromARGB(137, 255, 255, 255))),
              ],
            ),
            const SizedBox(height: 12),
            ...funFacts.map((fact) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 4)]),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(fact, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white), overflow: TextOverflow.ellipsis),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}