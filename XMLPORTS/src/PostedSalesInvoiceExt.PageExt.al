pageextension 50134 ExtendPostedSalesInvoice extends "Posted Sales Invoice"
{
    actions
    {
        addlast(processing)
        {
            action(Export)
            {
                Caption = 'Export';
                Image = Export;
                ApplicationArea = all;
                trigger OnAction()
                var
                    Instr: InStream;
                    OutStr: OutStream;
                    TempBlob: Codeunit "Temp Blob";
                    dialogTitle: Text;
                    ToFile: Text;
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                   dialogTitle := 'export Posted Sales Invoice';
                    TempBlob.CreateOutStream(OutStr);
                    SalesInvHeader.SetRange("No.", Rec."No.");
                    XmlPort.Export(50133, OutStr, "SalesInvHeader");
                    TempBlob.CreateInStream(Instr);
                    DownloadFromStream(Instr, dialogTitle, '', '', ToFile);

                end;


            }
        }
    }
}