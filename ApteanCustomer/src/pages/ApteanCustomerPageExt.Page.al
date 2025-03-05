pageextension 50113 ApteanCustomerPageExt extends ApteanCustomerPageCardBCW
{


    actions
    {
        addafter(Functions)
        {
            action("Update History")
            {
                ApplicationArea = all;
                caption = 'UpdateHistory';
                RunObject = page ApteanHistoryPage;
                RunPageLink = "CustomerNumber" = field("CustomerNumber");

                trigger OnAction()
                begin
                    if ApteanHistoryTable.FindLast() then
                        ApteanHistoryTable.LogNumber += 1
                    else
                        ApteanHistoryTable.LogNumber := 1;
                    ApteanHistoryTable.CustomerNumber := UserId;
                    ApteanHistoryTable."Date and Time" := CurrentDateTime;
                    ApteanHistoryTable.Insert()
                end;

            }
        }
    }

    var
        ApteanHistoryTable: Record "ApteanHistoryTable";
}