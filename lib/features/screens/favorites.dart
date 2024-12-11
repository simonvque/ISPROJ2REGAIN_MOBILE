import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/homepage/widgets/homepage_cards.dart';
import 'package:regain_mobile/model/view_product_model.dart';
import 'package:regain_mobile/provider/app_data_provider.dart';
import 'package:regain_mobile/provider/favorites_data_provider.dart';

// void main() {
//   runApp(const FavoritesScreen());
// }

// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({super.key});

//   @override
//   _FavoritesScreen createState() => _FavoritesScreen();
// }

// class _FavoritesScreen extends State<FavoritesScreen> {
//   //int tempUser = 1;
//   List<ViewProduct> favesList = [];

//   @override
//   void didChangeDependencies() {
//     _getData();
//     super.didChangeDependencies();
//   }

//   void _getData() {
//     final user = Provider.of<AppDataProvider>(context, listen: false).userId;
//     final userFaves = Provider.of<FavoritesDataProvider>(context, listen: false)
//         .getFavoritesByUser(user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // remove go back icon
//         leading: null,
//         automaticallyImplyLeading: false,
//         backgroundColor: green,
//         iconTheme: const IconThemeData(color: Colors.white),
//         centerTitle: false,
//         titleSpacing: 1.0,
//         title: const Padding(
//           padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
//           child: Text(
//             'Favorites',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // grid view items
//                   Consumer<FavoritesDataProvider>(
//                     builder: (context, value, child) {
//                       return CardItems(items: value.userFavorites);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

void main() {
  runApp(const FavoritesScreen());
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreen createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> {
  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
  }

  void _getData() {
    final user = Provider.of<AppDataProvider>(context, listen: false).userId;
    Provider.of<FavoritesDataProvider>(context, listen: false)
        .getFavoritesByUser(user);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        backgroundColor: green,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        titleSpacing: 1.0,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
          child: Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Consumer<FavoritesDataProvider>(
        builder: (context, value, child) {
          final userId =
              Provider.of<AppDataProvider>(context, listen: false).userId;
          return CardItems(
            items: value.userFavorites,
            onRefresh: _getData, // Pass the refresh callback
          );
        },
      ),
    );
  }
}
