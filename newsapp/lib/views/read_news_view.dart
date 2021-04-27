import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/widgets/circle_buttom.dart';

class ReadNewsView extends StatelessWidget {
  final News news;
  ReadNewsView({this.news});
  @override
  Widget build(BuildContext context) {
    var descriptionStyle;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Hero(
              tag: news.seen,
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: KGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 5.0, backgroundColor: KGrey3),
                      SizedBox(width: 6.0),
                      Text(
                        news.category,
                        style: KCategoryTitle,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Status(
                  icon: Icons.remove_red_eye,
                  total: news.seen,
                ),
                SizedBox(width: 15.0),
                Status(
                  icon: Icons.favorite_border,
                  total: news.favorite,
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(news.title, style: KTitleCard.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(news.time, style: KDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: KBalck,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  news.author,
                  style: KDetailContent.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              news.content,
              style: descriptionStyle,
            ),
            SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;
  Status({this.icon, this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: KGrey2),
        SizedBox(width: 4.0),
        Text(total, style: KDetailContent),
      ],
    );
  }
}
