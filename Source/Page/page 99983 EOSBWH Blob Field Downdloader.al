page 99983 "EOSBWH Blob Field Downloader"
{
    PageType = Card;
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field("Table ID"; TableID)
            {
                TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Table));
                ApplicationArea = All;
            }
            field("Field No"; FieldNo)
            {
                Editable = false;
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    Field: Record Field;
                begin
                    Field.SetRange(TableNo, TableId);
                    Field.SetRange(Type, Field.Type::BLOB);
                    if page.RunModal(page::"Fields Lookup", Field) = Action::LookupOK then begin
                        FieldNo := Field."No.";
                        //CurrPage.Update(true);
                    end;
                end;
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action(Download)
            {
                ApplicationArea = All;
                Image = MoveDown;

                trigger OnAction();
                var
                    RecRef: RecordRef;
                    fiRef: FieldRef;
                    DocVariant: Variant;
                    filterPageBuilder: FilterPageBuilder;
                    TempBlob: Codeunit "Temp Blob";
                    filename: Text;
                    is: InStream;
                begin
                    RecRef.Open(TableId);
                    filterPageBuilder.AddRecordRef(RecRef.Name, RecRef);
                    filterPageBuilder.RunModal();
                    RecRef.SetView(filterPageBuilder.GetView(RecRef.Name, false));
                    RecRef.FindFirst();
                    TempBlob.FromRecordRef(RecRef, FieldNo);
                    TempBlob.CreateInStream(is);
                    filename := RecRef.Name + '  - ' + RecRef.Field(FieldNo).Name;
                    DownloadFromStream(is, '', '', '', filename);

                end;
            }
        }
    }

    var
        TableId: Integer;
        FieldNo: Integer;
}