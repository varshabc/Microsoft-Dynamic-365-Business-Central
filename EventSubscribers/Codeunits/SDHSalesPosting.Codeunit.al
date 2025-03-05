codeunit 50128 "SDH Sales Posting"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToCustomerAddressFieldsFromCustomer, '', false, false)]
    local procedure CopyCustomeFields(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."Customer Details" := SellToCustomer."Customer Details";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", OnAfterCopyGenJnlLineFromSalesHeader, '', false, false)]
    local procedure CopyFromSalesHeader(SalesHeader: Record "Sales Header"; var GenJournalLine: Record "Gen. Journal Line")
    begin
        GenJournalLine."Customer Details" := SalesHeader."Customer Details";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", OnAfterCopyCustLedgerEntryFromGenJnlLine, '', false, false)]
    local procedure CopyFromJournalToLedger(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."Customer Details" := GenJournalLine."Customer Details";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertInvoiceHeader, '', false, false)]
    local procedure CopyCustomerDetailsToPostedInvoice(SalesHeader: Record "Sales Header"; var SalesInvHeader: Record "Sales Invoice Header")
    begin
        SalesInvHeader."Customer Details" := SalesHeader."Customer Details";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnInsertPostedHeadersOnAfterInsertShipmentHeader, '', false, false)]
    local procedure CopyCustomerDetailsToPostedShipment(SalesHeader: Record "Sales Header")
    var
        SalesShptHeader: Record "Sales Shipment Header";
    begin
        if SalesShptHeader.Get(SalesHeader."No.") then begin
            SalesShptHeader."Customer Details" := SalesHeader."Customer Details";
            SalesShptHeader.Modify();
        end;
    end;

    //the below code is for the vendor and purchase order

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", OnAfterValidateEvent, 'Buy-from Vendor No.', false, false)]
    local procedure CopyVendorDetailsToPurchaseHeader(var Rec: Record "Purchase Header")
    var
        VendorRec: Record Vendor;
    begin
        if VendorRec.Get(Rec."Buy-from Vendor No.") then begin
            Rec."Vendor Details" := VendorRec."Vendor Details";
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, 'Document No.', false, false)]
    local procedure CopyVendorDetailsToPurchaseLine(var Rec: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
    begin
        if PurchHeader.Get(Rec."Document Type", Rec."Document No.") then begin
            Rec."Vendor Details" := PurchHeader."Vendor Details";
        end;
    end;

}

