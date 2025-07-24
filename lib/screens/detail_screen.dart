import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/cat_breed.dart';
import '../services/cat_api_service.dart';

class DetailScreen extends StatelessWidget {
  final CatBreed breed;

  const DetailScreen({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.5; // Mitad de la pantalla

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          breed.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Imagen fija en la mitad superior
          Container(
            height: imageHeight,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildHeroImage(),
              ),
            ),
          ),
          
          // Contenido scrollable en la mitad inferior
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  _buildSection(
                    title: 'Description',
                    child: Text(
                      breed.description,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // General Information
                  _buildSection(
                    title: 'General Information',
                    child: Column(
                      children: [
                        _buildInfoRow('Origin Country', breed.origin, Icons.location_on),
                        _buildInfoRow('Life Span', '${breed.lifeSpan} years', Icons.favorite),
                        _buildInfoRow('Weight', '${breed.weight.metric} kg (${breed.weight.imperial} lbs)', Icons.scale),
                        _buildInfoRow('Temperament', breed.temperament, Icons.psychology),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Characteristics (ratings)
                  _buildSection(
                    title: 'Characteristics',
                    child: Column(
                      children: [
                        _buildRatingRow('Intelligence', breed.intelligence),
                        _buildRatingRow('Adaptability', breed.adaptability),
                        _buildRatingRow('Affection Level', breed.affectionLevel),
                        _buildRatingRow('Child Friendly', breed.childFriendly),
                        _buildRatingRow('Dog Friendly', breed.dogFriendly),
                        _buildRatingRow('Energy Level', breed.energyLevel),
                        _buildRatingRow('Grooming', breed.grooming),
                        _buildRatingRow('Health Issues', breed.healthIssues),
                        _buildRatingRow('Social Needs', breed.socialNeeds),
                        _buildRatingRow('Stranger Friendly', breed.strangerFriendly),
                        _buildRatingRow('Vocalization', breed.vocalisation),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Special characteristics
                  if (_hasSpecialCharacteristics())
                    _buildSection(
                      title: 'Special Characteristics',
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _buildSpecialCharacteristics(),
                      ),
                    ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    String imageUrl = '';
    
    if (breed.image?.url.isNotEmpty == true) {
      imageUrl = breed.image!.url;
    } else if (breed.referenceImageId?.isNotEmpty == true) {
      imageUrl = CatApiService.getImageUrl(breed.referenceImageId);
    }

    if (imageUrl.isEmpty) {
      return Container(
        color: Colors.grey[200],
        child: const Center(
          child: Icon(
            Icons.pets,
            size: 80,
            color: Colors.grey,
          ),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: const Center(
          child: Icon(
            Icons.pets,
            size: 80,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(String label, int rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  size: 18,
                  color: index < rating ? Colors.orange : Colors.grey[300],
                );
              }),
            ),
          ),
          Text(
            '$rating/5',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  bool _hasSpecialCharacteristics() {
    return breed.hairless == 1 ||
           breed.natural == 1 ||
           breed.rare == 1 ||
           breed.rex == 1 ||
           breed.suppressedTail == 1 ||
           breed.shortLegs == 1 ||
           breed.hypoallergenic == 1 ||
           breed.experimental == 1;
  }

  List<Widget> _buildSpecialCharacteristics() {
    List<Widget> chips = [];
    
    if (breed.hairless == 1) {
      chips.add(_buildChip('Hairless', Colors.blue));
    }
    if (breed.natural == 1) {
      chips.add(_buildChip('Natural', Colors.green));
    }
    if (breed.rare == 1) {
      chips.add(_buildChip('Rare', Colors.red));
    }
    if (breed.rex == 1) {
      chips.add(_buildChip('Rex', Colors.purple));
    }
    if (breed.suppressedTail == 1) {
      chips.add(_buildChip('Short Tail', Colors.indigo));
    }
    if (breed.shortLegs == 1) {
      chips.add(_buildChip('Short Legs', Colors.teal));
    }
    if (breed.hypoallergenic == 1) {
      chips.add(_buildChip('Hypoallergenic', Colors.cyan));
    }
    if (breed.experimental == 1) {
      chips.add(_buildChip('Experimental', Colors.orange));
    }
    
    return chips;
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
} 