table 99981 "BWH Table Eraser Filter"
{
    fields
    {
        field(1; "For Table PKey"; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Field No."; Integer)
        {
            TableRelation = Field."No." where(TableNo = field("Table ID"));
            DataClassification = SystemMetadata;
        }
        field(3; "Field Name"; text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Field.FieldName where(TableNo = field("Table ID"), "No." = field("Field No.")));

        }
        field(4; "Filter"; Text[1024])
        {
            DataClassification = SystemMetadata;
        }
        field(5; "Table ID"; Integer)
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Field No.", "For Table PKey")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

}