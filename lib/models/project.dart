class Project {
  final String title; //ชื่อโครงการ
  final String description;
  final int target;
  int receiveAmount;
  final int duration;
  int donateCount;
  final String imageUrl;
  Project({
    required this.title,
    required this.description,
    required this.target,
    required this.receiveAmount,
    required this.duration,
    required this.donateCount,
    required this.imageUrl,
  });
}
