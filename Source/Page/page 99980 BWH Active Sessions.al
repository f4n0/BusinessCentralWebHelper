page 99980 "BWH Active Sessions"
{
    Caption = 'Active Sessions (BWH)';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Active Session";
    Permissions = tabledata "Active Session" = rmid;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Rpt1)
            {
                field("Current Session"; (Rec."Session ID" = SessionId()))
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("User SID"; Rec."User SID")
                {
                    ApplicationArea = All;
                }
                field("Session ID"; Rec."Session ID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance Name"; Rec."Server Instance Name")
                {
                    ApplicationArea = All;
                }
                field("Client Computer Name"; Rec."Client Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = All;
                }
                field("Login Datetime"; Rec."Login Datetime")
                {
                    ApplicationArea = All;
                }
                field("Server Computer Name"; Rec."Server Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Server Instance ID"; Rec."Server Instance ID")
                {
                    ApplicationArea = All;
                }
                field("Session Unique ID"; Rec."Session Unique ID")
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
                    ActiveSession: Record "Active Session";
                    Continue: Label 'Are you sure to kill: %1 ?';
                    Killer: Label 'Your session has been killed by: %1';

                begin
                    if not Confirm(StrSubstNo(Continue, Rec."User ID"), true) then exit;

                    if not StopSession(Rec."Session ID", StrSubstNo(Killer, UserId())) then begin
                        Rec.Delete(true);
                    end;
                end;
            }
        }
    }


}