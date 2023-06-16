import 'package:hive/hive.dart';

class BookmarkDB {
  static const tbBookmark = "bookmark";
  late Box thisTb = Hive.box(tbBookmark);

  Future<Box> init() async {
    // await Hive.deleteBoxFromDisk(tbBookmark);
    Box box = await Hive.openBox(tbBookmark);
    print(box.values);
    return box;
  }

  Future<void> create({
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) async {
    // final _tbTamu = Hive.box(db.tbDaftarTamu);
    await thisTb.add({
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    });
  }

  showData() {
    final data = thisTb.values.toList();
    final keys = thisTb.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      data[i]['key'] = keys[i];
    }
    return data.reversed.toList();
  }
}
