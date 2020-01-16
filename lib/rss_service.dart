import 'package:news_reader/rss_model.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class RssService {
  Future<List<Feeds>> getRssFeed(String companyUrl) async {
    var data = await http.get(companyUrl);

    List<Feeds> feed = new List();

    var rssFeed = new RssFeed.parse(data.body);
    String imgUrl;
    for (int i = 0; i < rssFeed.items.length; i++) {
      imgUrl = rssFeed.items[i].enclosure.url;
      if (imgUrl == null) {
        imgUrl =
            'https://www.advantagegeneral.com/App_Themes/CorporateSite/Images/no_image_news.png';
      } else {
        imgUrl = rssFeed.items[i].enclosure.url;
      }

      feed.add(new Feeds(rssFeed.items[i].title, rssFeed.items[i].description,
          rssFeed.items[i].link, imgUrl));
    }

    return feed;
  }

  Future<List<Feeds>> getAtomFeed() async {
    var data = await http.get('https://www.ntv.com.tr/gundem.rss');

    List<Feeds> feed = new List();

    var atomFeed = new AtomFeed.parse(data.body);

    for (int i = 0; i < atomFeed.items.length; i++) {
      feed.add(new Feeds(atomFeed.items[i].title, atomFeed.items[i].summary,
          atomFeed.items[i].published, atomFeed.items[i].content));
    }

    return feed;
  }
}
