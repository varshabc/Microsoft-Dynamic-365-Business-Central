table 50119 JustfoodCustomerTableBCW
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CustomerNumber; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = ApteanCustomerTableBCW.CustomerNumber;
        }
        field(2; LineNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; PhoneNumber; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Location; text[50])
        {

        }

    }

    keys
    {
        key(PK; CustomerNumber, LineNo)
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