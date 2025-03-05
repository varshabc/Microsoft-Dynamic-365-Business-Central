pageextension 50144 SalesOrderExt extends "Sales Order"
{

    actions
    {
        addafter(PageInteractionLogEntries)
        {
            action(UpdateHistory)
            {
                ApplicationArea = All;
                Caption = 'Update History';
                RunObject = Page "HistoryUpdate";
                RunPageLink = "Document No" = field("No."), "Document Type" = field("Document Type");

                trigger OnAction()
                var
                begin
                    if HistoryUpdateTable.FindLast() then
                        HistoryUpdateTable."Entry No" += 1
                    else
                        HistoryUpdateTable."Entry No" := 1;

                    HistoryUpdateTable.UserID := UserId;
                    HistoryUpdateTable."Date and Time" := CurrentDateTime;
                    HistoryUpdateTable."Document Type" := rec."Document Type";
                    HistoryUpdateTable."Document No" := rec."No.";
                    HistoryUpdateTable.Insert();
                end;
            }
        }
    }

    var
        HistoryUpdateTable: Record HistoryUpdate;

}