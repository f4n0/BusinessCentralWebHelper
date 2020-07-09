page 99983 "BWH Record Explorer"
{
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Record Explorer (BWH)';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; TabID)
                {
                    ApplicationArea = All;
                    TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
                    Caption = 'Table ID';

                    trigger OnValidate()
                    begin
                        ProcessRecord();
                    end;
                }
            }
            group(TableInspector)
            {
                usercontrol("BWH Table Inspector"; "BWH Table Inspector")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    page.Run(9599);
                end;
            }
        }
    }

    var
        TabID: Integer;

    local procedure ProcessRecord()
    var
        Field: Record Field;
        recref: RecordRef;
        jo: JsonObject;
        ja: JsonArray;
        tmpTxt: Text;
        fiRef: FieldRef;
        fieldList: Dictionary of [Integer, text];
        i: Integer;
    begin

        Field.SetRange(TableNo, TabID);
        Field.SetRange(Enabled, true);
        Field.SetRange(ObsoleteState, Field.ObsoleteState::No);
        if field.FindSet() then
            repeat
                fieldList.Add(Field."No.", Field.FieldName);
            until Field.Next() = 0;
        CurrPage."BWH Table Inspector".ClearTable();
        recref.Open(TabID);
        Clear(ja);
        i := 0;
        if recref.FindSet() then
            repeat
                i += 1;
                Clear(jo);
                ja.Add(fctSerializeRecord(recref));
                if (i mod 10) = 0 then begin
                    tmpTxt := '';
                    ja.WriteTo(tmpTxt);
                    CurrPage."BWH Table Inspector".SetData(tmpTxt);
                    Clear(ja);
                end;
            until recref.Next() = 0;
        tmpTxt := '';
        ja.WriteTo(tmpTxt);
        CurrPage."BWH Table Inspector".SetData(tmpTxt);
    end;



    local procedure fctSerializeRecord(prrRecordRef: RecordRef): JsonObject
    var
        lintFieldCount: Integer;
        lintCounter: Integer;
        lJsonObj: JsonObject;
        ltxtKey: text;
        ltxtValue: text;
    begin
        lintFieldCount := prrRecordRef.FieldCount();
        for lintCounter := 1 to lintFieldCount do begin
            ltxtKey := Format(prrRecordRef.FieldIndex(lintCounter).Name());
            ltxtValue := Format(prrRecordRef.FieldIndex(lintCounter).Value());
            lJsonObj.Add(ltxtKey, ltxtValue);
        end;

        exit(lJsonObj);

    end;
}