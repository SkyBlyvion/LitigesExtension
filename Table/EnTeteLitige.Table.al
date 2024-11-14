table 51701 EnTeteLitige
{
    // Documentation()
    // AVOIR 27/01/12 CC REV4.14 : ajout No. Avoir 2 & 3
    // 14/11/24 REV24 NL : creation de la table EnTeteLitige en AL

    DataClassification = CustomerContent;

    fields
    {
        field(1; "No. document"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. document';
            Tooltip = 'Numéro unique du document.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(2; "Type litige"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Type litige';
            Tooltip = 'Type de litige associé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            OptionMembers = "Casse","Défectueux","Manquant","Erreur de commande","Refus à la réception","Retour tardif","Erreur de préparation","Régularisation de prix","Régularisation de compte","Autres";
        }
        field(3; "No. client"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. client';
            Tooltip = 'Numéro du client associé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = Customer;
        }
        field(4; "No. lieu de livraison"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'No. lieu de livraison';
            Tooltip = 'Numéro du lieu de livraison.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("No. client"));
        }
        field(5; "Date document"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date document';
            Tooltip = 'Date de création du document.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(6; "Utilisateur"; Text[5])
        {
            DataClassification = SystemMetadata;
            Caption = 'Utilisateur';
            Tooltip = 'Utilisateur ayant créé ou modifié le document.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(7; "No. avoir 1"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. avoir 1';
            Tooltip = 'Numéro du premier avoir associé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Sales Cr.Memo Header"."No." WHERE("Sell-to Customer No." = FIELD("No. client"));
        }
        field(8; "Code transporteur"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code transporteur';
            Tooltip = 'Code du transporteur responsable.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Shipping Agent".Code;
        }
        field(9; "No. bordereau livraison"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. bordereau livraison';
            Tooltip = 'Numéro du bordereau de livraison.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
#pragma warning disable AA0232
        field(10; "Montant litige"; Decimal)
#pragma warning restore
        {
            Caption = 'Montant litige';
            Tooltip = 'Montant du litige en cours.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            FieldClass = FlowField;
            CalcFormula = Sum("LigneLitige".Montant WHERE("No. document" = FIELD("No. document")));
        }
        field(11; "Ratio litige-factures"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Ratio litige-factures';
            Tooltip = 'Ratio entre le litige et les factures.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(12; "Observations 1"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Observations 1';
            Tooltip = 'Première observation concernant le litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(13; "Observations 2"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Observations 2';
            Tooltip = 'Deuxième observation concernant le litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(14; "Observations 3"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Observations 3';
            Tooltip = 'Troisième observation concernant le litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(15; "Constat commercial"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Constat commercial';
            Tooltip = 'Indique si un constat commercial a été effectué.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(16; "Date constat"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date constat';
            Tooltip = 'Date du constat commercial.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(17; "Commentaire constat 1"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Commentaire constat 1';
            Tooltip = 'Premier commentaire sur le constat.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(18; "Commentaire constat 2"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Commentaire constat 2';
            Tooltip = 'Deuxième commentaire sur le constat.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(19; "No. note de comm. interne"; Integer) // "No. note de communicat. interne"
        {
            DataClassification = CustomerContent;
            Caption = 'No. note de communicat. interne';
            Tooltip = 'Numéro de la note de communication interne.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(20; "Contre-partie transporteur"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Contre-partie transporteur';
            Tooltip = 'Montant de la contre-partie du transporteur.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(21; "Obs contre-partie"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Obs contre-partie';
            Tooltip = 'Observations sur la contre-partie du transporteur.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(22; "Code vendeur"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code vendeur';
            Tooltip = 'Code du vendeur associé au litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(23; "Souche de No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Souche de No.';
            Tooltip = 'Souche de numéro associée au document.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(24; "Régularisation d'office"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Régularisation d''office';
            Tooltip = 'Indique si une régularisation d''office a été effectuée.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(25; "Obs régularisation d'office"; Text[150])
        {
            DataClassification = CustomerContent;
            Caption = 'Obs régularisation d''office';
            Tooltip = 'Observations sur la régularisation d''office.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(26; "Accord direction"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Accord direction';
            Tooltip = 'Indique si un accord de la direction a été donné.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(27; "Obs accord direction"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Obs accord direction';
            Tooltip = 'Observations sur l''accord de la direction.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(28; "Clôturé"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Clôturé';
            Tooltip = 'Indique si le litige est clôturé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(29; "Date clôture"; Date)
        {
            DataClassification = SystemMetadata;
            Caption = 'Date clôture';
            Tooltip = 'Date de clôture du litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(30; "Montant total factures"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Montant total factures';
            Tooltip = 'Montant total des factures liées au litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(31; "MtLitige"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'MtLitige';
            Tooltip = 'Montant total du litige.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(32; "Accord transporteur"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Accord transporteur';
            Tooltip = 'Indique si un accord du transporteur a été donné.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(33; "Refus transporteur"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Refus transporteur';
            Tooltip = 'Indique si un refus a été émis par le transporteur.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(34; "Dossier refusé"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Dossier refusé';
            Tooltip = 'Indique si le dossier a été refusé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(35; "Procédure OK"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Procédure OK';
            Tooltip = 'Indique si la procédure est conforme.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(36; "Demande passage commercial"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Demande passage commercial';
            Tooltip = 'Indique si une demande de passage commercial a été effectuée.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
        }
        field(37; "No. avoir 2"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. avoir 2';
            Tooltip = 'Numéro du deuxième avoir associé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Sales Cr.Memo Header"."No." WHERE("Sell-to Customer No." = FIELD("No. client"));
        }
        field(38; "No. avoir 3"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. avoir 3';
            Tooltip = 'Numéro du troisième avoir associé.';
            Editable = true;
            Description = 'EN_TETE_LITIGE LN REV24 14/11/24';
            TableRelation = "Sales Cr.Memo Header"."No." WHERE("Sell-to Customer No." = FIELD("No. client"));
        }
    }

    keys
    {
        key(PK; "No. document")
        {
            Clustered = true;
        }
        key(Key2; "No. client", "Date document")
        {
            Enabled = true;
            SumIndexFields = MtLitige, "Ratio litige-factures";
        }
    }

    var
        LigLitige: Record "LigneLitige";
        GestionNoSouche: Codeunit "No. Series"; // anciennement NoSeriesManagement

    trigger OnInsert()
    begin
        IF "No. document" = '' THEN
            // Check if "Souche de No." is not empty; otherwise, fallback to 'V-LIT'
            IF "Souche de No." <> '' THEN
                "No. document" := GestionNoSouche.GetNextNo("Souche de No.", "Date document", true)
            ELSE
                "No. document" := GestionNoSouche.GetNextNo('V-LIT', "Date document", true);
        "Date document" := WORKDATE();
#pragma warning disable AA0139
        Utilisateur := USERID();
#pragma warning restore
    end;

    /*OldTriggerOnInsert()
        OnInsert()
        IF "NNo. document" = '' THEN
        GestionNoSouche.InitSeries('V-LIT','',"Date document","NNo. document","Souche de NNo.");

        "Date document" := WORKDATE;
        Utilisateur := USERID;
    */

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin
        LigLitige.RESET();
        LigLitige.SETRANGE("No. document", "No. document");
        IF LigLitige.FIND('-') THEN
            LigLitige.DELETEALL();
    end;

    trigger OnRename()
    begin

    end;

}