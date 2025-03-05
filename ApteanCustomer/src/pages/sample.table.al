table 50128 SalesLine
{
    DataClassification = ToBeClassified;
    Caption = 'Sales Line';

    fields
    {
        field(1; DocumnentType; Enum "Sales Document Type")
        {
            DataClassification = ToBeClassified;

        }

        field(2; "Sell-to-cutsomer-no"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Document no"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(5; Type; Enum "Sales Line Type1")
        {
            Caption = 'Sales Line Type';
        }
    }

    keys
    {
        key(Key1; DocumnentType)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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