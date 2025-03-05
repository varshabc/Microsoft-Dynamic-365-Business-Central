tableextension 50103 PostedSalesInvoiceExt extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Customer Details"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }
}