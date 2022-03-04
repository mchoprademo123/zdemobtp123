@AbapCatalog.sqlViewName: 'ZISDPLANTSTDVH'
@EndUserText.label: 'Plant Std VH'

@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 001
@ClientHandling.algorithm: #SESSION_VARIABLE
@AccessControl.authorizationCheck: #NOT_REQUIRED

@ObjectModel: {
    usageType: {
        sizeCategory: #S,
        serviceQuality: #A,
        dataClass:#CUSTOMIZING
    },
    dataCategory: #VALUE_HELP,
    representativeKey: 'Plant'
}

@Analytics.dataCategory: #DIMENSION
@Search.searchable: true

define view ZISD_PlantStdVH
  as select from zapfg_t001w
{
      @ObjectModel.text.element: ['PlantName']
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key plant       as Plant,
      @Semantics.text: true
      description as PlantName
}
