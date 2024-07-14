// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:yulo_regain/constants/colors.dart';
//
// import '../../../constants/text_strings.dart';
// import '../../../themes/elements/button_styles.dart';
// import '../../constants/sizes.dart';
// import '../../themes/elements/input fields/regain_textbox.dart';
//
// void main() {
//   runApp(FilterScreen());
// }
//
// class FilterScreen extends StatefulWidget {
//   @override
//   State<FilterScreen> createState() => _FilterScreen();
// }
//
// class _FilterScreen extends State<FilterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: const Text(
//             'Filter',
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'Montserrat-Bold',
//             ),
//           ),
//         ),
//         body:  SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                     'Location',
//                     style: Theme.of(context).textTheme.titleLarge
//                 ),
//                 const SizedBox(height: ReGainSizes.spaceBtwItems),
//
//                 const RegainTextbox(hintText: 'All of Philippines'),
//
//                 const SizedBox(height: ReGainSizes.spaceBtwSections),
//
//                 Text(
//                     'Categories',
//                     style: Theme.of(context).textTheme.titleLarge
//                 ),
//
//
//                 Wrap(
//                     children: [FilterChip(
//                         label: Text("Plastic", style: Theme.of(context).textTheme.labelMedium),
//                         selected: true,
//                         selectedColor: green,
//                         backgroundColor: white,
//                         checkmarkColor: white, onSelected: (bool value) {  },
//                     )]
//                 ),
//
//                 Wrap(
//                     children: [FilterChip(
//                       label: Text("Metal", style: Theme.of(context).textTheme.labelMedium),
//                       selected: false,
//                       selectedColor: green,
//                       backgroundColor: white,
//                       checkmarkColor: white, onSelected: (bool value) {  },
//                     )]
//                 ),
//
//                 Wrap(
//                     children: [FilterChip(
//                       label: Text("Paper", style: Theme.of(context).textTheme.labelMedium),
//                       selected: true,
//                       selectedColor: green,
//                       backgroundColor: white,
//                       checkmarkColor: white, onSelected: (bool value) {  },
//                     )]
//                 ),
//
//                 Wrap(
//                     children: [FilterChip(
//                       label: Text("Electronics", style: Theme.of(context).textTheme.labelMedium),
//                       selected: false,
//                       selectedColor: green,
//                       backgroundColor: white,
//                       checkmarkColor: white, onSelected: (bool value) {  },
//                     )]
//                 ),
//
//                 const SizedBox(height: ReGainSizes.spaceBtwSections),
//
//                 Text(
//                     'Price',
//                     style: Theme.of(context).textTheme.titleLarge
//                 ),
//                 const SizedBox(height: ReGainSizes.spaceBtwItems),
//                 const RegainTextbox(hintText: 'Minimum Price', keyboardType: TextInputType.phone,),
//                 const SizedBox(height: ReGainSizes.spaceBtwItems),
//                 const RegainTextbox(hintText: 'Maximum Price', keyboardType: TextInputType.phone,),
//
//                 const SizedBox(height: ReGainSizes.spaceBtwSections),
//
//                 Text(
//                     'Deal Options',
//                     style: Theme.of(context).textTheme.titleLarge
//                 ),
//
//                 Switch(value: false, onChanged: (bool value) {  }),
//                 Text(
//                     'Seller drop-off',
//                     style: Theme.of(context).textTheme.bodyMedium
//                 ),
//
//
//
//               ],
//             ),
//           ),
//
//         ),
//       ),
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         appBarTheme: const AppBarTheme(color: green),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../themes/elements/button_styles.dart';
import '../../themes/elements/input fields/regain_textbox.dart';

void main() {
  runApp(const FilterScreen());
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  bool sellerDropOff = false;
  bool plasticSelected = true;
  bool metalSelected = true;
  bool paperSelected = false;
  bool electronicsSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Filter',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat-Bold',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                RegainTextbox(hintText: 'All of Philippines'),
                const SizedBox(height: ReGainSizes.spaceBtwSections),
                Text('Category', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    FilterChip(
                      label: const Text('Plastic'),
                      selected: plasticSelected,
                      selectedColor: green,
                      onSelected: (bool value) {
                        setState(() {
                          plasticSelected = value;
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Metal'),
                      selected: metalSelected,
                      selectedColor: green,
                      onSelected: (bool value) {
                        setState(() {
                          metalSelected = value;
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Paper'),
                      selected: paperSelected,
                      selectedColor: green,
                      onSelected: (bool value) {
                        setState(() {
                          paperSelected = value;
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Electronics'),
                      selected: electronicsSelected,
                      selectedColor: green,
                      onSelected: (bool value) {
                        setState(() {
                          electronicsSelected = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: ReGainSizes.spaceBtwSections),
                Text('Price', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                RegainTextbox(
                  hintText: 'Minimum Price',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: ReGainSizes.spaceBtwInputFields),
                RegainTextbox(
                  hintText: 'Maximum Price',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: ReGainSizes.spaceBtwSections),
                Text('Delivery Option',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: ReGainSizes.spaceBtwItems),
                Row(
                  children: [
                    Switch(
                      value: sellerDropOff,
                      activeColor: green,
                      onChanged: (bool value) {
                        setState(() {
                          sellerDropOff = value;
                        });
                      },
                    ),
                    Text('Seller Drop-off',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: ReGainSizes.spaceBtwSections),
                RegainButtons(
                  text: 'Submit',
                  onPressed: () {
                    // Add your confirmation logic here
                  },
                  type: ButtonType.filled,
                  size: ButtonSize.large,
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(color: green),
          fontFamily: 'Montserrat-Regular'),
    );
  }
}
