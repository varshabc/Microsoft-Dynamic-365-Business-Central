tableextension 50125 "SDH Sales Shipment" extends "Sales Shipment Header"
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