page 50151 CustomerProjects
{
    ApplicationArea = All;
    PageType = List;
    Caption = 'Customer Projects';
    SourceTable = CustomerProject;
    UsageCategory = Lists;
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
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Specifies the value of the Customer field.';
                }
                field(ProjectName; Rec.ProjectName)
                {
                    ToolTip = 'Specifies the value of the ProjectName field.';
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

pageextension 50152 tes extends "Contact List"
{

}
