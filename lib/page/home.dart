import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar widget untuk setiap tab
  static List<Widget> _widgetOptions = <Widget>[
    FeedTab(),
    SearchTab(),
    ReelsTab(),
    ActivityTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagrid'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        titleTextStyle: GoogleFonts.lobster(),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Tab Feed dengan header Stories
class FeedTab extends StatelessWidget {
  // Mock data untuk postingan dan stories
  final List<Post> posts = [
    Post(
      username: 'Randy',
      userImage: 'assets/user1.jpeg',
      postImage: 'assets/fturu.jpeg',
      caption: ':v',
    ),
    Post(
      username: 'Hanun',
      userImage: 'assets/user2.jpeg',
      postImage: 'assets/eturu.jpeg',
      caption: ':*',
    ),
    Post(
      username: 'Hanun',
      userImage: 'assets/user2.jpeg',
      postImage: 'assets/user2.jpeg',
      caption: ':*',
    ),
    // Tambahkan postingan lainnya
  ];

  final List<Story> stories = [
    Story(username: 'user1', userImage: 'assets/user1.jpeg'),
    Story(username: 'user2', userImage: 'assets/user2.jpeg'),
    // Tambahkan stories lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Stories Header
        Container(
          height: 100,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              return StoryWidget(story: stories[index]);
            },
          ),
        ),
        // Feed Postingan
        ...posts.map((post) => PostWidget(post: post)).toList(),
      ],
    );
  }
}

// Model Post
class Post {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;

  Post({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.caption,
  });
}

// Widget Post
class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Post (Avatar dan Username)
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(post.userImage),
          ),
          title: Text(post.username, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.more_vert),
        ),
        // Gambar Post
        Image.asset(post.postImage),
        // Aksi (Like, Comment, Share)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.comment_outlined),
              SizedBox(width: 16),
              Icon(Icons.share_outlined),
            ],
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: post.username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' '),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

// Model Story
class Story {
  final String username;
  final String userImage;

  Story({required this.username, required this.userImage});
}

// Widget Story
class StoryWidget extends StatelessWidget {
  final Story story;

  const StoryWidget({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(story.userImage),
          ),
          SizedBox(height: 4),
          Text(
            story.username,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Tab Search
class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Tab Reels
class ReelsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Reels Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Tab Activity
class ActivityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Activity Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Tab Profile
class ProfileTab extends StatelessWidget {
  final String username = "Epan_Gantenk";
  final String userImage = "assets/profile.jpeg";
  final int postsCount = 24;
  final int followersCount = 340;
  final int followingCount = 180;
  final List<String> postImages = [
    "assets/post1.jpeg",
    "assets/post2.jpeg",
    "assets/post3.jpeg",
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
                    'This is a bio. Add more details about yourself here.',
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
