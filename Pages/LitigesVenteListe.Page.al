page 51706 "LitigesVenteListe"
{
    PageType = List;
    Caption = 'Liste des litiges de vente';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = "EnTeteLitige";

    CardPageId = LitigeVenteDoc;

    // Page de Type Liste pour lister les litiges de vente.

    layout
    {
        area(Content)
        {
            repeater(Général)
            {
                field("No. document"; Rec."No. document")
                {
                    Caption = 'No. document';
                    Tooltip = 'Numéro unique du document lié au litige';
                }
                field("No. client"; Rec."No. client")
                {
                    Caption = 'No. client';
                    Tooltip = 'Numéro du client associé';
                }
                field("Date document"; Rec."Date document")
                {
                    Caption = 'Date document';
                    Tooltip = 'Date de création du document';
                }
                field("Type litige"; Rec."Type litige")
                {
                    Caption = 'Type litige';
                    Tooltip = 'Type de litige';
                }
                field("No. avoir 1"; Rec."No. avoir 1")
                {
                    Caption = 'No. avoir 1';
                    Tooltip = 'Numéro unique de l''avoir 1';
                }
                field("Code transporteur"; Rec."Code transporteur")
                {
                    Caption = 'Code transporteur';
                    Tooltip = 'Code transporteur';
                }
                field("Code vendeur"; Rec."Code vendeur")
                {
                    Caption = 'Code vendeur';
                    Tooltip = 'Code vendeur';
                }
                field("Clôturé"; Rec."Clôturé")
                {
                    Caption = 'Clôturé';
                    Tooltip = 'Indique si le litige est clôturé';
                }
                field("Montant total factures"; Rec."Montant total factures")
                {
                    Caption = 'Montant total factures';
                    Tooltip = 'Montant total des factures';
                }
                field("Montant litige"; Rec."Montant litige")
                {
                    Caption = 'Montant litige';
                    Tooltip = 'Montant du litige';
                }
                field("Ratio litige-factures"; Rec."Ratio litige-factures")
                {
                    Caption = 'Ratio litige-factures';
                    Tooltip = 'Ratio du litige par rapport aux factures';
                }
                field("Observations 1"; Rec."Observations 1")
                {
                    Caption = 'Observations 1';
                    Tooltip = 'Observations concernant le litige';
                }
                field("Observations 2"; Rec."Observations 2")
                {
                    Caption = 'Observations 2';
                    Tooltip = 'Observations concernant le litige';
                }
                field("Observations 3"; Rec."Observations 3")
                {
                    Caption = 'Observations 3';
                    Tooltip = 'Observations concernant le litige';
                }
            }
        }
    }
}