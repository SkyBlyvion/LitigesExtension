table 51703 LigneLitige
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No. document"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. document';
            Tooltip = 'Numéro unique du document lié au litige';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
            TableRelation = EnTeteLitige."No. document";
        }
        field(2; "No. ligne"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No. ligne';
            Tooltip = 'Numéro de ligne dans le document';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Type';
            Tooltip = 'Type d''élément lié au litige';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
            OptionMembers = " ","Compte général","Article","Ressource";
        }
        field(4; "No. facture"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. facture';
            Tooltip = 'Numéro de la facture associée';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
            TableRelation = "Sales Invoice Header"."No." WHERE("Sell-to Customer No." = FIELD("No. client"));

            trigger OnValidate()
            begin

                IF EntFactVte.GET("No. facture") THEN BEGIN
                    EntFactVte.CALCFIELDS(Amount);
                    "Montant facture" := EntFactVte.Amount;
                    LigLitige.RESET();
                    LigLitige.SETRANGE("No. document", "No. document");
                    LigLitige.SETRANGE("No. facture", "No. facture");
                    LigLitige.SETFILTER("No. ligne", '<>%1', "No. ligne");
                    IF NOT (LigLitige.FIND('-')) THEN
                        IF EntLitige.GET("No. document") THEN BEGIN
                            EntLitige."Montant total factures" := EntLitige."Montant total factures" + EntFactVte.Amount;
                            EntLitige.MODIFY();
                        END;

                END;


                //* MAJ du Ratio
                IF EntLitige.GET("No. document") THEN BEGIN
                    EntLitige.CALCFIELDS("Montant litige");
                    IF (EntLitige."Montant litige" <> 0) AND (EntLitige."Montant total factures" + EntFactVte.Amount <> 0) THEN BEGIN
                        EntLitige."Ratio litige-factures" := (EntLitige."Montant litige" / (EntLitige."Montant total factures" + EntFactVte.Amount)) * 100;
                        EntLitige.MODIFY();
                    END;
                END;

            end;
        }
        field(5; "No. article"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. article';
            Tooltip = 'Numéro de l''article lié au litige';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
            TableRelation = "Item"."No.";

            trigger OnValidate()
            begin

                TESTFIELD(Type, Type::Article);
                IF Type = Type::Article THEN
                    IF Art.GET("No. article") THEN
#pragma warning disable AA0139
                        Désignation := Art.Description;
#pragma warning restore

                LigFactVte.RESET();
                LigFactVte.SETCURRENTKEY("Document No.", "No.");
                LigFactVte.SETRANGE("Document No.", "No. facture");
                LigFactVte.SETRANGE("No.", "No. article");
                IF LigFactVte.FIND('-') THEN BEGIN
                    "Quantité facturée" := LigFactVte."Quantity (Base)";
                    "PU remisé facturé" := LigFactVte."Prix Unitaire Remisé (Pièce)";
                    "PU remisé litige" := LigFactVte."Prix Unitaire Remisé (Pièce)";
                END ELSE
                    ERROR('Cet article n''a pas été facturé à ce client');

            end;
        }
        field(6; "Quantité facturée"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité facturée';
            Tooltip = 'Quantité facturée dans le document';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(7; "Quantité litige"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantité litige';
            Tooltip = 'Quantité en litige pour cette ligne';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';

            trigger OnValidate()
            begin

                Montant := "Quantité litige" * "PU remisé litige";

                IF EntLitige.GET("No. document") THEN BEGIN
                    EntLitige.CALCFIELDS("Montant litige");
                    //*  EntLitige.MtLitige:=EntLitige."Montant litige"+Montant;
                    IF (EntLitige."Montant litige" + Montant <> 0) AND (EntLitige."Montant total factures" <> 0) THEN BEGIN
                        EntLitige."Ratio litige-factures" := ((EntLitige."Montant litige" + Montant) / EntLitige."Montant total factures") * 100;
                        EntLitige.MODIFY();
                    END;
                END;

            end;
        }
        field(8; "PU remisé facturé"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PU remisé facturé';
            Tooltip = 'Prix unitaire remisé facturé';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(9; "PU remisé litige"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'PU remisé litige';
            Tooltip = 'Prix unitaire remisé pour le litige';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';

            trigger OnValidate()
            begin

                Montant := "Quantité litige" * "PU remisé litige";

                IF EntLitige.GET(Rec."No. document") THEN BEGIN
                    EntLitige.CALCFIELDS("Montant litige");
                    //*  EntLitige.MtLitige:=EntLitige."Montant litige";
                    IF (EntLitige."Montant litige" + Montant <> 0) AND (EntLitige."Montant total factures" <> 0) THEN BEGIN
                        EntLitige."Ratio litige-factures" := ((EntLitige."Montant litige" + Montant) / EntLitige."Montant total factures") * 100;
                        EntLitige.MODIFY();
                    END;
                END;

            end;
        }
        field(10; Désignation; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Désignation';
            Tooltip = 'Description ou désignation de l''article';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(11; "No. client"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. client';
            Tooltip = 'Numéro du client lié à cette ligne';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(12; Montant; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant';
            Tooltip = 'Montant total pour cette ligne';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
        field(13; "Montant facture"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Montant facture';
            Tooltip = 'Montant total de la facture';
            Editable = true;
            Description = 'LIGNE_LITIGE LN REV24 14/11/24';
        }
    }

    keys
    {
        key(PK; "No. document", "No. ligne")
        {
            Clustered = true;
            SumIndexFields = Montant;
        }
    }
    var

        Art: Record Item;
        LigFactVte: Record "Sales Invoice Line";
        EntFactVte: Record "Sales Invoice Header";
        LigLitige: Record "LigneLitige";
        EntLitige: Record "EnteteLitige";

    trigger OnInsert()
    begin

        IF EntLitige.GET("No. document") THEN BEGIN
            EntLitige.CALCFIELDS("Montant litige");
            EntLitige.MtLitige := EntLitige."Montant litige" + Montant;
            EntLitige.MODIFY();
        END;

    end;

    trigger OnModify()
    begin

        IF EntLitige.GET("No. document") THEN BEGIN
            EntLitige.CALCFIELDS("Montant litige");
            EntLitige.MtLitige := EntLitige."Montant litige" + Montant;
            //* MAJ du Ratio
            IF (EntLitige."Montant total factures" + EntFactVte.Amount <> 0) AND (EntLitige."Montant litige" <> 0) THEN BEGIN
                EntLitige."Ratio litige-factures" := (EntLitige."Montant litige" / (EntLitige."Montant total factures" + EntFactVte.Amount)) * 100;
                EntLitige.MODIFY();
            END;
        END;

    end;

    trigger OnDelete()
    begin

        //* MAJ "Montant total factures" dans "En-tête litige"
        LigLitige.RESET();
        LigLitige.SETRANGE("No. document", "No. document");
        LigLitige.SETRANGE("No. facture", "No. facture");
        LigLitige.SETFILTER("No. ligne", '<>%1', "No. ligne");
        IF NOT (LigLitige.FIND('-')) THEN BEGIN
            IF EntLitige.GET("No. document") THEN BEGIN
                EntLitige.CALCFIELDS("Montant litige");
                EntLitige.MtLitige := EntLitige."Montant litige" - Montant;
                EntLitige."Montant total factures" := EntLitige."Montant total factures" - "Montant facture";
                IF (EntLitige."Montant litige" <> 0) AND (EntLitige."Montant total factures" <> 0) THEN
                    EntLitige."Ratio litige-factures" := (EntLitige."Montant litige" / EntLitige."Montant total factures") * 100;

                EntLitige.MODIFY();
            END;
        END ELSE
            IF EntLitige.GET("No. document") THEN BEGIN
                EntLitige.CALCFIELDS("Montant litige");
                EntLitige.MtLitige := EntLitige."Montant litige" - Montant;
                IF (EntLitige."Montant litige" - Montant <> 0) AND (EntLitige."Montant total factures" <> 0) THEN
                    EntLitige."Ratio litige-factures" := ((EntLitige."Montant litige" - Montant) / EntLitige."Montant total factures") * 100;

                EntLitige.MODIFY();
            END;

    end;

    trigger OnRename()
    begin
        // Ajoutez des logiques spécifiques au renommage ici
    end;
}