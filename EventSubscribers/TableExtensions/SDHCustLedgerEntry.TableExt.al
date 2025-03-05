tableextension 50123 "SDH Cust Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Customer Details"; Text[250])
        {
            Caption = 'Customer Details';
            DataClassification = CustomerContent;
        }
    }


    var
        myInt: Integer;
}