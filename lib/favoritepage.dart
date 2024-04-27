import 'package:flutter/material.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final SiteManager _siteManager = SiteManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _siteManager.favoriteIndices.length,
        itemBuilder: (BuildContext context, int index) {
          final favoriteIndex = _siteManager.favoriteIndices.elementAt(index);
          final site = GenerateSite.getDataSites()[favoriteIndex];
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
                icon: Icon(Icons.star),
                onPressed: () {
                  setState(() {
                    _siteManager.toggleFavorite(favoriteIndex);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
