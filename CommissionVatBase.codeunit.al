codeunit 69007 "Commission Vat Base" implements "Commission Calculation"
{
    procedure GetInvCommission(SalesInvoiceHeader: Record "Sales Invoice Header"): Decimal;
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        Salesperson: Record "Salesperson/Purchaser";
        BaseCommission: Decimal;
    begin
        if not Salesperson.get(SalesInvoiceHeader."Salesperson Code") then
            exit;
        with SalesInvoiceLine do begin
            SetRange("Document No.", SalesInvoiceHeader."No.");
            CalcSums(Amount);
            BaseCommission := Amount;
            exit(Round(BaseCommission * Salesperson."Commission %" / 100));
        end;
    end;

    procedure LookupCommission(SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        with SalesInvoiceLine do begin
            SetRange("Document No.", SalesInvoiceHeader."No.");
            page.RunModal(0, SalesInvoiceLine);
        end;
    end;

}