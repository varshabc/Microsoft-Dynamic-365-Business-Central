pageextension 50129 "SDH Purchase HeaderExt" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Vendor Details"; Rec."Vendor Details")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of SDH Demo Description';
            }
        }
    }
}