import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/features/MatchTabelDay/data/repo/matchtabelimpo.dart';

part 'matchbydate_state.dart';

class MatchbydateCubit extends Cubit<MatchbydateState> {
  final Matchtabelimpo matchtabelimpo;
  MatchbydateCubit({required this.matchtabelimpo})
      : super(MatchbydateInitial());

  Future<void> getMatchesbyDate({
    required String dateFrom,
    required String dateTo,
  }) async {
    print("in cubit");
    print(dateFrom);
    emit(MatchbydateLoading());

    final response = await matchtabelimpo.getMatchTabelDay(
        dateFrom: dateFrom, dateTo: dateTo);
    print(response.right);
    response.fold((failure) => emit(MatchbydateError(message: failure.message)),
        (matches) async => emit(MatchbydateLoaded(matches: await matches)));
  }
}
