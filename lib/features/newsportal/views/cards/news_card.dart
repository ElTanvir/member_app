import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:member_app/features/newsportal/data/data_models/news_model.dart';
import 'package:member_app/utils/constants.dart';
import 'package:member_app/utils/utility_provider.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 20, 10),
      child: Container(
        decoration: KEltDecoration.boxDecoration1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (newsModel.thumbnail_image != null &&
                  newsModel.thumbnail_image != '')
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: deviceSize.width * 0.25,
                      child: Image.network(
                        'http://10.100.92.209/super_home_laravel/${newsModel.thumbnail_image}', //!Have to Switch to Live Image Server
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsModel.post_title,
                      style: KEltTextStyle.titleText,
                    ),
                    Text(
                      newsModel.long_description,
                      style: KEltTextStyle.subtitleText,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
