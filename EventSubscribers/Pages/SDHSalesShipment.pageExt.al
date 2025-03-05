pageextension 50127 "SDH Sales Shipment" extends "Posted Sales Shipment"
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
  