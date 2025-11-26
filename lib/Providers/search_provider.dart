//External
import 'package:flutter_riverpod/legacy.dart';
//Internal
import 'package:gh_search_app/Models/search_state.dart';
import 'package:gh_search_app/Notifiers/search_notifier.dart';
import 'package:gh_search_app/Providers/github_provider.dart';

final searchRepositoriesNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
      final githubApi = ref.watch(githubApiProvider);
      return SearchNotifier(githubApi);
    });
