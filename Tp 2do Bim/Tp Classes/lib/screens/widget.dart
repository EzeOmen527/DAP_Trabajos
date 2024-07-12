import 'package:flutter/material.dart';
import '../entities/historygames.dart';
//

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.teams,
    this.onTap,
  });

  final HistoryGames teams;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: teams.portada != null
            ? _getPoster(teams.portada!)
            : const Icon(Icons.sports_football_outlined),
        title: Text(teams.name),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => onTap?.call(),
      ),
    );
  }

  Widget _getPoster(String posterUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(posterUrl),
    );
  }
}