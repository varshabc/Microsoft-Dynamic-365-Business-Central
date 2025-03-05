pageextension 50122 PostedSalesInvoicePageExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Dispute Status")
        {
            field("Customer Details"; Rec."Customer Details")
            {
                ApplicationArea = All;
            }
        }
    }
}