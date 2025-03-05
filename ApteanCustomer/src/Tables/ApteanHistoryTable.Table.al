table 50113 ApteanHistoryTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;LogNumber; Integer)
        {
            DataClassification = ToBeClassified;  
        }

        field(2;CustomerNumber;Code[20])
        {
          DataClassification = ToBeClassified;  
        }

        field(3; "Date and Time"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        
    }
    
    keys
    {
        key(Key1; LogNumber)
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}