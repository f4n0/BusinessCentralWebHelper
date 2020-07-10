pageextension 99980 "BWH PageExt99980" extends "Report Layout Selection" //9652
{
    actions
    {
        addlast(processing)
        {
            action("BWH Export Dataset")
            {
                Caption = 'Export Dataset';
                ApplicationArea = All;
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                    reportParameters, filename : text;
                    OutStr: OutStream;
                    is: InStream;
                begin
                    reportParameters := Report.RunRequestPage(Rec."Report ID");
                    TempBlob.CreateOutStream(OutStr);
                    Report.SaveAs(Rec."Report ID", reportParameters, ReportFormat::Xml, OutStr);
                    TempBlob.CreateInStream(is);
                    filename := rec."Report Name" + '.xml';
                    DownloadFromStream(is, 'Data Set', '', 'XML-File | *.xml', filename)
                end;
            }
        }
    }
}