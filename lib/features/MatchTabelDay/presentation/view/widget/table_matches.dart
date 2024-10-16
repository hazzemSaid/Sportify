import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/widget/match_details.dart';
import 'package:sportify/features/MatchTabelDay/presentation/viewmodel/matchbydate_cubit.dart';

class TableMatches extends StatefulWidget {
  const TableMatches(
      {super.key,
      required this.leagueName,
      required this.logoLeague,
      required this.date});

  final String leagueName;
  final String logoLeague;
  final String date;
  @override
  State<TableMatches> createState() => _TableMatchesState();
}

class _TableMatchesState extends State<TableMatches> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MatchbydateCubit>(context).getMatchesbyDate(
      dateFrom: widget.date,
      dateTo: widget.date,
    );
  }

  bool isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchbydateCubit, MatchbydateState>(
      builder: (context, state) {
        if (state is MatchbydateError) {
          return const Center(
            child: Text('An error occurred'),
          );
        }
        if (state is MatchbydateLoaded) {
          return Column(
            children: [
              GestureDetector(
                onTap: _toggleExpansion,
                child: _buildLeagueHeader(),
              ),
              if (isExpanded)
                MatchDetailsWidget(
                  leagueName: widget.leagueName,
                  matches: state.matches['matches'],
                ),
            ],
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeagueHeader() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: isExpanded
            ? const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              )
            : const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Image.asset(widget.logoLeague, height: 30, width: 30),
            const SizedBox(width: 5),
            Text(
              widget.leagueName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
