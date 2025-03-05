page 50115 ApteanCustomerPageCardBCW
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ApteanCustomerTableBCW;
    Caption = 'ApteanCustomerPageCardBCW';

    layout
    {
        area(Content)
        {
            group(GeneralInformation)
            {
                field(CustomerNumber; rec.CustomerNumber)
                {
                    Caption = 'CustomerNumber';
                }
                field(CustomerName; rec.CustomerName)
                {
                    Caption = 'CustomerName';
                }
                field(CustomerEmail; rec.CustomerEmail)
                {
                    Caption = 'CustomerEmail';
                    DrillDown = true;
                    // TableRelation = Customer."E-Mail";

                    trigger OnDrillDown()
                    var
                        CustomerEmail: Record "Customer";
                    begin
                        if Page.RunModal(Page::"Customer List", CustomerEmail) = Action::LookupOK then
                            rec.CustomerEmail := CustomerEmail."E-Mail";
                        rec.Modify();
                    end;
                }
                field(CustomerAddress; rec.CustomerAddress)
                {
                    Caption = 'CustomerAddress';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Customer: Record Customer;
                    begin
                        if Page.RunModal(Page::"Customer List", Customer) = Action::LookupOK then
                            rec.CustomerAddress := Customer.Address;
                    end;
                }
            }

            part(JustfoodCustomerTableBCW; "JustfoodCustomerBCW")
            {
                Caption = 'JustfoodCustomerBCW';
                ApplicationArea = all;
                SubPageLink = CustomerNumber = field("CustomerNumber");
            }
        }

        area(FactBoxes)
        {
            part("Details part"; "Customer Picture")
            {
                Caption = 'Customer Picture';
                SubPageLink = "No." = field("CustomerNumber");
            }

            part("Customer Statistics"; "Customer Statistics FactBox")
            {
                Caption = 'Customer Statistics';
            }

            part("Dimension"; "Dimensions FactBox")
            {
                Caption = 'Dimensions';
            }

            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
            }

            part("Attached Documents List"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
            }

            part(EntityTextFactBox; "Entity Text Factbox Part")
            {
                ApplicationArea = All;
                Caption = 'Customer Text';
            }

            part(Entity; "Plans FactBox")
            {
                ApplicationArea = All;
                Caption = 'Customer';
            }

            part(User; "User Setup FactBox")
            {
                ApplicationArea = All;
            }

            part(Queues; "My Job Queue")
            {
                ApplicationArea = All;
            }

            systempart("Links"; Links)
            {
                ApplicationArea = All;
                Caption = 'Links';
            }

            systempart("Notes"; Notes)
            {
                ApplicationArea = All;
                Caption = 'Notes';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Functions)
            {
                trigger OnAction()
                begin

                end;
            }
        }
    }


    var
        myInt: Integer;
}


