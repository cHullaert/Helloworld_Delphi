program hw_console;

{$APPTYPE CONSOLE}

uses
  SysUtils;

begin
  try
    { TODO -oUtilisateur -cCode du point d'entr�e : Placez le code ici }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
