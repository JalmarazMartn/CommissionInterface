codeunit 69008 "Commission Items Only" implements "Commission Calculation"
{
    procedure GetInvCommission(SalesInvoiceHeader: Record "Sales Invoice Header"): Decimal;
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        BaseCommission: Decimal;
        Salesperson: Record "Salesperson/Purchaser";
    begin
        if not Salesperson.get(SalesInvoiceHeader."Salesperson Code") then
            Salesperson.init;
        with SalesInvoiceLine do begin
            SetRange("Document No.", SalesInvoiceHeader."No.");
            SetRange(Type, type::Item);
            CalcSums(Amount, "Line Discount Amount", "Inv. Discount Amount");
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
            SetRange(Type, type::Item);
            page.RunModal(0, SalesInvoiceLine);
        end;
    end;

}