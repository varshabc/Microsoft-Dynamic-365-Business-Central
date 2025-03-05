pageextension 50133 ExtendWarehouseshipment extends "Warehouse Shipment"
{

    actions
    {
        addfirst(Processing)
        {
            action("Import Warehouse Shipment")
            {
                Caption = 'Import Warehouse Shipment';
                Tooltip = 'ImportWHShipment';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Outstr: OutStream;
                    Instr: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    whseheader: Record "Warehouse Shipment Header";
                    DialogText: Text;
                    Fromfile: Text;

                begin
                    DialogText := 'Uploadfile';
                    TempBlob.CreateInStream(Instr);
                    UploadIntoStream(DialogText, '', '', Fromfile, Instr);
                    XmlPort.Import(XmlPort::WHShipmentPort, Instr);
                    Message('Warehouse shipment is created');

                end;


            }
        }
    }


    var
        GlobalInteger: Integer;

}



