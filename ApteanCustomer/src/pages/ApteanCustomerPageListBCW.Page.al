page 50114 ApteanCustomerPageListBCW
{
    Caption = 'ApteanCustomerPageListBCW';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = ApteanCustomerTableBCW;
    CardPageId = ApteanCustomerPageCardBCW;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CustomerNumber; rec.CustomerNumber)
                {
                    Caption = 'CustomerNumber';
                }
                field(CustomerName; rec.CustomerName)
                {
                    Caption = 'CustomerName';
                }
                field(CustomerEmail; rec.CustomerEmail)
                {
                    Caption = 'CustomerEmail';
                }
                field(CustomerAddress; rec.CustomerAddress)
                {
                    Caption = 'CustomerAddress';
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Test)
            {
                ApplicationArea = All;
                ToolTip = 'Test';
                Image = TestDatabase;

                trigger OnAction();
                var
                    CustomerCodeunitBCW: Codeunit "CustomerCodeunitBCW";
                    Customer: Record "ApteanCustomerTableBCW";
                begin
                    // Customer.Get(20000);
                    // CustomerCodeunitBCW.GetCustomerDetailsInternal(Customer);
                    // Customer.Reset();

                    // Customer.SetRange(CustomerNumber,10000);
                    Customer.FindSet();
                    repeat
                        if Rec.Get(Customer.CustomerNumber) then
                            CustomerCodeunitBCW.GetCustomerDetailsInternal(Customer);
                    until Customer.Next = 0;

                end;
            }
        }
    }
}