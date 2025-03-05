table 50118 ApteanCustomerTableBCW
{
    DataClassification = ToBeClassified;
    DrillDownPageID = "Customer List";
    LookupPageID = "Customer Lookup";

    fields
    {
        field(1; CustomerNumber; Code[20])
        {
            Caption = 'CustomerNumber';
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }

        field(2; CustomerName; Text[20])
        {
            Caption = 'CustomerName';
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                Customer: Record Customer;
            begin
                if Page.RunModal(Page::"Customer List", Customer) = Action::LookupOK then
                    CustomerName := Customer.Name;
            end;
        }

        field(3; CustomerEmail; Text[50])
        {
            Caption = 'CustomerEmail';
            DataClassification = ToBeClassified;

        }
        
        field(4; CustomerAddress; Text[50])
        {
            Caption = 'CustomerAddress';
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(PK; CustomerNumber)
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