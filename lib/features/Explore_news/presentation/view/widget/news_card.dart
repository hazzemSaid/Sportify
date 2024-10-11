import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image.isNotEmpty
                    ? NetworkImage(image)
                    : AssetImage('assets/placeholder.png') as ImageProvider,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 120,
            height: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 150,
            height: 20,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class NewsListView extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      'title': 'Title 1',
      'subtitle': 'Subtitle 1',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Title 2',
      'subtitle': 'Subtitle 2',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Title 3',
      'subtitle': 'Subtitle 3',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News List'),
      ),
      body: SizedBox(
        height: 180,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          itemCount: news.length,
          itemBuilder: (context, index) {
            final newsItem = news[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: NewsCard(
                title: newsItem['title']!,
                subtitle: newsItem['subtitle']!,
                image: newsItem['image']!,
                onTap: () {
                  // Handle card tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
