page 99981 "BWH Table Eraser Filter"
{

    Caption = 'Table Eraser Filter';
    PageType = ListPart;
    SourceTable = "BWH Table Eraser Filter";
    UsageCategory = none;
    PopulateAllFields = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Field No."; Rec."Field No.")
                {
                    ApplicationArea = All;
                }
                field("Field Name"; Rec."Field Name")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        Field: Record Field;
                        FieldSelection: Codeunit "Field Selection";
                    begin
                        Field.SetRange(TableNo, Rec."Table ID");
                        if FieldSelection.Open(Field) then
                            Rec.Validate("Field No.", Field."No.");

                        CurrPage.Update();
                    end;
                }
                field(Filter; Rec.Filter)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
