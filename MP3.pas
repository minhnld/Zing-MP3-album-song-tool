VAR     FI,FO:TEXT;
        Z,N,J,I,Z1:INTEGER;
        T:STRING;
        A,B,C: ARRAY [1..1000] OF STRING;

BEGIN
        ASSIGN(FI,'MP3.INP');
        RESET(FI)  ;
        ASSIGN(FO,'MP3.TXT');
        REWRITE(FO);
WHILE NOT EOF(FI) DO
BEGIN
        N:=N+1;
        READLN(FI,A[N])
END;
        Z1:=1 ;
        Z:=2;
        FOR I:=1 TO N DIV 3 DO
        BEGIN
        B[I]:=A[Z];
        C[I]:=A[Z1];
        Z1:=Z1+3;
        Z:=Z+3;
        END;
  for I:=1 TO ( N DIV 3 -1) DO
        BEGIN
        FOR J:=N DIV 3 DOWNTO I+1 DO
                BEGIN
        IF (B[J]<B[J-1]) THEN
                BEGIN
                T:=B[J];
                B[J]:=B[J-1];
                B[J-1]:=T;
                T:=C[J];
                C[J]:=C[J-1];
                C[J-1]:=T;
                END;
                END;
                END;
        FOR I:=1 TO N DIV 3 DO
        WRITELN(FO,C[I]);
        CLOSE(FI);
        CLOSE(FO);

END.
