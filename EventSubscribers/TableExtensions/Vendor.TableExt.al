tableextension 50127 "SDH VendorExtension" extends "Vendor"
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