import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://unsplash.com/photos/HfWA-Axq6Ek',
    'https://unsplash.com/photos/HfWA-Axq6Ek',
    'https://unsplash.com/photos/HfWA-Axq6Ek',
    'https://unsplash.com/photos/HfWA-Axq6Ek',
    'https://unsplash.com/photos/HfWA-Axq6Ek',
    'https://unsplash.com/photos/HfWA-Axq6Ek',
  ];

  final List<String> samplePhotos = [
    'Photo 1',
    'Photo 2',
    'Photo 3',
    'Photo 4',
    'Photo 5',
    'Photo 6',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Photo Gallery!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Search for photos',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>const  CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Sample Photos:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: samplePhotos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      width: 40,
                      height: 40,
                      placeholder: (context, url) =>const  CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                    title: Text(samplePhotos[index]),
                    subtitle: Text('Subtitle for ${samplePhotos[index]}'),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Upload button pressed'),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(label: "Undo", onPressed: () {}),
              ),
            );
          },
          child: const Icon(Icons.upload),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
