page 50155 CustomerProjectLookup
{
    ApplicationArea = All;
    Caption = 'CustomerProjectLookup';
    SourceTable = CustomerProject;
    PageType = List;
    UsageCategory = Lists;
    Editable = false;
    CardPageId = CustomerProjectLookup;

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
}
