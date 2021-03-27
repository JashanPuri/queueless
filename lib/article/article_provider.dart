import 'package:flutter/cupertino.dart';

class Article {
  final imageUrl;
  final title;
  final content;
  final publishedAt;
  final url;
  final author;

  Article(
      {this.content,
      this.imageUrl,
      this.publishedAt,
      this.title,
      this.url,
      this.author});
}

class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [
    Article(
        imageUrl:
            "https://cdn.dribbble.com/users/1210339/screenshots/2776561/einstein_cycling_still_2x.gif?compress=1&resize=400x300",
        title: "Benifits of cycling",
        author: "Ramesh",
        content:
            '''To be fit and healthy you need to be physically active. Regular physical activity can help protect you from serious diseases such as obesity, heart disease, cancer, mental illness, diabetes and arthritis. Riding your bicycle regularly is one of the best ways to reduce your risk of health problems associated with a sedentary lifestyle.
                Cycling is a healthy, low-impact exercise that can be enjoyed by people of all ages, from young children to older adults. It is also fun, cheap and good for the environment.
                Riding to work or the shops is one of the most time-efficient ways to combine regular exercise with your everyday routine. An estimated one billion people ride bicycles every day – for transport, recreation and sport.'''),
    Article(
        imageUrl:
            "https://res-3.cloudinary.com/sharecare/image/upload/c_fill,dpr_1,f_auto,h_340,w_600/v1486591491/articles/talk-to-your-child-like-adult",
        title: "Talk to Your Child Like an Adult",
        author: "MICHAEL ROIZEN, MD, AND MEHMET OZ, MD",
        content:
            '''A bit of baby talk and mimicking a child’s sounds during the earliest months of life makes an infant feel connected and understood and stimulates an infant’s brain. One study found two-year-olds who heard the most baby talk knew an average of 433 words, while toddlers with quieter families knew only around 169. And earlier studies reveal how often a parent talks a child and what kind of words are used (meaning not always No, No, No) has an enormous impact on emotional and intellectual development.
            Now, research reveals that at around 10-20 months of age, kids need Mom to talk to them as if they were fully verbal and let them know she gets what they’re feeling and thinking. Then, at five years old, the child will have developed the ability to understand others’ thoughts and to emphasize.
            Clearly, experiencing this mind meld (researchers call it mind-mindedness, but we like the Vulcan phrase better) helps your child grow into a loving adult. So put down the cell phone, turn off the TV and talk to your child about how he or she is feeling and acting; describe what’s going on around you. Pretty soon you’ll be amazed by what an expressive, kind kid you’ve got!'''),
    Article(
        imageUrl:
            "https://res-4.cloudinary.com/sharecare/image/upload/c_fill,dpr_1,f_auto,h_340,w_600/v1481927127/articles/brain-friendly-folate",
        title: "Brain-Friendly B Vitamins",
        author: "PATRICK SULLIVAN",
        content:
            '''rotect your brain by kicking up your B vitamin intake, especially if your diet isn’t the healthiest. Getting enough B vitamins to avoid deficiency may prevent a number of brain issues, such as seizures, strokes and Alzheimer’s disease.
“Vitamins (and minerals too) are substances in food that are essential to the normal growth, development and functioning of the body,” says pharmacist Stacy Wiegman. Here’s how B vitamins can help protect your brain.'''),
    Article(
        imageUrl:
            "https://res-1.cloudinary.com/sharecare/image/upload/c_fill,dpr_1,f_auto,h_340,w_600/v1484617345/articles/hidden-sugars-not-sweet-surprise",
        title: "Hidden Sugars Are Not a Sweet Surprise",
        author: "MICHAEL ROIZEN, MD, AND MEHMET OZ, MD",
        content:
            '''Lord Sugar (no kidding) is the star of the BBC One’s version of The Apprentice. Sugar Shane Mosley is a three-weight world boxing champ. And WBA guard Ta'Shauna Sugar Rodgers is an up-and-coming star. They’re all upfront about their ability to turn from sweet to ferocious when they’re looking to beat their competition.

But that’s not the style of hidden sugars packed into fruit juices, juice drinks and smoothies marketed to kids. According to a new study out of the U.K., nearly half of such beverages studied contained the maximum daily sugar intake for any child. This puts kids at risk for obesity, diabetes, tooth decay and the health hazards they trigger. And on this side of the pond?

They’re just as loaded: a 12-ounce Kids Strawberry Blitz from a national smoothie chain delivers 32 grams of sugar! An 8 ounce tropical juice drink found in grocery stores hits 24 grams! And fruity drinks aren’t the only ones to beware: Sweetened ice teas and coffees appeal to teens. On average American adolescents consume almost 35 teaspoons of added sugars daily! Keep feeding ‘em that, and they’ll die earlier than their great-grandparents did.

You gotta read nutrition and ingredient labels Mom and Dad—and keep beverages with added sugars out of kids’ hands (and yours). Helping your kids cultivate a taste for the natural sweetness of fresh fruit, veggies and whole grains is a great way to help make sure they live a long, healthy and happy life!.''')
  ];

  List<Article> get articles {
    return [..._articles];
  }

  Article getArticle(index) {
    return _articles[index];
  }
}
