class HistoryGames {
  final String number;
  final String name;
  final String dev;
  final String restrinctedTo;
  final String? portada;
  final String desc;
//
  HistoryGames({
     required this.number,
    required this.name,
    required this.dev,
    required this.restrinctedTo,
    this.portada,
    required this.desc,
  });
}