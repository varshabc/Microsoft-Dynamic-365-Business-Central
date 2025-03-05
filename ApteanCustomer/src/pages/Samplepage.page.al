pageextension 50139 CustomerListExt1 extends "Customer List"
{
    trigger OnOpenPage()

    var
        EnumValues: Text;
        AllEnumValues: Text;

    begin
        AllEnumValues := '';
        foreach EnumValues in Enum::"Sales Line Type1".Names() do begin
            AllEnumValues += EnumValues + '\';
        end;

        if AllEnumValues <> '' then
            Message(AllEnumValues)
        else
            Message('No data found');
    end;

}