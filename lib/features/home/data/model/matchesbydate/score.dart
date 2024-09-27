import 'package:equatable/equatable.dart';

import 'full_time.dart';
import 'half_time.dart';

class Score extends Equatable {
  final dynamic winner;
  final String? duration;
  final FullTime? fullTime;
  final HalfTime? halfTime;

  const Score({this.winner, this.duration, this.fullTime, this.halfTime});

  factory Score.fromFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
      Map<String, dynamic> json) {
    return Score(
      winner: json['winner'] as dynamic,
      duration: json['duration'] as String?,
      fullTime: json['fullTime'] == null
          ? null
          : FullTime
              .fromFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
                  json['fullTime'] as Map<String, dynamic>),
      halfTime: json['halfTime'] == null
          ? null
          : HalfTime
              .fromFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(
                  json['halfTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic>
      toFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees() {
    return {
      'winner': winner,
      'duration': duration,
      'fullTime': fullTime
          ?.toFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(),
      'halfTime': halfTime
          ?.toFiltersDateFrom20240928DateTo20240929PermissionTierOneCompetitionsPlResultSetCount7CompetitionsPlFirst20240928Last20240928Played0MatchesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497467UtcDate20240928T113000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId67NameNewcastleUnitedFcShortNameNewcastleTlaNewCrestHttpsCrestsFootballDataOrg67PngAwayTeamId65NameManchesterCityFcShortNameManCityTlaMciCrestHttpsCrestsFootballDataOrg65PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497462UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId402NameBrentfordFcShortNameBrentfordTlaBreCrestHttpsCrestsFootballDataOrg402PngAwayTeamId563NameWestHamUnitedFcShortNameWestHamTlaWhuCrestHttpsCrestsFootballDataOrg563PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497461UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId57NameArsenalFcShortNameArsenalTlaArsCrestHttpsCrestsFootballDataOrg57PngAwayTeamId338NameLeicesterCityFcShortNameLeicesterCityTlaLeiCrestHttpsCrestsFootballDataOrg338PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497463UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId61NameChelseaFcShortNameChelseaTlaCheCrestHttpsCrestsFootballDataOrg61PngAwayTeamId397NameBrightonHoveAlbionFcShortNameBrightonHoveTlaBhaCrestHttpsCrestsFootballDataOrg397PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497468UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240923T013204ZHomeTeamId351NameNottinghamForestFcShortNameNottinghamTlaNotCrestHttpsCrestsFootballDataOrg351PngAwayTeamId63NameFulhamFcShortNameFulhamTlaFulCrestHttpsCrestsFootballDataOrg63PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497464UtcDate20240928T140000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240922T013206ZHomeTeamId62NameEvertonFcShortNameEvertonTlaEveCrestHttpsCrestsFootballDataOrg62PngAwayTeamId354NameCrystalPalaceFcShortNameCrystalPalaceTlaCryCrestHttpsCrestsFootballDataOrg354PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsRefereesAreaId2072NameEnglandCodeEngFlagHttpsCrestsFootballDataOrg770SvgCompetitionId2021NamePremierLeagueCodePlTypeLeagueEmblemHttpsCrestsFootballDataOrgPlPngSeasonId2287StartDate20240816EndDate20250525CurrentMatchday6WinnerNullId497469UtcDate20240928T163000ZStatusTimedMatchday6StageRegularSeasonGroupNullLastUpdated20240926T102056ZHomeTeamId76NameWolverhamptonWanderersFcShortNameWolverhamptonTlaWolCrestHttpsCrestsFootballDataOrg76PngAwayTeamId64NameLiverpoolFcShortNameLiverpoolTlaLivCrestHttpsCrestsFootballDataOrg64PngScoreWinnerNullDurationRegularFullTimeHomeNullAwayNullHalfTimeHomeNullAwayNullOddsMsgActivateOddsPackageInUserPanelToRetrieveOddsReferees(),
    };
  }

  @override
  List<Object?> get props => [winner, duration, fullTime, halfTime];
}