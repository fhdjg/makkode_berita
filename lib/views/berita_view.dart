import 'package:flutter/material.dart';
import 'package:makkode_berita/views/detail_berita_view.dart';
import '../controllers/berita_controller.dart';

class BeritaView extends StatefulWidget {
  const BeritaView({super.key});

  @override
  State<BeritaView> createState() => _BeritaViewState();
}

class _BeritaViewState extends State<BeritaView> {
  Map listBerita = {};
  @override
  void initState() {
    super.initState();
    BeritaController().getBerita().then((value) {
      listBerita = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (listBerita.isNotEmpty) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Breaking News'),
          actions: [
            IconButton(
              onPressed: () {
                print('object');
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: listBerita['articles'].length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailBeritaView(
                          datas: listBerita['articles'][index]),
                    ));
              },
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (listBerita['articles'][index]['urlToImage']
                            .toString() !=
                        'null')
                      Image(
                        image: NetworkImage(
                            listBerita['articles'][index]['urlToImage']),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                        errorBuilder: (context, error, stackTrace) {
                          return const Image(
                            image: AssetImage('assets/img/image.png'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(
                              listBerita['articles'][index]['title'],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: false,
                            ),
                          ),
                          Text(listBerita['articles'][index]['publishedAt']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
