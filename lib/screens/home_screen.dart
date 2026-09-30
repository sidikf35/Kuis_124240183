import 'package:flutter/material.dart';
import '../data/pokemon.dart';
import '../models/pokemon.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final Pokemon pokemon = pokemonList[index];
        return _buildPokemonItem(context, pokemon);
      },
    );
  }

  Widget _buildPokemonItem(BuildContext context, Pokemon pokemon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(pokemon: pokemon),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Row(
              children: [
                // Gambar Pokemon
                Hero(
                  tag: 'pokemon_${pokemon.id}',
                  child: Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      pokemon.image,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.pets,
                          color: Colors.red,
                          size: 32,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Nama & Types Pokemon
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama Pokemon
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Types Pokemon
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: pokemon.types.map((type) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 0.8,
                              ),
                            ),
                            child: Text(
                              type,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                // Icon Info / Arrow di sebelah kanan
                Icon(
                  Icons.info_outline,
                  color: Colors.grey.shade400,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
