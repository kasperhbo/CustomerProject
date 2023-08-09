page 50154 CustomerProjectsListPart
{
    ApplicationArea = All;
    PageType = ListPart;
    Caption = 'Customer Projects';
    SourceTable = CustomerProject;
    CardPageId = CreateCustomerProjectCard;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ProjectNO."; Rec."ProjectNO.")
                {
                    ToolTip = 'Specifies the value of the ProjectNO. field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    ToolTip = 'Specifies the value of the ProjectName field.';
                }
                field(Rayon; Rec.Rayon)
                {
                    ToolTip = 'Specifies the value of the Rayon field.';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                }
            }
        }
    }


    procedure SetRange(var CustomerNo: Code[20])
    begin
        Rec.SetRange(Customer, CustomerNo);
    end;

    trigger OnClosePage()
    begin
        Rec.SetRange(Customer, '');
    end;
}
