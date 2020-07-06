page 99980 "BWH Active Sessions"
{
    Caption = 'Active Sessions (BWH)';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Active Session";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Rpt1)
            {
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                }
                field("User SID"; "User SID")
                {
                    ApplicationArea = All;
                }
                field("Session ID"; "Session ID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance Name"; "Server Instance Name")
                {
                    ApplicationArea = All;
                }
                field("Client Computer Name"; "Client Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Client Type"; "Client Type")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; "Database Name")
                {
                    ApplicationArea = All;
                }
                field("Login Datetime"; "Login Datetime")
                {
                    ApplicationArea = All;
                }
                field("Server Computer Name"; "Server Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Server Instance ID"; "Server Instance ID")
                {
                    ApplicationArea = All;
                }
                field("Session Unique ID"; "Session Unique ID")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Kill Session")
            {
                Image = Delete;
                ApplicationArea = all;
                PromotedIsBig = true;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;


                trigger OnAction()
                var
                    Continue: Label 'Are you sure to kill: %1 ?';
                    Killer: Label 'Your session has been killed by: %1';
                begin
                    if Confirm(StrSubstNo(Continue, "User ID"), true) then
                        StopSession("Session ID", StrSubstNo(Killer, UserId()))
                end;
            }
        }
    }

}