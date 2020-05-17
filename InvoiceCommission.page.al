page 69015 "Invoice Commission"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Commission Amount"; GetCommissionAmount)
                {
                    ApplicationArea = All;
                    AutoFormatType = 1;
                    AutoFormatExpression = "Currency Code";
                    trigger OnDrillDown()
                    begin
                        DrillDownComission();
                    end;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    local procedure GetCommissionAmount(): Decimal;
    var
        ICommissionCalculation: Interface "Commission Calculation";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if not SalespersonPurchaser.get("Salesperson Code") then
            exit;

        ICommissionCalculation := SalespersonPurchaser."Calc. Commission Method";
        exit(ICommissionCalculation.GetInvCommission(Rec));
    end;

    local procedure DrillDownComission()
    var
        ICommissionCalculation: Interface "Commission Calculation";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if not SalespersonPurchaser.get("Salesperson Code") then
            exit;
        ICommissionCalculation := SalespersonPurchaser."Calc. Commission Method";
        ICommissionCalculation.LookupCommission(rec);
    end;
}