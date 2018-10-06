import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {

  // TODO: Make a collection of cards (102)
  /// 封装生成任意数量的空卡，并返回一个卡列表
  /// * [context] 执行上下文
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString()
    );

    return products.map((product) {
        return Card(
          // TODO: Adjust card heights (103)
          child: Column(
            // TODO: Center items on the card (103)
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0/11.0,
                  child: Image.asset(
                    product.assetName,
                    package: product.assetPackage,
                    // TODO: Adjust the box size (102)
                    fit: BoxFit.fitWidth,
                  )
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      // TODO: Align labels to the bottom and center (103)
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // TODO: Change innermost Column (103)
                      children: <Widget>[
                        // TODO: Handle overflowing labels (103)
                        Text(
                          product == null ? '' : product.name,
                          style: theme.textTheme.button,
                          softWrap: false,
                          overflow: TextOverflow.clip,
                          maxLines: 1
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          product == null ? '' : formatter.format(product.price),
                          style: theme.textTheme.caption
                        ),
                      ],
                  ),
                  ),
                ),
              ]
            ),
        );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        // TODO: Add buttons and title (102)
        leading: IconButton(
          icon: Icon(Icons.menu, semanticLabel: 'menu'),
          onPressed: () {
            print('Menu button');
          },
        ),

        title: Text('SHRINE'),
        // TODO: Add trailing buttons (102)
        // 在Icon类中，SemanticLabel字段是在Flutter中添加辅助功能信息的常用方法
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search'),
            onPressed: () {
              print('Search button');
          }),
          IconButton(
            icon: Icon(Icons.tune, semanticLabel: 'filter'),
            onPressed: () {
              print('Filter button');
          }),
        ],

      ),
      // TODO: Add a grid view (102)
      body:GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0/9.0,
        // TODO: Build a grid of cards (102)
        children: this._buildGridCards(context)
      ),
    );
  }
}
