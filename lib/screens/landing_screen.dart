import 'package:flutter/material.dart';
import '../models/cat_breed.dart';
import '../services/cat_api_service.dart';
import '../widgets/breed_card.dart';
import 'detail_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CatBreed> _breeds = [];
  List<CatBreed> _filteredBreeds = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadBreeds();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadBreeds() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      final breeds = await CatApiService.getBreeds(limit: 20);
      
      setState(() {
        _breeds = breeds;
        _filteredBreeds = breeds;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _filterBreeds(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBreeds = _breeds;
      } else {
        _filteredBreeds = _breeds
            .where((breed) =>
                breed.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Catbreeds',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _filterBreeds,
              decoration: InputDecoration(
                hintText: 'Search breed...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _filterBreeds('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),

          // Lista de razas
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      );
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
                         Text(
               'Error loading breeds',
               style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Colors.grey[700],
               ),
             ),
             const SizedBox(height: 8),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 32),
               child: Text(
                 _errorMessage,
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.grey[600],
                 ),
               ),
             ),
             const SizedBox(height: 16),
             ElevatedButton(
               onPressed: _loadBreeds,
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.orange,
                 foregroundColor: Colors.white,
               ),
               child: const Text('Retry'),
             ),
          ],
        ),
      );
    }

    if (_filteredBreeds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
                         Text(
               'No breeds found',
               style: TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
                 color: Colors.grey[700],
               ),
             ),
             const SizedBox(height: 8),
             Text(
               'Try with another search term',
               style: TextStyle(
                 fontSize: 14,
                 color: Colors.grey[600],
               ),
             ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadBreeds,
      color: Colors.orange,
      child: ListView.builder(
        itemCount: _filteredBreeds.length,
        itemBuilder: (context, index) {
          final breed = _filteredBreeds[index];
          return BreedCard(
            breed: breed,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(breed: breed),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 