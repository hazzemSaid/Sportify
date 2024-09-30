import 'package:equatable/equatable.dart';

class AwayTeam extends Equatable {
  final int? id;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crest;

  const AwayTeam({
    this.id,
    this.name,
    this.shortName,
    this.tla,
    this.crest,
  });

  factory AwayTeam.fromAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
      Map<String, dynamic> json) {
    return AwayTeam(
      id: json['id'] as int?,
      name: json['name'] as String?,
      shortName: json['shortName'] as String?,
      tla: json['tla'] as String?,
      crest: json['crest'] as String?,
    );
  }

  Map<String, dynamic>
      toAreaId2114NameItalyCodeItaFlagHttpsCrestsFootballDataOrg784SvgCompetitionId2019NameSerieACodeSaTypeLeagueEmblemHttpsCrestsFootballDataOrgSaPngSeasonId2310StartDate20240818EndDate20250525CurrentMatchday6WinnerNullId503099UtcDate20240930T184500ZStatusTimedVenueNullMatchday6StageRegularSeasonGroupNullLastUpdated20240930T013200ZHomeTeamId112NameParmaCalcio1913ShortNameParmaTlaParCrestHttpsCrestsFootballDataOrg112PngAwayTeamId104NameCagliariCalcioShortNameCagliariTlaCagCrestHttpsCrestsFootballDataOrg104PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
    };
  }

  @override
  List<Object?> get props => [id, name, shortName, tla, crest];
}
