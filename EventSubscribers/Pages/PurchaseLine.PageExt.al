pageextension 50131 "SDH Purchase LineExtension" extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Vendor Details"; Rec."Vendor Details")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of SDH Demo Description';
            }
        }
    }
}