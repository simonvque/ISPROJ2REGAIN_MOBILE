import 'package:flutter/material.dart';

import '../selected_item.dart';

class CardItems extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CardItems({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height * 0.7),
      ),
      itemBuilder: (context, index) {
        final Map<String, dynamic> item = items[index];
        return CardItem(
          item: item,
        );
      },
    );
  }
}

class CardItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CardItem({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.item['isFavorite'];
  }

  @override
  Widget build(BuildContext context) {
    final bool isSellerDropOff = widget.item['isSellerDropOff'];

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectedItemScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Image.asset(
                    widget.item['imagePath'],
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.item['title'],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    widget.item['location'],
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.item['price'],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: widget.item['sellerImagePath'] != null
                            ? ClipOval(
                          child: Image.asset(
                            widget.item['sellerImagePath'],
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        widget.item['seller'],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.item['weight'],
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isSellerDropOff ? Icons.check_circle : Icons.cancel,
                        color: isSellerDropOff ? Colors.green : Colors.red,
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Seller drop-off',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.item['category'],
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}