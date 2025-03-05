tableextension 50129 "SDH Purchase HeaderExtension" extends "Purchase Header"
{
    fields
    {
        field(50000; "Vendor Details"; Text[250])
        {
            Caption = 'Vendor Details';
        }
    }


    var
        myInt: Integer;
}