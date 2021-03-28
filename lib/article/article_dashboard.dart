import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/article/article_banner.dart';
import 'package:queueless/article/article_detail.dart';
import 'package:queueless/article/article_provider.dart';
import '../common-widgets/text_widget.dart';

class ArticleDashboard extends StatelessWidget {
  static const routeName = "article-dashboard";
  @override
  Widget build(BuildContext context) {
    final _articles =
        Provider.of<ArticleProvider>(context, listen: false).articles;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.of(context).pop()),
                      SizedBox(
                        width: 15,
                      ),
                      TextWidget("Health Articles", size: 27, isBold: true),
                    ],
                  ),
                ),
                ArticleBanner(),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: TextWidget(
                      "Recent Articles",
                      size: 18,
                      isBold: true,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: _articles.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ArticleDetail.routeName,
                                arguments: {"index":index}
                              );
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 90,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Hero(
                                        tag: "article-detail $index",
                                        child: Container(
                                          height: 90,
                                          width: 100,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                _articles[index].imageUrl,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 100,
                                        width: width - 155,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              "By  ${_articles[index].author}",
                                              size: 12,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(height: 10),
                                            TextWidget(
                                              (_articles[index].title),
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
