table 50151 CustomerProjectLine
{
    Caption = 'CustomerProjectLine';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CustomerProjectLineNO."; Code[20])
        {
            Caption = 'CustomerProjectLineNO.';
        }
        field(2; "CustomerProjectNo."; Code[20])
        {
            Caption = 'CustomerProjectNo.';
            TableRelation = CustomerProject."ProjectNO.";
            DataClassification = CustomerContent;
        }
        field(3; "Items"; Code[20])
        {
            Caption = 'Items';
            TableRelation = Item."No.";
            DataClassification = CustomerContent;
        }
        field(4; "Discount"; Decimal)
        {
            Caption = 'Discount';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
    }
    keys
    {
        key(PK; "CustomerProjectLineNO.")
        {
            Clustered = true;
        }
    }


    procedure GetRecNo()
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NewNoSeriesCode: Code[20];
    begin
        // Check if the "Document No." field is empty
        if Rec."CustomerProjectLineNO." = '' then
            // If it's empty, initialize a new series using the NoSeriesManagement codeunit
            NoSeriesMgt.InitSeries('CUSTPROJLI', '', Today(), "CustomerProjectLineNO.", NewNoSeriesCode);
    end;

    trigger OnInsert()
    begin
        // Call the "GetRecNo()" procedure
        GetRecNo();
        GetProjectNo();
    end;

    procedure GetProjectNo()
    var
        CustomerProject: Record CustomerProject;
    begin
        // Check if the "Document No." field is empty
        if "CustomerProjectNo." = '' then
            // If it's empty, find the last record in the "Price Agreement Header" table
            if CustomerProject.FindLast() then
                // Assign the "Document No." from the found record to the current record
                "CustomerProjectNo." := CustomerProject."ProjectNO.";
    end;
}

