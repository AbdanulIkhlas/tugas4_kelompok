import 'package:flutter/material.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';
import 'favoritepage.dart'; // Import halaman FavoritePage

class SitePage extends StatefulWidget {
  const SitePage({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _SitePageState();
  }
}

class _SitePageState extends State<StatefulWidget> {
  final SiteManager _siteManager = SiteManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Sites',
          style: TextStyle(color: Colors.white), // Tambahkan style
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.withOpacity(0.8), Colors.white],
          ),
        ),
        child: ListView.builder(
          itemCount: GenerateSite.getDataSites().length,
          itemBuilder: (BuildContext context, int index) {
            final site = GenerateSite.getDataSites()[index];
            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image(
                  image: AssetImage(site.image),
                  width: 50,
                ),
                title: Text(site.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(site.url),
                    Text(site.description),
                  ],
                ),
                trailing: IconButton(
                  icon: _siteManager.favoriteIndices.contains(index)
                      ? Icon(Icons.star, color: Colors.orange)
                      : Icon(Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _siteManager.toggleFavorite(index);
                    });
                    // Tampilkan Snackbar untuk memberitahu pengguna bahwa situs telah difavoritkan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            _siteManager.favoriteIndices.contains(index)
                                ? 'Site favorited!'
                                : 'Site unfavorited!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritePage()),
          );
        },
        child: Icon(Icons.favorite),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
