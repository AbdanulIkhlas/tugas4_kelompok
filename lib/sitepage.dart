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
        title: Text('List Sites'),
      ),
      body: ListView.builder(
        itemCount: GenerateSite.getDataSites().length,
        itemBuilder: (BuildContext context, int index) {
          final site = GenerateSite.getDataSites()[index];
          return Card(
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
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border),
                onPressed: () {
                  setState(() {
                    _siteManager.toggleFavorite(index);
                  });
                  // Tampilkan Snackbar untuk memberitahu pengguna bahwa situs telah difavoritkan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_siteManager.favoriteIndices.contains(index)
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritePage()),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
