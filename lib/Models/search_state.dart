//Internal
import 'package:gh_search_app/Models/repository.dart';

class SearchState {
  final bool isLoading;
  final List<Repository> repositories;
  final String? errorMessage;
  SearchState({
    this.isLoading = false,
    this.repositories = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    bool? isLoading,
    List<Repository>? repositories,
    String? errorMessage,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      repositories: repositories ?? this.repositories,
      errorMessage: errorMessage ,
    );
  }
}
