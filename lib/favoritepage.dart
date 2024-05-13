import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

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
    final favoriteIndices = prefs.getStringList('favorite_sites')?.map((index) => int.parse(index)).toList() ?? [];
    setState(() {
      _favoriteIndices = favoriteIndices;
    });
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
        title: Text("Daftar Favorit",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal ,
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
                  _launchLink(site.url);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    site.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
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
                    ),
                    Text(
                      site.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.star, color: Colors.amber,),
                  // icon: _siteManager.favoriteIndices.contains(index)
                  //     ? Icon(Icons.star, color: Colors.amber)
                  //     : Icon(Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _siteManager.toggleFavorite(favoriteIndex);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              _siteManager.favoriteIndices.contains(index)
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