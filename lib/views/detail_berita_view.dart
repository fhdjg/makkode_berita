import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../db/bookmark_db.dart';

class DetailBeritaView extends StatelessWidget {
  const DetailBeritaView({
    super.key,
    required this.datas,
  });
  final Map datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali'),
        actions: [
          IconButton(
            onPressed: () async {
              final Uri url = Uri.parse(datas['url']);
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
            icon: const Icon(Icons.link),
          ),
          IconButton(
            onPressed: () {
              BookmarkDB()
                  .create(
                      author: (datas['author'].toString().isEmpty
                          ? ''
                          : datas['author']),
                      title: datas['title'],
                      description: datas['description'],
                      url: datas['url'],
                      urlToImage: (datas['urlToImage'].toString().isEmpty
                          ? ''
                          : datas['urlToImage']),
                      publishedAt: datas['publishedAt'],
                      content: datas['content'])
                  .then((value) {
                final snackbar = SnackBar(
                  content: const Text('Berita berhasil di bookmark'),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              });
            },
            icon: const Icon(Icons.bookmark_border_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Text(
            datas['title'],
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Penulis: ${datas['author']}'),
              Text('${datas['publishedAt']}'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Image(
            image: NetworkImage(datas['urlToImage']),
            fit: BoxFit.contain,
            height: 200,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                image: AssetImage('assets/img/image.png'),
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              );
            },
          ),
          if (datas['content'].toString() != 'null') Text((datas['content'])),
        ],
      ),
    );
  }
}
