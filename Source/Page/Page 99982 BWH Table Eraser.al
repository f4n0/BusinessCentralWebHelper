page 99982 "BWH Table Eraser"
{

    ApplicationArea = All;
    Caption = 'Table Eraser (BWH)';
    PageType = List;
    SourceTable = "BWH Table Eraser";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(tables)
            {
                repeater(General)
                {
                    field("Table ID"; "Table ID")
                    {
                        ApplicationArea = All;
                    }
                    field("Table Name"; "Table Name")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(fields)
            {
                part("BWH Table Eraser Filte"; "BWH Table Eraser Filter")
                {
                    ApplicationArea = all;
                    SubPageLink = "For Table PKey" = field("Primary Key"), "Table ID" = field("Table ID");
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Delete Selected")
            {
                ApplicationArea = All;
                Caption = 'Delete Selected';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Delete;

                trigger OnAction()
                var
                    BWHTableEraserFilter: Record "BWH Table Eraser Filter";
                    recref: RecordRef;
                    deleteLbl: Label 'Do you want delete records for table: %1?';
                begin
                    BWHTableEraserFilter.SetRange("For Table PKey", "Primary Key");
                    Clear(recref);
                    recref.Open("Table ID");
                    if BWHTableEraserFilter.FindSet() then
                        repeat
                            recref.Field(BWHTableEraserFilter."Field No.").SetFilter(BWHTableEraserFilter.Filter);
                        until BWHTableEraserFilter.Next() = 0;
                    if Confirm(deleteLbl, true, "Table Name") then
                        recref.DeleteAll(true);
                end;
            }
        }
    }

}
