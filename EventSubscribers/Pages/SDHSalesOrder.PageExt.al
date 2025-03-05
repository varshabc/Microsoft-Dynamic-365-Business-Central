pageextension 50124 "SDH Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Customer Details";Rec."Customer Details")
            {
                ApplicationArea=all;
                ToolTip='Specifies the value of SDH Demo Description';
            }
        }
    }
}
    
    
    
   