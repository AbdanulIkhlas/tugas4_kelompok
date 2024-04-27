import 'package:flutter/material.dart';
import 'package:tugas4_kelompok/data/site.dart';
import 'package:tugas4_kelompok/sitemanager.dart';

class SitePage extends StatefulWidget {
  const SitePage({super.key});

  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  final SiteManager _siteManager = SiteManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Sites'),
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
                },
              ),
            ),
          );
        },
      ),
    );
  }
}



