// xmlport 50131 WHShipmentPort
// {
//     Direction = Import;
//     Encoding = UTF8;
//     UseRequestPage = false;
//     Permissions = tabledata "Reservation Entry" = rm;

//     schema
//     {
//         textelement(Root)
//         {
//             textelement(whseShipmetHeader)
//             {
//                 textelement(No)
//                 {

//                 }
//                 textelement(LocationCode)
//                 {

//                 }
//                 /*  textelement(BinCode)
//                  {

//                  } */
//                 /* textelement(ZoneCode)
//                 {

//                 } */
//                 textelement(AssignedUserID)
//                 {

//                 }

//                 textelement(ShippingAgentCode)
//                 {

//                 }

//                 textelement(ShippingNo)
//                 {

//                 }

//                 trigger OnAfterAssignVariable()
//                 var
//                 begin
//                     whseheader.Init();
//                     whseheader."No." := No;
//                     whseheader."Location Code" := LocationCode;
//                     /* whseheader."Bin Code" := BinCode;
//                     whseheader."Zone Code" := ZoneCode; */
//                     whseheader."Assigned User ID" := AssignedUserID;
//                     whseheader."Shipping Agent Code" := ShippingAgentCode;
//                     whseheader."Shipping No." := ShippingNo;
//                     whseheader.Insert(true);
//                 end;
//             }

//             textelement(whseshipmentlines)
//             {
//                 XmlName = 'WarehouseshipmentLine';

//                 MaxOccurs = Unbounded;
//                 MinOccurs = Zero;

//                 textelement(Noo)
//                 {

//                 }
//                 textelement(LineNo)
//                 {

//                 }
//                 textelement(SourceDocument)
//                 {

//                 }
//                 textelement(SourceNo)
//                 {

//                 }
//                 textelement(Description)
//                 {

//                 }
//                 /* textelement(BinCode1)
//                 {

//                 } */
//                 textelement(ItemNo)
//                 {

//                 }
//                 textelement(Quantity)
//                 {

//                 }
//                 textelement(QtyOutstanding)
//                 {

//                 }
//                 textelement(ItemTrackingLine)
//                 {
//                     textelement(LotNo)
//                     {

//                     }
//                     textelement(SerialNo)
//                     {

//                     }
//                 }

//                 trigger OnAfterAssignVariable()
//                 var
//                     Qty: Decimal;
//                     QtyOutstanding1: Decimal;
//                 begin
//                     LineNumber := LineNumber + 10000;
//                     whseline.Init();
//                     whseline."No." := Noo;
//                     whseline."Line No." := LineNumber;
//                     whseline."Source No." := SourceNo;
//                     whseline."Description" := Description;
//                     //whseline."Bin Code" := BinCode1;
//                     whseline."Item No." := ItemNo;
//                     Evaluate(Qty, Quantity);
//                     // whseline.Quantity := Qty;
//                     whseline.Validate(Quantity, Qty);

//                     Evaluate(QtyOutstanding1, QtyOutstanding);
//                     whseline."Qty. Outstanding" := QtyOutstanding1;

//                     whseline."Source Document" := whseline."Source Document"::"Sales Order";
//                     whseline.Insert();

//                     UpdateItemTrackingLines();

//                 end;
//             }

//         }

//     }

//     local procedure UpdateItemTrackingLines()
//     begin
//         Isupdated := false;
//         LastEntryNo := 0;
//         whseline.reset();
//         whseline.SetRange("No.", whseheader."No.");
//         whseline.SetFilter(Quantity, '<>0');
//         if whseline.FindSet() then
//             repeat
//                 if ReservationEntryExist() then
//                     ModifyReservationEntry()
//                 else
//                     CreateReservationEntry();

//                 if LotInfoExist() then
//                     ModifyLotInfo()
//                 else
//                     CreateLotInfo();
//             until whseline.Next() = 0;

//         if Isupdated then
//             Message('item tracking lines are updated')
//         else
//             Message('item tracking lines are not updated');
//     end;

