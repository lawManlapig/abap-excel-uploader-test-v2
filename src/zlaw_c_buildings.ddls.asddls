@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Buildings Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{
  typeName: 'Building',
  typeNamePlural: 'Buildings',
  typeImageUrl: 'sap-icon://building',
  title: {
    type: #STANDARD,
    value: 'BuildingName'
  },
  description.value: 'BuildingId'
}
define root view entity ZLAW_C_Buildings
  provider contract transactional_query
  as projection on ZLAW_I_Buildings
{
      @UI.facet: [{ id: 'Building',
              purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
              label: 'Building',
              position: 10
            }, {
              id: 'addr',position:20,
              type: #FIELDGROUP_REFERENCE,
              targetQualifier: 'Address',
              label:'Address'
            }, {
              id:'log',position:30,
              type: #FIELDGROUP_REFERENCE,
              targetQualifier: 'ChangeLog',
              label:'Change Log'
            }]

      @UI: { lineItem: [{ position: 10 }],
      identification: [{ position: 10 }],
      selectionField: [{ position: 10 }] }
      @EndUserText.label: 'Building ID'
  key BuildingId,
      @UI: { lineItem: [{ position: 20 }],
      identification: [{ position: 20 }],
      selectionField: [{ position: 20 }] }
      @EndUserText.label: 'Building Name'
      BuildingName,
      @UI: { lineItem: [{ position: 30 }],
      identification: [{ position: 30 }] }
      @EndUserText.label: 'Number of rooms'
      NRooms,

      @UI.fieldGroup: [{ qualifier: 'Address', position: 10, label: 'Address Line' }]
      AddressLine,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 20, label: 'City' }]
      City,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 30, label: 'State' }]
      State,
      @UI.fieldGroup: [{ qualifier: 'Address', position: 40, label: 'Country' }]
      Country,

      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 10, label: 'Created By' }]
      CreatedBy,
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 20, label: 'Created At' }]
      CreatedAt,
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 30, label: 'Last Changed By' }]
      LastChangedBy,
      @UI.fieldGroup: [{ qualifier: 'ChangeLog', position: 40, label: 'Last Changed At'}]
      LastChangedAt,

      @UI.hidden: true
      ExcelRowNumber
}
