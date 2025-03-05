tableextension 50130 "SDH Purchase LineExtension" extends "Purchase Line"
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