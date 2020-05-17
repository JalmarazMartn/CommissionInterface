pageextension 69001 "COM Salesperson" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addlast(General)
        {
            field("Calc. Commission Method"; "Calc. Commission Method")
            {
                ApplicationArea = All;
            }
        }
    }
}