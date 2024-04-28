import 'package:flutter/material.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final SiteManager _siteManager = SiteManager();
  late List<int> _favoriteIndices = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteIndicesFromSharedPreferences();
  }

  Future<void> _loadFavoriteIndicesFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIndices =
        prefs.getStringList('favorite_sites')?.map((index) => int.parse(index)).toList() ?? [];
    setState(() {
      _favoriteIndices = favoriteIndices;
    });
  }

  // Function to launch website link in a new tab
  void _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to show notification when site is favorited or unfavorited
  void _showNotification(bool favorited) {
    String message = favorited ? 'Site Favorited' : 'Site Unfavorited';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Daftar Favorit",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal, Colors.white],
          ),
        ),
        child: ListView.builder(
          itemCount: _favoriteIndices.length,
          itemBuilder: (BuildContext context, int index) {
            final favoriteIndex = _favoriteIndices[index];
            final site = GenerateSite.getDataSites()[favoriteIndex];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                onTap: () {
                  _launchLink(site.url); // Launch link when ListTile is tapped
                },
                leading: Image(
                  image: AssetImage(site.image),
                  width: 50,
                ),
                title: Text(site.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      site.url,
                      style: TextStyle(color: Colors.blue), // Style link text
                    ),
                    Text(site.description),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () {
                    setState(() {
                      _siteManager.toggleFavorite(favoriteIndex);
                      _showNotification(_siteManager.favoriteIndices.contains(favoriteIndex));
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
