import 'model/modelartist.dart';

class PopularArtistsData {
  static List<ModelArtist> getPopularArtists() {
    return [
      ModelArtist(
        name: "English Premier League",
        imagePath: "assets/images/epl.png",
        genre: "Inggris",
      ),
      ModelArtist(
        name: "La liga",
        imagePath: "assets/images/laliga.png",
        genre: "Spanish",
      ),
      ModelArtist(
        name: "Serie A",
        imagePath: "assets/images/serieA.png",
        genre: "Italia",
      ),
      ModelArtist(
        name: "Ligue 1",
        imagePath: "assets/images/ligue1.png",
        genre: "France",
      ),
    ];
  }
}
