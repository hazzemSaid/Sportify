import 'package:equatable/equatable.dart';

import 'full_time.dart';
import 'half_time.dart';

class Score extends Equatable {
  final dynamic winner;
  final String? duration;
  final FullTime? fullTime;
  final HalfTime? halfTime;

  const Score({this.winner, this.duration, this.fullTime, this.halfTime});

  factory Score.fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
      Map<String, dynamic> json) {
    return Score(
      winner: json['winner'] as dynamic,
      duration: json['duration'] as String?,
      fullTime: json['fullTime'] == null
          ? null
          : FullTime
              .fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
                  json['fullTime'] as Map<String, dynamic>),
      halfTime: json['halfTime'] == null
          ? null
          : HalfTime
              .fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
                  json['halfTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic>
      toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees() {
    return {
      'winner': winner,
      'duration': duration,
      'fullTime': fullTime
          ?.toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(),
      'halfTime': halfTime
          ?.toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(),
    };
  }

  @override
  List<Object?> get props => [winner, duration, fullTime, halfTime];
}
