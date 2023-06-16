import 'package:hive/hive.dart';

class BookmarkDB {
  static const tbBookmark = "bookmark";
  late Box thisTb = Hive.box(tbBookmark);

  Future<Box> init() async {
    // await Hive.deleteBoxFromDisk(tbBookmark);
    Box box = await Hive.openBox(tbBookmark);
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
    final tb = Hive.box(tbBookmark);
    await tb.add({
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    });
  }

  List showData() {
    final tb = Hive.box(tbBookmark);

    final data = tb.values.toList();
    final keys = tb.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      data[i]['key'] = keys[i].toString();
    }
    return data.reversed.toList();
  }

  Future<void> delete(int itemKey) async {
    final tb = Hive.box(tbBookmark);
    await tb.delete(itemKey);
  }
}
