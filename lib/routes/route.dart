// import 'package:flutter/material.dart';
// import 'package:makkode_berita/views/detail_berita_view.dart';

// class RouteName {
//   static const String _detailBerita = '/DetailBerita';
// }

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RouteName._detailBerita:
//         return MaterialPageRoute(
//           builder: (context) => DetailBeritaView(),
//           settings: const RouteSettings(name: RouteName._detailBerita),
//         );
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(title: const Text("Error")),
//         body: const Center(child: Text('Halaman tidak ditemukan!')),
//       );
//     });
//   }
// }
