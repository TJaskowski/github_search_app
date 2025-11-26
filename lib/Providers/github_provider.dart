//External
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Internal
import 'package:gh_search_app/API/github_api.dart';

final githubApiProvider = Provider((ref) => GithubApi());
