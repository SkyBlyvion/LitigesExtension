page 51704 "LitigeVenteDoc"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "EnTeteLitige";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; NameSource)
                {

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}