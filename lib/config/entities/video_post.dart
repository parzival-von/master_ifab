

class VideoPost {
  final String descriptio;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.descriptio,
    required this.videoUrl,
    this.likes=0,
    this.views=0,
  });

}