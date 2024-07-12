import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp1_screens/core/data.dart';
import 'package:tp1_screens/entities/historygames.dart';
import 'package:tp1_screens/screens/details.dart';
import 'package:tp1_screens/screens/widget.dart';

class Teamsscreen extends StatelessWidget {
  static const String name = 'teams_screen';
  final List<HistoryGames> teams = teamsList;

  Teamsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Germany teams'),
      ),
      body: const _Teamsview(),
    );
  }
}

class _Teamsview extends StatelessWidget {
  // ignore: unused_element
  const _Teamsview ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teamsList.length,
      itemBuilder: (context, index) {
        final team = teamsList[index];
        return MovieItem(
          teams: team,
          onTap: () => _goToteamsDetails(context, team),
        );
      },
    );
  }

  void _goToteamsDetails(BuildContext context, HistoryGames teams) {
    context.pushNamed(
      TeamsDetailScreen.name,
      pathParameters: {
        'teamsId': teams.number,
      },
    );
  }

}