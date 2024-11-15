pageextension 51707 "Extend BusMngrRoleCntr2VLit" extends "Business Manager Role Center"
{
    actions
    {
        addlast(sections)
        {
            group(Divers)
            {
                Caption = 'Divers';

#pragma warning disable AA0194
                action(Préparations)
                {
                    Caption = 'Préparations';
                    ApplicationArea = All;
                    //RunObject = Page "Préparations";
                    ToolTip = 'Préparations';
                }
#pragma warning restore AA0194
                action("Litige vente")
                {
                    Caption = 'Litige vente';
                    ApplicationArea = All;
                    RunObject = Page LitigesVenteListe;
                    ToolTip = 'Litige vente';
                }
            }
        }
    }
}