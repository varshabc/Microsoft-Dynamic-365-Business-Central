tableextension 50122 "SDH Customer" extends Customer
{
    fields
    {
        field(50000; "Customer Details"; Text[250])
        {
            Caption = 'Customer Details';
            DataClassification= CustomerContent;

        }
    }


    var
        myInt: Integer;
}