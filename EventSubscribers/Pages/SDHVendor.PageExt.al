pageextension 50128 "SDH VendorExtension" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Vendor Details";Rec."Vendor Details")
            {
                ApplicationArea=all;
                ToolTip='Specifies the value of SDH Demo Description';
            }
        }
    }
}
  