import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regain_mobile/constants/colors.dart';
import 'package:regain_mobile/features/screens/profile/app_bar.dart';
import 'package:regain_mobile/provider/green_zone_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class GreenZonePage extends StatefulWidget {
  const GreenZonePage({super.key});

  @override
  State<GreenZonePage> createState() => _GreenZonePageState();
}

class _GreenZonePageState extends State<GreenZonePage> {
  int currentPage = 0;
  final int itemsPerPage = 5;

  final List<IconData> randomIcons = [
    Icons.local_florist,
    Icons.eco,
    Icons.recycling,
    Icons.nature,
    Icons.leak_remove,
    Icons.wb_sunny,
    Icons.water_damage,
    Icons.landscape,
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<GreenZoneProvider>(context, listen: false).getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'The Green Zone'),
      body: Consumer<GreenZoneProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.articles.isEmpty) {
            return const Center(child: Text('No articles available'));
          } else {
            final totalPages = (provider.articles.length / itemsPerPage).ceil();
            final articlesToShow = provider.articles.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: articlesToShow.length,
                    itemBuilder: (context, index) {
                      final article = articlesToShow[index];
                      final randomIcon = randomIcons[Random().nextInt(randomIcons.length)];

                      String decodedSummary = utf8.decode(article.summary.codeUnits);

                      return Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            leading: Icon(randomIcon, size: 28, color: green), 
                            title: Text(
                              article.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: black,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date: ${article.date.toLocal().toString().split(' ')[0]}',
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: gray,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  decodedSummary,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                            onTap: () async {
                              final url = Uri.parse(article.link);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[300],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: green,
                        onPressed: currentPage > 0
                            ? () {
                                setState(() {
                                  currentPage--;
                                });
                              }
                            : null,
                      ),
                      Text('Page ${currentPage + 1} of $totalPages'),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        color: green,
                        onPressed: currentPage < totalPages - 1
                            ? () {
                                setState(() {
                                  currentPage++;
                                });
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}


