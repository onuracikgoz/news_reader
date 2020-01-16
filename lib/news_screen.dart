

import 'package:flutter/material.dart';
import 'package:news_reader/constant.dart';
import 'package:news_reader/rss_service.dart';
import 'package:news_reader/webview.dart';

class NewsScreen extends StatelessWidget {
  final String companyLink;

  NewsScreen({this.companyLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text('Haberler'),
        ),
        body: Container(
          color: Colors.white10,
          child: FutureBuilder(
              future: RssService().getRssFeed(companyLink),
              // ignore: missing_return
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Container(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              width: 100.0,
                              height: 150.0,
                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 8.0)]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  snapshot.data[index].getUrlImg,
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () { Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    MyWebView(
                                      title: 'Haber İçeriği', selectedUrl
                                        :snapshot.data[index].getWebLink,)));



                            },
                            trailing: Icon(Icons.keyboard_arrow_right),
                            title: Text(
                                snapshot.data[index].getTitle,
                                style: newsTextStyle
                            ),
                            subtitle: Text(snapshot.data[index].getDescription,style: newsDescriptionStyle,),
                          );
                        },
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) =>
                            Divider(
                              color: Colors.black,
                            ),
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Container();
                    break;
                  case ConnectionState.none:
                    return Container(child:Text("Veri Yok"));
                    break;
                  case ConnectionState.waiting:
                    return LinearProgressIndicator();

                    break;
                }
              }),
        ));
  }
}
