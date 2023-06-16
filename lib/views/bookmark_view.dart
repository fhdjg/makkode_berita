import 'package:flutter/material.dart';
import '../db/bookmark_db.dart';
import 'detail_berita_view.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  late List listBerita;

  @override
  void initState() {
    super.initState();
    listBerita = BookmarkDB().showData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (listBerita.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Bookmark'),
        ),
        body: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (listBerita[index]['urlToImage'].toString() != 'null')
                    Image(
                      image: NetworkImage(listBerita[index]['urlToImage']),
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailBeritaView(
                                        datas: listBerita[index]),
                                  ));
                            },
                            child: Text(
                              listBerita[index]['title'],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: false,
                            ),
                          ),
                        ),
                        Text(listBerita[index]['publishedAt']),
                        SizedBox(
                          height: 25,
                          child: OutlinedButton.icon(
                              style: ButtonStyle(
                                iconColor:
                                    MaterialStateProperty.all(Colors.red),
                                iconSize: MaterialStateProperty.all(15),
                                // side: MaterialStateProperty.all(
                                //     BorderSide(color: Colors.red)),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Pesan'),
                                    content: const Text('Ingin hapus data?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // BookmarkDB().delete(itemKey)
                                          var key = int.parse(
                                              listBerita[index]['key']);
                                          BookmarkDB()
                                              .delete(key)
                                              .then((value) {
                                            Navigator.pop(context);
                                            setState(() {});

                                            listBerita =
                                                BookmarkDB().showData();
                                            final snackbar = SnackBar(
                                              content: const Text(
                                                  'Data berhasil dihapus'),
                                              action: SnackBarAction(
                                                label: 'OK',
                                                onPressed: () {},
                                              ),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackbar);
                                          });
                                        },
                                        child: const Text('Hapus'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(Icons.delete),
                              label: const Text(
                                'Hapus',
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: Text('Belum ada bookmark'),
      );
    }
  }
}
