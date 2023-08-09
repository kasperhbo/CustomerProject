page 50152 CreateCustomerProjectsCLP
{
    ApplicationArea = All;
    Caption = 'CreateCustomerCustomerProjectsCardLinePart';
    PageType = ListPart;
    SourceTable = CustomerProjectLine;

    layout
    {
        area(content)
        {
            repeater(GEN)
            {
                Caption = 'General';

                field("CustomerProjectLineNO."; Rec."CustomerProjectLineNO.")
                {
                    ToolTip = 'Specifies the value of the CustomerProjectLineNO. field.';
                }
                field("CustomerProjectNo."; Rec."CustomerProjectNo.")
                {
                    ToolTip = 'Specifies the value of the CustomerProjectNo. field.';
                }
                field("Items"; Rec."Items")
                {
                    ToolTip = 'Specifies the value of the CustomerNo. field.';
                }
                field("Discount"; rec.Discount)
                {
                    ToolTip = 'Specifies the value of the Discount field.';
                }
            }
        }
    }
}
