tableextension 50121 "SDH Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; "Customer Details"; text[250])
        {
            Caption = 'Customer Details';
            DataClassification = CustomerContent;
        }
    }


    var
        myInt: Integer;
}