//     local procedure ReservationEntryExist(): Boolean
//     begin
//         ReservationEntry.Reset();
//         ReservationEntry.SetRange("Source Type", Database::"Warehouse Shipment Line");
//         ReservationEntry.SetRange("Source ID", whseline."No.");
//         ReservationEntry.SetRange("Source Ref. No.", whseline."Line No.");

//         if ReservationEntry.FindSet() then
//             exit(true)
//         else
//             exit(false);
//     end;



//     local procedure ModifyReservationEntry()
//     begin
//         ReservationEntry.Description := whseline.Description;
//         ReservationEntry.Validate("Quantity (Base)", whseline.Quantity);
//         ReservationEntry."Shipment Date" := whseline."Shipment Date";
//         ReservationEntry."Created By" := UserId;
//         ReservationEntry.Modify();
//         Isupdated := true;
//     end;

//     local procedure CreateReservationEntry()
//     begin
//         if not Item.Get(whseline."Item No.") then
//             exit;
//         Item.TestField("Item Tracking Code");
//         Item.TestField("Lot Nos.");

//         ReservationEntry.Init();
//         ReservationEntry."Entry No." := NextEntryNo();
//         ReservationEntry."Item No." := whseline."Item No.";
//         ReservationEntry.Description := whseline."Item No.";
//         ReservationEntry."Location Code" := whseline."Location Code";
//         ReservationEntry."Variant Code" := whseline."Variant Code";
//         ReservationEntry.Validate("Quantity (Base)", whseline.Quantity);
//         ReservationEntry."Reservation Status" := ReservationEntry."Reservation Status"::Surplus;
//         ReservationEntry."Source Type" := Database::"Warehouse Shipment Line";
//         ReservationEntry."Source ID" := whseline."No.";
//         ReservationEntry."Source Ref. No." := whseline."Line No.";
//         ReservationEntry."Shipment Date" := ReservationEntry."Shipment Date";
//         ReservationEntry."Qty. per Unit of Measure" := whseline."Qty. per Unit of Measure";
//         ReservationEntry.Validate("Lot No.", NoseriesMgt.GetNextNo(Item."Lot Nos.", WorkDate(), true));
//         ReservationEntry."Item Tracking" := ReservationEntry."Item Tracking"::"Lot No.";
//         ReservationEntry."Created By" := UserId;
//         ReservationEntry.Positive := true;
//         ReservationEntry."Creation Date" := WorkDate();
//         ReservationEntry.Insert();
//         IsUpdated := true;
//     end;


//     local procedure LotInfoExist(): Boolean
//     begin
//         if LotNoInfo.Get(ReservationEntry."Item No.", ReservationEntry."Variant Code", ReservationEntry."Lot No.") then
//             exit(true);
//         exit(false);
//     end;


//     local procedure ModifyLotInfo()
//     begin
//         LotNoInfo.Description := ReservationEntry.Description;
//         LotNoInfo.Modify();
//         IsUpdated := true;
//     end;


//     local procedure CreateLotInfo()
//     begin
//         LotNoInfo.Init();
//         LotNoInfo."Item No." := ReservationEntry."Item No.";
//         LotNoInfo."Variant Code" := ReservationEntry."Variant Code";
//         LotNoInfo."Lot No." := ReservationEntry."Lot No.";
//         LotNoInfo.Description := LotNoInfo.Description;
//         LotNoInfo.Insert();
//         IsUpdated := true;
//     end;

//     local procedure NextEntryNo(): Integer
//     var
//         ReserveEntry: Record "Reservation Entry";

//     begin
//         ReserveEntry.Reset();
//         if LastEntryNo = 0 then
//             if ReserveEntry.FindLast() then
//                 LastEntryNo := ReserveEntry."Entry No.";
//         LastEntryNo := LastEntryNo + 1;
//         exit(LastEntryNo);
//     end;

//     var
//         whseheader: Record "Warehouse Shipment Header";
//         whseline: Record "Warehouse Shipment Line";
//         LineNumber: Integer;
//         Isupdated: Boolean;
//         LastEntryNo: Integer;
//         ReservationEntry: Record "Reservation Entry";
//         LotNoInfo: Record "Lot No. Information";
//         Item: Record Item;
//         NoseriesMgt: Codeunit "No. Series";




// }



