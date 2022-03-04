@EndUserText.label: 'Vas Processing time'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZCDS_VAS_PROCTM1
  provider contract transactional_query
  as projection on ZISD_VAS_PROCTM
{
  key Werks,
  key FshVasSer,
  key FshVasSubSer,
      VasProcTime,
      CrtnVasFl
}
