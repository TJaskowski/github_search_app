//External
import 'package:flutter_riverpod/legacy.dart';
//Internal
import 'package:gh_search_app/API/github_api.dart';
import 'package:gh_search_app/Models/search_state.dart';


class SearchNotifier extends StateNotifier<SearchState> {
final GithubApi githubApi;

  SearchNotifier(this.githubApi) : super(SearchState());
  
  Future<void> searchRepositories(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(
        repositories: [],
      );
      return;
    }
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final res = await githubApi.searchRepositories( query);

      state = state.copyWith(
        isLoading: false,
        repositories: res,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
  }