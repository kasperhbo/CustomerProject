page 50153 CreateCustomerProjectCard
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = CustomerProject;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("ProjectNO."; Rec."ProjectNO.")
                {
                    ToolTip = 'Specifies the value of the ProjectNO. field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    ToolTip = 'Specifies the value of the ProjectName field.';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                }
                field(Rayon; Rec.Rayon)
                {
                    ToolTip = 'Specifies the value of the Rayon field.';
                }

            }

            part(CustomerCardsLine; CreateCustomerProjectsCLP)
            {
                ApplicationArea = All;
                SubPageLink = "CustomerProjectNo." = FIELD("ProjectNO.");
            }
        }
    }
}
