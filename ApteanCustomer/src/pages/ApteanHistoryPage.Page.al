page 50113 ApteanHistoryPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ApteanHistoryTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerNumber; Rec.CustomerNumber)
                {
                    ApplicationArea = All;
                }

                field("Date and Time"; Rec."Date and Time")
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

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}