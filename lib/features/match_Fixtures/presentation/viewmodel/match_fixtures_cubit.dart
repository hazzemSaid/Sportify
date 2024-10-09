import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'match_fixtures_state.dart';

class MatchFixturesCubit extends Cubit<MatchFixturesState> {
  MatchFixturesCubit() : super(MatchFixturesInitial());
}
