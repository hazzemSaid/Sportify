import 'package:equatable/equatable.dart';

class Area extends Equatable {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;

  const Area({this.id, this.name, this.code, this.flag});

  factory Area.fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
      Map<String, dynamic> json) {
    return Area(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      flag: json['flag'] as String?,
    );
  }

  Map<String, dynamic>
      toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'flag': flag,
    };
  }

  @override
  List<Object?> get props => [id, name, code, flag];
}
