import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final SiteManager _siteManager = SiteManager();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Function to save favorite list to SharedPreferences
  void _saveFavoritesToSharedPreferences() {
    final favoriteIndices = _siteManager.favoriteIndices;
    _prefs.setStringList('favorite_sites',
        favoriteIndices.map((index) => index.toString()).toList());
  }

  // Function to launch website link in a new tab
  void _launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
          itemCount: _siteManager.favoriteIndices.length,
          itemBuilder: (BuildContext context, int index) {
            final favoriteIndex = _siteManager.favoriteIndices.elementAt(index);
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
                  width: 100,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  site.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      site.url,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      site.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.star, color: Colors.amber),
                  onPressed: () {
                    setState(() {
                      _siteManager.toggleFavorite(favoriteIndex);
                      _saveFavoritesToSharedPreferences();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(_siteManager.favoriteIndices
                                  .contains(favoriteIndex)
                              ? 'Site Favorited'
                              : 'Site Unfavorited'),
                          duration: Duration(seconds: 1),
                        ),
                      );
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
