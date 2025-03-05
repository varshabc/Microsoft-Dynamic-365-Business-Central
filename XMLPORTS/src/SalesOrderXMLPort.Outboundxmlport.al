xmlport 50133 "PostedSalesInvoiceXMLPort"
{
    Caption = 'PostedSalesInvoice';
    Direction = Export;
    Encoding = UTF8;
    UseRequestPage = false;

    schema
    {
        // Root element for the XML
        textelement(PostedSalesInvoice)
        {
            // Header Section: SalesHeader data
            tableelement("SalesInvoiceHeader"; "Sales Invoice Header")
            {
                XmlName = 'SalesHeader';

                fieldelement("No"; "SalesInvoiceHeader"."No.")
                {
                    XmlName = 'No';
                }

                fieldelement(SelltoCustomerNo; "SalesInvoiceHeader"."Sell-to Customer No.")
                {
                    XmlName = 'SelltoCustomerNo';
                }

                fieldelement(BilltoCustomerNo; "SalesInvoiceHeader"."Bill-to Customer No.")
                {
                    XmlName = 'BillToCustomerNo';
                }

                fieldelement(BilltoName; "SalesInvoiceHeader"."Bill-to Name")
                {
                    XmlName = 'BilltoName';
                }

                fieldelement(BilltoAddress; "SalesInvoiceHeader"."Bill-to Address")
                {
                    XmlName = 'BilltoAddress';
                }
                fieldelement(BilltoCity; "SalesInvoiceHeader"."Bill-to City")
                {
                    XmlName = 'BilltoCity';
                }
                fieldelement(ShiptoCode; "SalesInvoiceHeader"."Ship-to Code")
                {
                    XmlName = 'ShiptoCode';
                }
                fieldelement(ShiptoAddress; "SalesInvoiceHeader"."Ship-to Address")
                {
                    XmlName = 'ShiptoAddress';
                }
                fieldelement(ShiptoName; "SalesInvoiceHeader"."Ship-to Name")
                {
                    XmlName = 'ShiptoName';
                }
                fieldelement(ShiptoPostCode; "SalesInvoiceHeader"."Ship-to Post Code")
                {
                    XmlName = 'ShiptoPostCode';
                }

            }


            // Line Section: SalesLine data
            tableelement(SalesInvoiceLine; "Sales Invoice Line")
            {
                XmlName = 'SalesInvoiceLine';
                LinkTable = "SalesInvoiceHeader";
                LinkFields = "Document No." = field("No.");

                SourceTableView = sorting("Document No.", "Line No.") where
                ("Type" = filter('Item' | 'G/L Account'));
                MaxOccurs = Unbounded;
                MinOccurs = Zero;



                fieldelement(DocumentNo; "SalesInvoiceLine"."Document No.")
                {
                    XmlName = 'DocumentNo';
                }

                fieldelement(LineNo; "SalesInvoiceLine"."Line No.")
                {
                    XmlName = 'LineNo';
                }

                fieldelement(Type; "SalesInvoiceLine"."Type")
                {
                    XmlName = 'Type';
                }

                fieldelement(ItemNo; "SalesInvoiceLine"."No.")
                {
                    XmlName = 'ItemNo';
                }

                fieldelement(Quantity; "SalesInvoiceLine"."Quantity")
                {
                    XmlName = 'Quantity';
                }

                fieldelement(UnitPrice; "SalesInvoiceLine"."Unit Price")
                {
                    XmlName = 'UnitPrice';
                }

                fieldelement(Amount; "SalesInvoiceLine"."Line Amount")
                {
                    XmlName = 'Amount';
                }

                fieldelement(Description; "SalesInvoiceLine"."Description")
                {
                    XmlName = 'Description';
                }

                fieldelement(UnitOfMeasure; "SalesInvoiceLine"."Unit of Measure")
                {
                    XmlName = 'UnitOfMeasure';
                }

                fieldelement(LocationCode; "SalesInvoiceLine"."Location Code")
                {
                    XmlName = 'LocationCode';
                }
            }
        }
    }
}
