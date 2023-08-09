table 50150 CustomerProject
{
    Caption = 'CustomerProject';
    TableType = Normal;

    fields
    {
        field(1; "ProjectNO."; Code[20])
        {
            Caption = 'ProjectNO.';
        }
        field(2; ProjectName; Text[256])
        {
            Caption = 'ProjectName';
        }
        field(3; Customer; Code[20])
        {
            Caption = 'Customer';
            TableRelation = Customer;
        }

        field(4; Rayon; Code[20])
        {
            Caption = 'Rayon';
            TableRelation = Rayon;
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "ProjectNO.")
        {
            Clustered = true;
        }
    }

    procedure GetItemDiscount(ItemNo: Code[20]): Decimal
    var
        CustomerProjectLineRec: Record "CustomerProjectLine";
    begin
        // Message(ItemNo);
        CustomerProjectLineRec.SetRange("CustomerProjectNo.", "ProjectNO.");
        CustomerProjectLineRec.SetRange("Items", ItemNo);

        if CustomerProjectLineRec.FindSet() then begin
            // Do whatever processing you want with the CustomerProjectLineRec
            // Message('CustomerProjectLineNo.: %1, Item: %2, Discount: %3', CustomerProjectLineRec."CustomerProjectLineNO.", CustomerProjectLineRec."Items", CustomerProjectLineRec."Discount");
            exit(CustomerProjectLineRec."Discount");
        end;
    end;

    // Define a procedure called "GetRecNo()"
    local procedure GetRecNo()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewNoSeriesCode: Code[20];
    begin
        // Check if the "Document No." field is empty
        if Rec."ProjectNO." = '' then
            // If it's empty, initialize a new series using the NoSeriesManagement codeunit
            NoSeriesMgt.InitSeries('CUSTPROJECT', '', Today(), "ProjectNO.", NewNoSeriesCode);
    end;

    trigger OnInsert()
    begin
        // Call the "GetRecNo()" procedure
        GetRecNo();
    end;
}
