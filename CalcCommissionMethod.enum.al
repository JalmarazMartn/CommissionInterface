enum 69000 "Calc. Commission Method" implements "Commission Calculation"
{
    Extensible = true;

    value(0; Default)
    {
        Implementation = "Commission Calculation" = "Commission Vat Base";
    }

    value(69007; "All line Types")
    {
        Implementation = "Commission Calculation" = "Commission Vat Base";
    }
    value(69008; "Only Items")
    {
        Implementation = "Commission Calculation" = "Commission Items Only";
    }

}