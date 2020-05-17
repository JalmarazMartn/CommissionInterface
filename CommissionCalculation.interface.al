interface "Commission Calculation"
{
    procedure GetInvCommission(SalesInvoiceHeader: Record "Sales Invoice Header") ComisionAmount: Decimal;
    procedure LookupCommission(SalesInvoiceHeader: Record "Sales Invoice Header")
}