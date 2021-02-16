class RuleDTO {
  String title;
  String description;

  RuleDTO({
    this.title,
    this.description,
  });

  @override
  String toString() => 'RuleDTO(title: $title, description: $description)';
}
