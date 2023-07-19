CREATE OR REPLACE NONEDITIONABLE FUNCTION SF_CPF_ FORMATADO(
    pCpf     IN VARCHAR2,
    pPrefixo IN VARCHAR2:= NULL,
    PSufixo  IN VARCHAR2:= NULL)
    RETURN VARCHAR2 AS sCpf VARCHAR2(20):= NULL;

BEGIN
    IF TRIM(pCpf) IS NOT NULL THEN
            sCpf:= SubStr('00000000000' | | TRIM(pCpf), -11);
            sCpf:= pPrefixo ||
                   SubStr(sCpf, 01, 3) || '.' ||
                   SubStr(sCpf, 04, 3) || '.' ||
                   SubStr(sCpf, 07, 3) || '-' ||
                   SubStr(sCpf, 10, 2) ||
                   PSufixo;
    END IF;

    RETURN sCpf;
    END SF_CPF_FORMATADO;