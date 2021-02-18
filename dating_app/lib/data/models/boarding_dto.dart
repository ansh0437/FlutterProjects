import '../../constants/assets.dart';

class BoardingDTO {
  String title;
  String description;
  String image;

  BoardingDTO({
    this.title,
    this.description,
    this.image,
  });

  static List<BoardingDTO> get list => [
        BoardingDTO(
          title: "Discover People",
          description: "Find like minded people to connect with",
          image: DaterImages.boarding,
        ),
        BoardingDTO(
          title: "Match with them",
          description:
              "See who you like and who likes you and connect with them",
          image: DaterImages.boarding,
        ),
        BoardingDTO(
          title: "Chat with them",
          description: "Chat with your favorite people who you connected with",
          image: DaterImages.boarding,
        ),
      ];

  @override
  String toString() =>
      'BoardingDTO(title: $title, description: $description, image: $image)';
}
