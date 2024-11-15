page 51705 "LigneLitigeSubForm"
{
    ApplicationArea = All;
    Caption = 'Ligne litige';
    PageType = ListPart;
    SourceTable = LigneLitige;


    /* Documentation()
        //LITIGE_VENTE PC 21/10/99 NSC1.12 : Gestion des droits de modifications des dates en fonction des quantités réservées

        //RESERVATION PC 15/02/00 NSC2.14 :Mise en place de la fonction de réservation lorsque l'on valide la quantité/conditionnement

        //LITIGE_VENTE CC 04/10/01 REV1.23 : zone "Qté à Liv." non éditable

        //MIGRATION_400 SC 23/01/06 NSC4.00 Migration et documentation

        //LITIGE_VENTE LN 15/11/24 REV24 : Création du Document et SubForm en AL
    */

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No. facture"; Rec."No. facture")
                {
                    Editable = true;
                    Caption = 'No. facture';
                    Tooltip = 'Numéro de la facture associée';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field(Type; Rec.Type)
                {
                    Editable = true;
                    Caption = 'Type';
                    Tooltip = 'Type d''élément lié au litige';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field("No. article"; Rec."No. article")
                {
                    Editable = true;
                    Caption = 'No. article';
                    Tooltip = 'Numéro de l''article lié au litige';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field("Désignation"; Rec."Désignation")
                {
                    Editable = true;
                    Caption = 'Désignation';
                    Tooltip = 'Description ou désignation de l''article';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field("Quantité facturée"; Rec."Quantité facturée")
                {
                    Editable = true;
                    Caption = 'Quantité facturée';
                    Tooltip = 'Quantité facturée dans le document';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field("PU remisé facturé"; Rec."PU remisé facturé")
                {
                    Editable = true;
                    Caption = 'PU remisé facturé';
                    Tooltip = 'Prix unitaire remisé facturé';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';

                    // Changement depuis OnAfterValidate() vers OnValidate() 
                    trigger OnValidate()
                    begin
                        CurrPage.SAVERECORD();
                    end;
                }
                field("Quantité litige"; Rec."Quantité litige")
                {
                    Editable = true;
                    Caption = 'Quantité litige';
                    Tooltip = 'Quantité en litige pour cette ligne';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field("PU remisé litige"; Rec."PU remisé litige")
                {
                    Editable = true;
                    Caption = 'PU remisé litige';
                    Tooltip = 'Prix unitaire remisé pour le litige';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }
                field(Montant; Rec.Montant)
                {
                    Editable = true;
                    Caption = 'Montant';
                    Tooltip = 'Montant de la ligne';
                    Description = 'LIGNE_LITIGE LN REV24 14/11/24';
                }

            }
        }
    }

    var
        EnteteLitige: Record "Entetelitige";
#pragma warning disable AA0137
        EntFactVte: Record "Sales Invoice Header";
        LigLitige: Record "Lignelitige";
        EntLitige: Record "Entetelitige";
#pragma warning restore

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := xRec.Type;
        IF EnteteLitige.GET(Rec."No. document") THEN
            Rec."No. client" := EnteteLitige."No. client";
    end;
}