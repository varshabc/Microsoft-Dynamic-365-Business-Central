xmlport 50132 WHShipmentPort1
{
    Direction = Import;
    Encoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            textelement(whseShipmetHeader)
            {
                textelement(No)
                {

                }
                textelement(LocationCode)
                {

                }
                textelement(BinCode)
                {

                }
                textelement(ZoneCode)
                {

                }
                textelement(AssignedUserID)
                {

                }

                textelement(ShippingAgentCode)
                {

                }

                textelement(ShippingNo)
                {

                }

                trigger OnAfterAssignVariable()
                var
                begin
                    whseheader.Init();
                    whseheader."No." := No;
                    whseheader."Location Code" := LocationCode;
                    whseheader."Bin Code" := BinCode;
                    whseheader."Zone Code" := ZoneCode;
                    whseheader."Assigned User ID" := AssignedUserID;
                    whseheader."Shipping Agent Code" := ShippingAgentCode;
                    whseheader."Shipping No." := ShippingNo;
                    whseheader.Insert(true);

                end;
            }

            textelement(whseshipmentlines)
            {
                XmlName = 'WarehouseshipmentLine';

                MaxOccurs = Unbounded;
                MinOccurs = Zero;

                textelement(Noo)
                {

                }
                textelement(LineNo)
                {

                }
                textelement(SourceDocument)
                {

                }
                textelement(SourceNo)
                {

                }
                textelement(Description)
                {

                }
                textelement(ItemNo)
                {

                }
                textelement(Quantity)
                {

                }

                trigger OnAfterAssignVariable()
                var
                    Qty: Decimal;
                begin
                    LineNumber := LineNumber + 10000;
                    whseline.Init();
                    whseline."No." := Noo;
                    whseline."Line No." := LineNumber;
                    whseline."Source No." := SourceNo;
                    whseline."Description" := Description;
                    whseline."Item No." := ItemNo;
                    Evaluate(Qty, Quantity);
                    whseline.Quantity := Qty;
                    whseline."Source Document" := whseline."Source Document"::"Sales Order";
                    whseline.Insert();
                end;
            }

        }

    }
    var
        whseheader: Record "Warehouse Shipment Header";
        whseline: Record "Warehouse Shipment Line";
        LineNumber: Integer;
}



