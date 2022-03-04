@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vas Processing time'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZISD_VAS_PROCTM
  as select from ztsd_vas_proctm
{
  key werks                             as Werks,
  key fsh_vas_ser                       as FshVasSer,
  key fsh_vas_sub_ser                   as FshVasSubSer,
      vas_proc_time                     as VasProcTime,
      cast(crtn_vas_fl as abap_boolean) as CrtnVasFl
}
