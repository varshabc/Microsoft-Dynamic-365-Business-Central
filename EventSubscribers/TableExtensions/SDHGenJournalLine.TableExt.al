tableextension 50128 "SDH Gen. Journal Line" extends "Gen. Journal Line"
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