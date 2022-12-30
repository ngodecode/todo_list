class Task {
  final int? id;
  final String title;
  final bool? isCompleted;

  const Task({
    this.id,
    required this.title,
    this.isCompleted,
  });

  Task copyWith({
    int? id,
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
