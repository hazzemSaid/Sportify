import 'package:flutter/material.dart';

class TopNewsCurd extends StatelessWidget {
  const TopNewsCurd({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 130,
            color: const Color(0xff00A3B7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    height: 20,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 50,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TopNewsListView extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'News 1',
      'subtitle': 'This is the subtitle for News 1',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'News 2',
      'subtitle': 'This is the subtitle for News 2',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'News 3',
      'subtitle': 'This is the subtitle for News 3',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: news.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final newsItem = news[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TopNewsCurd(
              title: newsItem['title']!,
              subtitle: newsItem['subtitle']!,
              image: newsItem['image']!,
              onTap: () {
                // Handle 'Read More' tap
              },
            ),
          );
        },
      ),
    );
  }
}
