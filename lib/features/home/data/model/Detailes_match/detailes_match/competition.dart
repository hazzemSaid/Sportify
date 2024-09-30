import 'package:equatable/equatable.dart';

class Competition extends Equatable {
  final int? id;
  final String? name;
  final String? code;
  final String? type;
  final String? emblem;

  const Competition({
    this.id,
    this.name,
    this.code,
    this.type,
    this.emblem,
  });

  factory Competition.fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
      Map<String, dynamic> json) {
    return Competition(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      type: json['type'] as String?,
      emblem: json['emblem'] as String?,
    );
  }

  Map<String, dynamic>
      toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type,
      'emblem': emblem,
    };
  }

  @override
  List<Object?> get props => [id, name, code, type, emblem];
}
