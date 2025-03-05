page 50118 JustfoodCustomerBCW
{
    Caption = 'JustfoodCustomer';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = JustfoodCustomerTableBCW;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(CustomerNumber; Rec.CustomerNumber)
                {
                    ApplicationArea = All;
                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;
                }
                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ApplicationArea = All;
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}