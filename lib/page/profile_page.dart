import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String username = "user1";
  final String userImage = "assets/user1.jpg";
  final int postsCount = 3;
  final int followersCount = 1000;
  final int followingCount = 180;
  final List<String> postImages = [
    "assets/post1.jpg",
    "assets/post2.jpg",
    "assets/post3.jpg",
    // Tambahkan gambar lain sesuai kebutuhan
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Atas - Info Profil
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Foto Profil
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(userImage),
                  ),
                  // Statistik (Post, Followers, Following)
                  Column(
                    children: [
                      Text(
                        '$postsCount',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Posts'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$followersCount',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Followers'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$followingCount',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('Following'),
                    ],
                  ),
                ],
              ),
            ),
            // Nama dan Bio Pengguna
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'SAYA ADALAH BOXER Terkuat DI KOTA SEMARANG',
                  ),
                ],
              ),
            ),
            // Tombol Edit Profil
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 36),
                  side: BorderSide(color: Colors.grey),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // Tab untuk Grid atau List View
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.grid_on, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person_pin_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            Divider(),
            // Grid Foto-foto Unggahan
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: postImages.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    postImages[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
