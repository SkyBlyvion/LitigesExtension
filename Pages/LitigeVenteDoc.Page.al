page 51704 "LitigeVenteDoc"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "EnTeteLitige";
    Caption = 'Litige vente';

    // Documentation () 
    // AVOIR 27/01/12 CC REV4.14 : ajout N° Avoir 2 & 3
    // NL REV24 15/11/24 : creation de la page LitigeVenteDoc

    layout
    {
        area(Content)
        {
            group(Général)
            {
                Caption = 'Général';

                grid(Grid)
                {
                    // Première colonne
                    group(Colonne1)
                    {
                        Caption = '';
                        ShowCaption = false;

                        group(DocumentInformation)
                        {
                            Caption = 'Informations Document';
                            field("No. document"; Rec."No. document")
                            {
                                Editable = IsEditable;
                                Caption = 'No. document';
                                Tooltip = 'Numéro unique du document.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Date document"; Rec."Date document")
                            {
                                Editable = IsEditable;
                                Caption = 'Date document';
                                Tooltip = 'Date de création du document.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Clôturé"; Rec."Clôturé")
                            {
                                Editable = false;
                                Caption = 'Clôturé';
                                Tooltip = 'Indique si le litige est clôturé.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Date clôture"; Rec."Date clôture")
                            {
                                Editable = false;
                                Caption = 'Date clôture';
                                Tooltip = 'Date de clôture du litige.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(ClientInformation)
                        {
                            Caption = 'Informations Client';
                            field("No. client"; Rec."No. client")
                            {
                                Editable = IsEditable;
                                Caption = 'No. client';
                                Tooltip = 'Numéro du client associé.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                                TableRelation = Customer."No.";

                                trigger OnValidate()
                                begin
                                    IF Clt.GET(Rec."No. client") THEN BEGIN
#pragma warning disable AA0139
                                        varNomClt := Clt.Name;
                                        varCPClt := Clt."Post Code";
                                        varVilleClt := Clt.City;
                                        Rec."Code vendeur" := Clt."Salesperson Code";
#pragma warning restore AA0139
                                    END;
                                end;
                            }
                            field(varNomClt; varNomClt)
                            {
                                Editable = false;
                                Caption = 'Nom client';
                                Tooltip = 'Nom du client associé.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field(varCPClt; varCPClt)
                            {
                                Caption = 'Code Postal';
                                Editable = false;
                                Tooltip = 'Code postal du client.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field(varVilleClt; varVilleClt)
                            {
                                Caption = 'Ville';
                                Editable = false;
                                Tooltip = 'Ville du client associé.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(CommercialInformation)
                        {
                            Caption = 'Informations Commerciales';
                            field("Constat commercial"; Rec."Constat commercial")
                            {
                                Editable = IsEditable;
                                Caption = 'Constat commercial';
                                Tooltip = 'Indique si un constat commercial a été effectué.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Date constat"; Rec."Date constat")
                            {
                                Editable = IsEditable;
                                Caption = 'Date constat';
                                Tooltip = 'Date du constat commercial.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Demande passage commercial"; Rec."Demande passage commercial")
                            {
                                Editable = IsEditable;
                                Caption = 'Demande passage commercial';
                                Tooltip = 'Indique si une demande de passage commercial a été effectuée.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("No. note de comm. interne"; Rec."No. note de comm. interne")
                            {
                                Editable = IsEditable;
                                Caption = 'No. note de comm. interne';
                                Tooltip = 'Numéro de la note de communication interne.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Code vendeur"; Rec."Code vendeur")
                            {
                                Editable = IsEditable;
                                Caption = 'Code vendeur';
                                Tooltip = 'Code du vendeur.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }
                    }

                    // Deuxième colonne
                    group(Colonne2)
                    {
                        Caption = '';
                        ShowCaption = false;

                        group(DeliveryAddress)
                        {
                            Caption = 'Adresse de Livraison';
                            field("No. lieu de livraison"; Rec."No. lieu de livraison")
                            {
                                Editable = IsEditable;
                                Caption = 'No. lieu de livraison';
                                Tooltip = 'Numéro du lieu de livraison.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                                TableRelation = "Ship-to Address".Code WHERE("Customer No." = FIELD("No. client"));

                                trigger OnValidate()
                                begin
                                    IF AdLiv.GET(Rec."No. client", Rec."No. lieu de livraison") THEN BEGIN
                                        varCPCltLiv := AdLiv."Post Code";
                                        varVilleCltLiv := AdLiv.City;
                                    END;
                                end;
                            }
                            field(varCPCltLiv; varCPCltLiv)
                            {
                                Caption = 'Code Postal';
                                Editable = false;
                                Tooltip = 'Code postal du lieu de livraison.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field(varVilleCltLiv; varVilleCltLiv)
                            {
                                Caption = 'Ville';
                                Editable = false;
                                Tooltip = 'Ville du lieu de livraison.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(LitigeInformation)
                        {
                            Caption = 'Informations Litige';
                            field("Type litige"; Rec."Type litige")
                            {
                                Editable = IsEditable;
                                Caption = 'Type litige';
                                Tooltip = 'Type de litige associé.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Montant total factures"; Rec."Montant total factures")
                            {
                                Editable = false;
                                Caption = 'Montant total factures';
                                Tooltip = 'Montant total des factures.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Montant litige"; Rec."Montant litige")
                            {
                                Editable = false;
                                Caption = 'Montant litige';
                                Tooltip = 'Montant du litige en cours.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Ratio litige-factures"; RatioLitigeFormatted)
                            {
                                Editable = IsEditable;
                                Caption = 'Ratio litige-factures';
                                Tooltip = 'Ratio entre le litige et les factures.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Régularisation d'office"; Rec."Régularisation d'office")
                            {
                                Editable = IsEditable;
                                Caption = 'Régularisation d''office';
                                Tooltip = 'Indique si une régularisation d''office a été effectuée.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Obs régularisation d'office"; Rec."Obs régularisation d'office")
                            {
                                Editable = IsEditable;
                                Caption = 'Obs régularisation d''office';
                                Tooltip = 'Observations sur la régularisation d''office.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Dossier refusé"; Rec."Dossier refusé")
                            {
                                Editable = IsEditable;
                                Caption = 'Dossier refusé';
                                Tooltip = 'Indique si le dossier a fait l''objet d''un refus.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Procédure OK"; Rec."Procédure OK")
                            {
                                Editable = IsEditable;
                                Caption = 'Procédure OK';
                                Tooltip = 'Indique si la procédure est conforme.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(DirectionInformation)
                        {
                            Caption = 'Informations Direction';
                            field("Accord direction"; Rec."Accord direction")
                            {
                                Editable = IsEditable;
                                Caption = 'Accord direction';
                                Tooltip = 'Indique si un accord de la direction a été effectué.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Obs accord direction"; Rec."Obs accord direction")
                            {
                                Editable = IsEditable;
                                Caption = 'Obs accord direction';
                                Tooltip = 'Observations sur l''accord de la direction.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }
                    }

                    // Troisième colonne
                    group(Colonne3)
                    {
                        Caption = '';
                        ShowCaption = false;

                        group(AvoirInformation)
                        {
                            Caption = 'Informations Avoir';
                            field("No. avoir 1"; Rec."No. avoir 1")
                            {
                                Editable = IsEditable;
                                Caption = 'No. avoir 1';
                                Tooltip = 'Numéro unique de l''avoir 1.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';

                                trigger OnValidate()
                                begin
                                    IF EntAvoir.GET(Rec."No. avoir 1") THEN BEGIN
                                        EntAvoir.CALCFIELDS(Amount);
                                        varMtAvoir := EntAvoir.Amount;
                                    END;
                                end;
                            }
                            field("Commentaire constat 1"; Rec."Commentaire constat 1")
                            {
                                Editable = IsEditable;
                                Caption = 'Commentaire constat 1';
                                Tooltip = 'Premier commentaire sur le constat.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("No. avoir 2"; Rec."No. avoir 2")
                            {
                                Editable = IsEditable;
                                Caption = 'No. avoir 2';
                                Tooltip = 'Numéro unique de l''avoir 2.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                                trigger OnValidate()
                                begin
                                    IF EntAvoir.GET(Rec."No. avoir 2") THEN BEGIN
                                        EntAvoir.CALCFIELDS(Amount);
                                        varMtAvoir := varMtAvoir + EntAvoir.Amount;
                                    END;
                                end;
                            }
                            field("Commentaire constat 2"; Rec."Commentaire constat 2")
                            {
                                Editable = IsEditable;
                                Caption = 'Commentaire constat 2';
                                Tooltip = 'Deuxième commentaire sur le constat.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("No. avoir 3"; Rec."No. avoir 3")
                            {
                                Editable = IsEditable;
                                Caption = 'No. avoir 3';
                                Tooltip = 'Numéro unique de l''avoir 3.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';

                                trigger OnValidate()
                                begin
                                    IF EntAvoir.GET(Rec."No. avoir 3") THEN BEGIN
                                        EntAvoir.CALCFIELDS(Amount);
                                        varMtAvoir := varMtAvoir + EntAvoir.Amount;
                                    END;
                                end;
                            }
                            field(varMtAvoir; varMtAvoir)
                            {
                                Editable = false;
                                Caption = 'Montant avoir';
                                Tooltip = 'Montant total des avoirs.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(TransportInformation)
                        {
                            Caption = 'Informations Transporteur';
                            field("Accord transporteur"; Rec."Accord transporteur")
                            {
                                Editable = IsEditable;
                                Caption = 'Accord transporteur';
                                Tooltip = 'Indique si un accord transporteur a été effectué.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Refus transporteur"; Rec."Refus transporteur")
                            {
                                Editable = IsEditable;
                                Caption = 'Refus transporteur';
                                Tooltip = 'Indique si un refus transporteur a été effectué.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Code transporteur"; Rec."Code transporteur")
                            {
                                Editable = IsEditable;
                                Caption = 'Code transporteur';
                                Tooltip = 'Code du transporteur.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Contre-partie transporteur"; Rec."Contre-partie transporteur")
                            {
                                Editable = IsEditable;
                                Caption = 'Contre-partie transporteur';
                                Tooltip = 'Montant de la contre-partie du transporteur.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("No. bordereau livraison"; Rec."No. bordereau livraison")
                            {
                                Editable = IsEditable;
                                Caption = 'No. bordereau livraison';
                                Tooltip = 'Numéro du bordereau de livraison.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Obs contre-partie"; Rec."Obs contre-partie")
                            {
                                Editable = IsEditable;
                                Caption = 'Obs contre-partie';
                                Tooltip = 'Observations sur la contre-partie du transporteur.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }

                        group(Observations)
                        {
                            Caption = 'Observations';
                            field("Observations 1"; Rec."Observations 1")
                            {
                                Editable = IsEditable;
                                Caption = 'Observations 1';
                                Tooltip = 'Première observation concernant le litige.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Observations 2"; Rec."Observations 2")
                            {
                                Editable = IsEditable;
                                Caption = 'Observations 2';
                                Tooltip = 'Deuxième observation concernant le litige.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                            field("Observations 3"; Rec."Observations 3")
                            {
                                Editable = IsEditable;
                                Caption = 'Observations 3';
                                Tooltip = 'Troisième observation concernant le litige.';
                                Description = 'EN_TETE_LITIGE LN REV24 15/11/24';
                            }
                        }
                    }
                }
                part(LigneLitige; LigneLitigeSubForm)
                {
                    ApplicationArea = All;
                    Editable = IsEditable;
                    SubPageLink = "No. document" = field("No. document");
                    Caption = 'Ligne litige';
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(_Statistiques; Statistiques) { }
            actionref("_Charger lignes avoir"; "Charger lignes avoir") { }
            actionref(_Clôturer; Clôturer) { }
            actionref(_Déclôturer; Déclôturer) { }
            actionref("_Report Fiche litige"; "Report Fiche litige") { }
            actionref("_Report Statistiques litiges"; "Report Statistiques litiges") { }
        }
        area(Processing)
        {
            action(Statistiques)
            {
                caption = 'Statistiques';
                ToolTip = 'Statistiques';

                RunObject = Page "Statistiqueslitige";
                RunPageLink = "No. document" = field("No. document");
                RunPageOnRec = false;
            }
            action("Charger lignes avoir")
            {
                caption = 'Charger lignes avoir';
                ToolTip = 'Charger les lignes de l''Avoir concerné.';

                trigger OnAction()
                begin

                    //* Charger les lignes de l'Avoir concerné

                    LigAvoir.RESET();
                    LigAvoir.SETRANGE("Document No.", Rec."No. avoir 1");
                    IF LigAvoir.FIND('-') THEN
                        REPEAT
                            LigLitige.INIT();
                            LigLitige."No. document" := Rec."No. document";
                            LigLitige."No. client" := Rec."No. client";
                            LigLitige."No. ligne" := LigAvoir."Line No.";
#pragma warning disable AL0603
                            LigLitige.Type := LigAvoir.Type; // Implicit conversion Options > Enum: Type
#pragma warning restore AL0603
                            LigLitige."No. article" := LigAvoir."No.";
                            LigLitige."Quantité litige" := LigAvoir.Quantity;
                            LigLitige."PU remisé litige" := LigAvoir."Prix Unitaire Remisé (Pièce)";
#pragma warning disable AA0139
                            LigLitige.Désignation := LigAvoir.Description; // Assigned Text to a smaller size
#pragma warning restore AA0139
                            LigLitige.INSERT();
                        UNTIL LigAvoir.NEXT() = 0;
                end;
            }
            action(Clôturer)
            {
                Caption = 'Clôturer';
                ToolTip = 'Clôture le dossier';

                trigger OnAction()
                begin

                    IF CONFIRM('Voulez-vous clôturer ce dossier ?') THEN BEGIN
                        Rec.Clôturé := TRUE;
                        Rec."Date clôture" := WORKDATE();
                        Rec.MODIFY();
                    END;

                end;
            }
            action(Déclôturer)
            {
                Caption = 'Déclôurer';
                ToolTip = 'Déclôture le dossier';

                trigger OnAction()
                begin

                    IF CONFIRM('Voulez-vous déclôturer ce dossier ?') THEN BEGIN
                        Rec.Clôturé := FALSE;
                        Rec."Date clôture" := 0D;
                        Rec.MODIFY();
                    END;

                end;
            }
            action("Report Fiche litige")
            {
                caption = 'Fiche litige';
                ToolTip = 'Fiche litige';

                trigger OnAction()
                begin
                    REPORT.RUN(50077, TRUE, FALSE, Rec); // TODO: Créer le report
                end;
            }
            action("Report Statistiques litiges")
            {
                caption = 'Statistiques litiges';
                ToolTip = 'Statistiques litiges';

                trigger OnAction()
                begin
                    REPORT.RUN(50039, TRUE, FALSE, Rec); // TODO: Créer le report
                    // Old Code : RunObject = "Statistiques litiges"; SANS AUCUN RUNFORMLINK et RunFormOnRec = false;
                end;

            }
        }
    }

    var
        LigLitige: Record "Lignelitige";
#pragma warning disable AA0137
        EnteteLitige: Record "Entetelitige";
        Clt: Record Customer;
        EntAvoir: Record "Sales Cr.Memo Header";
        AdLiv: Record "Ship-to Address";
        LigAvoir: Record "Sales Cr.Memo Line";
        ParamVente: Record "Sales & Receivables Setup";
        //CopierDocVentes: Report "Copie document vente"; //TODO: Créer le Report
        //ValidationDocVente: Report "Post Sales Document"; 
        EtatImpr: Codeunit "Test Report-Print";
        DocImpr: Codeunit "Document-Print";
        ModifierTauxChange: Page "Change Exchange Rate";
        varNomClt: Text[30];
        varCPClt: Code[20];
        varCPCltLiv: Code[20];
        varVilleClt: Text[30];
        varVilleCltLiv: Text[30];
        varMtAvoir: Decimal;
        RatioLitigeFormatted: Text[30];
        IsEditable: Boolean; // Contrôle l'état éditable de la page et des sous-pages
# pragma warning restore
    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
    end;

    trigger OnOpenPage()
    begin
        UpdateEditableState(); // Définir l'état au chargement
    end;

    trigger OnAfterGetCurrRecord()
    begin
        RatioLitigeFormatted := Format(Rec."Ratio litige-factures") + ' %';
        UpdateEditableState(); // Met à jour l'état lors d'un changement d'enregistrement
    end;

    local procedure UpdateEditableState()
    begin
        if Rec."Clôturé" then
            IsEditable := false // Désactiver les champs principaux
        else
            IsEditable := true; // Activer les champs principaux
    end;

    trigger OnAfterGetRecord()
    begin

        // Charger les informations du client
        IF Clt.GET(Rec."No. client") THEN BEGIN
#pragma warning disable AA0139
            varNomClt := Clt.Name;
#pragma warning restore AA0139
            varCPClt := Clt."Post Code";
            varVilleClt := Clt.City;
        END;

        // Calculer le montant total des avoirs
        IF EntAvoir.GET(Rec."No. avoir 1") THEN BEGIN
            EntAvoir.CALCFIELDS(Amount);
            varMtAvoir := EntAvoir.Amount;
        END;
        IF EntAvoir.GET(Rec."No. avoir 2") THEN BEGIN
            EntAvoir.CALCFIELDS(Amount);
            varMtAvoir := varMtAvoir + EntAvoir.Amount;
        END;
        IF EntAvoir.GET(Rec."No. avoir 2") THEN BEGIN
            EntAvoir.CALCFIELDS(Amount);
            varMtAvoir := varMtAvoir + EntAvoir.Amount;
        END;

        // Charger les informations du lieu de livraison
        IF AdLiv.GET(Rec."No. client", Rec."No. lieu de livraison") THEN BEGIN
            varCPCltLiv := AdLiv."Post Code";
            varVilleCltLiv := AdLiv.City;
        END;

        // Déterminer l'état éditable
        //IsEditable := not Rec."Clôturé";

        // IF Rec.Clôturé THEN BEGIN
        //     CurrPage.EDITABLE := FALSE;
        //     CurrPage.LignesVente.Page.EDITABLE := FALSE;
        // END ELSE BEGIN
        //     CurrPage.EDITABLE := TRUE;
        //     CurrPage.LignesVente.Page.EDITABLE := TRUE;
        // END;

    end;
}