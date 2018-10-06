import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
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
        children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset('assets/diamond.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Title'),
                    SizedBox(height: 8.0),
                    Text('Secondary Text'),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
      ),
    );
  }
}
