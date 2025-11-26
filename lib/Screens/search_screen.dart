//External
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Internal
import 'package:gh_search_app/Providers/search_provider.dart';
import 'package:gh_search_app/Widgets/custom_button.dart';
import 'package:gh_search_app/Widgets/custom_list_tile.dart';
import 'package:gh_search_app/Widgets/custom_text_field.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchRepositoriesNotifierProvider);
    final notifier = ref.read(searchRepositoriesNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 165, 202),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Find GitHub Repositories', style: TextStyle(
              shadows: [
                Shadow(
                        offset:  Offset(-1, -1),
                        blurRadius: 1,
                 color: Colors.white.withValues(alpha: 0.2),
            
                ),
                 Shadow(
                 color: Colors.black.withValues(alpha: 0.4),
                        offset: const Offset(1, 1),
                        blurRadius: 1,
                ),
              ],
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 118, 165, 202),
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              hintText: 'Search Repositories',
              controller: _controller,
              color: const Color.fromARGB(255, 118, 165, 202),
              onSubmitted: (query) => notifier.searchRepositories(query),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(onPressed: () {
                notifier.searchRepositories(_controller.text);
              }, 
              color: const Color.fromARGB(255, 118, 165, 202),
              child: const Text('Search')),
          ),
          
          if (state.isLoading) const CircularProgressIndicator(
            color: Color.fromARGB(255, 44, 124, 221),
          ),
          if (state.errorMessage != null) Text('Error: ${state.errorMessage}'),
          Expanded(
            child: ListView.builder(
              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
                final repo = state.repositories[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomListTile(
                    color: const Color.fromARGB(255, 118, 165, 202),
                    title: Text(repo.name),
                    subtitle: Text(repo.owner),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail', arguments: repo);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
