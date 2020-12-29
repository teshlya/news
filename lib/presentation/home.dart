import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news/domain/model/news.dart';
import 'package:news/domain/state/home/home_state.dart';
import 'package:news/internal/dependencies/home_module.dart';

import 'news_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    initHomeState();
  }

  void initHomeState() {
    _homeState = HomeModule.homeState();
    _homeState.getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 25, 178, 238),
            Color.fromARGB(255, 21, 236, 229)
          ],
        ),
      ),
      child: _getList(),
    );
  }

  Widget _getList() {
    return Observer(builder: (_) {
      if (_homeState.newsList == null || _homeState.newsList.news.isEmpty) {
        if (_homeState.errorLoading)
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Error get data from server"),
          ));
        if (_homeState.isLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ));
        } else
          return Container();
      } else
        return _fillList();
    });
  }

  Widget _fillList() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        for (var item in _homeState.newsList.news) _getItem(item),
      ],
    );
  }

  Widget _getItem(News news) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
          height: 120,
          child: Stack(children: <Widget>[
            _getCard(news),
            _onTapCard(news),
          ])),
    );
  }

  Widget _getCard(News image) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: _getContainCard(image),
    );
  }

  Widget _onTapCard(News news) {
    return Positioned.fill(
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: () => _openNews(news),
            )));
  }

  _openNews(News news) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsScreen(
                  news: news,
                )));
  }

  Widget _getContainCard(News news) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _getImage(news.smallImage),
        ),
        Expanded(
          flex: 2,
          child: _getTitle(news.title),
        ),
      ],
    );
  }

  Widget _getImage(String url) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Text(title != null ? title : ""))
        ]));
  }
}
