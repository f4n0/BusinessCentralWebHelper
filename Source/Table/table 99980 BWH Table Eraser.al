table 99980 "BWH Table Eraser"
{

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Table ID"; Integer)
        {
            TableRelation = AllObjWithCaption."Object ID";
            DataClassification = SystemMetadata;
        }
        field(3; "Table Name"; Text[200])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object ID" = field("Table ID")));
        }
        field(4; "Filter"; Integer)
        {
            TableRelation = "BWH Table Eraser Filter"."For Table PKey";
            DataClassification = SystemMetadata;
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}