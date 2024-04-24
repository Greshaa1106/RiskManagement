/*using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'prio_code',
            Value : prio_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'descr',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'impact',
            Value : impact,
        },
    ],
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};*/
using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI: {
        HeaderInfo  : {
            TypeName : 'Risk',
            TypeNamePlural : 'Risks',
            Title: {
                $Type:'UI.DataField',
                Value: title
            },
            Description: {
                $Type:'UI.DataField',
                Value: descr
            }
        },
        SelectionFields : [prio_code],
        Identification  : [{ Value: title}],
        LineItem  : [
            { Value: title},
            {Value: miti_ID},
            {Value: owner},
            {
                Value: prio_code,
                Criticality: criticality
            },
            {
                Value: impact,
                Criticality: criticality
            },
            
        ],
            
    });
            
   annotate RiskService.Risks with @(UI :{
    Facets:[{
        $Type:'UI.ReferenceFacet',
        Label:'Main',
        Target: '@UI.FieldGroup#Main',
    }],
    FieldGroup #Main : {Data:[
        {Value: miti_ID},
        {Value:owner},
        {Value:bp_BusinessPartner},
        {
                Value: prio_code,
                Criticality: criticality
            },
            {
                Value: impact,
                Criticality: criticality
            }
    ]},
   });

