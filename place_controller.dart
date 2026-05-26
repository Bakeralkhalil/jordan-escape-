import 'package:flutter/material.dart';
import '../models/place_model.dart';

class DetailsScreen extends StatelessWidget {
  final PlaceModel place;

  const DetailsScreen({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    bool isNetwork = place.image.startsWith('http');

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isNetwork
                ? Image.network(
                    place.image,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    place.image,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        place.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 4),
                      Text(
                        place.city,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        place.rating.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    place.description,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
