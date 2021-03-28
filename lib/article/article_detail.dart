import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queueless/article/article_provider.dart';
import '../common-widgets/text_widget.dart';

class ArticleDetail extends StatelessWidget {
  static const routeName = '/article-detail-screen';
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final article = Provider.of<ArticleProvider>(context, listen: false)
        .getArticle(args["index"]);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 20,bottom: 60),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop()),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: width - 120,
                      height: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget("By", size: 14, color: Colors.grey),
                          TextWidget(article.author, size: 14,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 15,right: 15),
                child: TextWidget(article.title,size: 30,isBold: true,),
              ),
              SizedBox(height: 25),
              Hero(
                tag: "article-detail ${args["index"]}",
                child: Container(
                  height: 220,
                  margin: const EdgeInsets.only(left: 12,right: 15),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(article.imageUrl,fit: BoxFit.cover,)),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 3,)],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 12,right: 15),
                child: TextWidget(
                  article.content,
                  maxLines: 100,
                  color: Colors.black45,
                )
                )
            ],
        ),
      ),
          )),
    );
  }
}
