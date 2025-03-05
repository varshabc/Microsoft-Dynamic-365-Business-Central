table 50144 HistoryUpdate
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Enum "Sales Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; UserID; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Date and Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

}