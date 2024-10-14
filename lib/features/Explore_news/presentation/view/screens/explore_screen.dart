import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/core/utils/routes/routes.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/Detailes_News/presentation/view/screen/detailes_news.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/buildNewscards.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/news_banner.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/news_card.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/title_section_explore.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/top_card_news.dart';
import 'package:sportify/features/Explore_news/presentation/viewmodel/news_cubit.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff303030),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is NewsLoaded) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    const NewsBanner(),
                    const SizedBox(height: 25),
                    const TitleSectionExplore(title: 'FIFA WORLD CUP'),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: buildNewsCards(
                        title1: state.news['articles'][3]['title'],
                        image1: state.news['articles'][3]['urlToImage'],
                        subtitle1: state.news['articles'][3]['description'],
                        onTap1: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailesNews(
                                imageurl: state.news['articles'][3]
                                    ['urlToImage'],
                                description: state.news['articles'][3]
                                    ['description'],
                              ),
                            ),
                          );
                        },
                        title2: state.news['articles'][2]['title'],
                        image2: state.news['articles'][2]['urlToImage'],
                        subtitle2: state.news['articles'][2]['description'],
                        onTap2: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailesNews(
                                imageurl: state.news['articles'][2]
                                    ['urlToImage'],
                                description: state.news['articles'][2]
                                    ['description'],
                              ),
                            ),
                          );
                        },
                        title3: state.news['articles'][4]['title'],
                        image3: state.news['articles'][4]['urlToImage'],
                        subtitle3: state.news['articles'][4]['description'],
                        onTap3: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailesNews(
                                imageurl: state.news['articles'][4]
                                    ['urlToImage'],
                                description: state.news['articles'][4]
                                    ['description'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'CRICKET WORLD CUP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    NewsBanner(
                      onTap: () {
                        //
                      },
                    ),
                    const SizedBox(height: 25),
                    const TitleSectionExplore(title: 'TOP NEWS'),
                    const SizedBox(height: 10),
                    TopNewsCurd(
                      image: state.news['articles'][0]['urlToImage'],
                      title: state.news['articles'][0]['title'] ?? 'No Title',
                      subtitle: state.news['articles'][0]['description'] ??
                          'No Description',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailesNews(
                                      imageurl: state.news['articles'][0]
                                          ['urlToImage'],
                                      description: state.news['articles'][0]
                                          ['description'],
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    TopNewsCurd(
                      image: state.news['articles'][1]['urlToImage'],
                      title: state.news['articles'][1]['title'] ?? 'No Title',
                      subtitle: state.news['articles'][1]['description'] ??
                          'No Description',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailesNews(
                                      imageurl: state.news['articles'][1]
                                          ['urlToImage'],
                                      description: state.news['articles'][1]
                                          ['description'],
                                    )));
                      },
                    ),
                    const SizedBox(height: 10),
                    TopNewsCurd(
                      image: state.news['articles'][2]['urlToImage'],
                      title: state.news['articles'][2]['title'] ?? 'No Title',
                      subtitle: state.news['articles'][2]['description'] ??
                          'No Description',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailesNews(
                                      imageurl: state.news['articles'][2]
                                          ['urlToImage'],
                                      description: state.news['articles'][2]
                                          ['description'],
                                    )));
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
