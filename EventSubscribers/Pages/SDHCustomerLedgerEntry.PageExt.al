pageextension 50125 "SDH Customer Ledger Entry" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Details"; Rec."Customer Details")
            {
                ApplicationArea=all;
                ToolTip='Specifies the value of SDH Demo Description';
            }
        }
    }
}

    
  