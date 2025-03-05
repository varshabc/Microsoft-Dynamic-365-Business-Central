codeunit 50100 CustomerCodeunitBCW
{
    Access = Internal;

    trigger OnRun()
    var
       JustfoodCustomerTableBCW : record JustfoodCustomerTableBCW;
    begin
            
    end;

    procedure GetCustomerDetails(Customer: Record "ApteanCustomerTableBCW")
    begin
        Message('Gloal');
        GetCustomerDetailsLocal(Customer);
    end;

    local procedure GetCustomerDetailsLocal(var Customer: Record "ApteanCustomerTableBCW")
    begin
        Message('local');
        GetCustomerDetailsInternal(Customer);
    end;

    internal procedure GetCustomerDetailsInternal(var Customer: Record "ApteanCustomerTableBCW")
    begin
        Message('Iternal');
    end;

 procedure getData()
var
Apt1 : record 50118;
begin

end;


}