page 50144 HistoryUpdate
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HistoryUpdate;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(UserID; Rec.UserId)
                {
                    ApplicationArea = All;

                }
                field("Date and Time"; Rec."Date and Time")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        myInt: Integer;
}