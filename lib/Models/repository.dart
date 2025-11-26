class Repository {
  final String name;
  final String description;
  final String owner;
  final String url;

  Repository({
    required this.name,
    required this.description,
    required this.owner,
    required this.url,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'] as String,
      description: json['description'] as String? ?? 'No description',
      owner: json['owner']['login'] as String,
      url: json['html_url'] as String,
    );
  }
}
