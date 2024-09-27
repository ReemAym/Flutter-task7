import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color col = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductScreen.id,
          arguments: widget.product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.product.title.substring(0, 18),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              col = (col == Colors.black)
                                  ? Colors.red
                                  : Colors.black;
                            });

                            if (favouriteProductList.contains(widget.product)) {
                              favouriteProductList.remove(widget.product);
                            } else {
                              favouriteProductList.add(widget.product);
                            }
                            if (favouriteProductList.isEmpty)
                              print('empty');
                            else {
                              for (int i = 0;
                                  i < favouriteProductList.length;
                                  i++) {
                                print(favouriteProductList[i].title);
                              }
                            }
                          },
                          child: Icon(Icons.favorite, color: col),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 32,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}

List<ProductModel> favouriteProductList = [];
