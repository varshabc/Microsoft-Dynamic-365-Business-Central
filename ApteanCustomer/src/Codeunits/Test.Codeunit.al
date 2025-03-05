codeunit 50111 Test
{
    trigger OnRun()
    begin
        
    end;

    procedure Customertest()
    var
    Customer: Record Customer;
    begin
       Customer.Get(Customer."No.")
    end;

    local procedure CustomerAddressLocal()
    begin

    end;

    
    var
        myInt: Integer;
}