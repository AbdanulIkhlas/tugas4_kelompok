import 'package:flutter/material.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends State<FavoritePage> {
  final SiteManager _siteManager = SiteManager();

  @override
  Widget build(BuildContext context) {
    List<int> favoriteIndices = _siteManager.getFavoriteSites();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Sites'),
      ),
      body: ListView.builder(
        itemCount: favoriteIndices.length,
        itemBuilder: (BuildContext context, int index) {
          final favoriteIndex = favoriteIndices[index];
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
            ),
          );
        },
      ),
    );
  }
}
