pageextension 50126 "SDH Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Details"; Rec."Customer Details")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of SDH Demo Description';
            }
        }
    }
}