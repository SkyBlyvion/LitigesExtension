page 51708 "StatistiquesLitige"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EnTeteLitige;
    Editable = false;

    // Documentation()
    // Page pour afficher les Statistiques Litige

    layout
    {
        area(Content)
        {
            repeater(Général)
            {
                field("Montant total factures"; Rec."Montant total factures")
                {
                    Caption = 'Montant total factures';
                    Editable = false;
                }
                field("Montant litige"; Rec."Montant litige")
                {
                    Caption = 'Montant litige';
                    Editable = false;
                }
                field("Ratio litige-factures"; Rec."Ratio litige-factures")
                {
                    Caption = 'Ratio litige-factures';
                    Editable = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CALCFIELDS("Montant litige");
        Rec."Ratio litige-factures" := (Rec."Montant litige" / Rec."Montant total factures") * 100;
    end;
}