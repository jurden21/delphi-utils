unit IniUtilUnit;

interface

uses
    System.SysUtils, System.IniFiles;

type
    TIniUtil = class
    public
        class var FileName: String;
    private
        class function GetIniFileName: String;
    public
        class function ReadString(ASection, AIdent: String; ADefault: String = ''): String;
        class function ReadInteger(ASection, AIdent: String; ADefault: Integer = 0): Integer;
        class function ReadDate(ASection, AIdent: String; ADefault: TDate): TDate;
        class function ReadDateTime(ASection, AIdent: String; ADefault: TDateTime): TDateTime;
        class procedure WriteString(ASection, AIdent, AValue: String);
        class procedure WriteInteger(ASection, AIdent: String; AValue: Integer);
        class procedure WriteDate(ASection, AIdent: String; AValue: TDate);
        class procedure WriteDateTime(ASection, AIdent: String; AValue: TDateTime);
    end;

implementation

{ TIniUtil }

class function TIniUtil.GetIniFileName: String;
begin
    if FileExists(FileName)
    then Result := FileName
    else Result := ChangeFileExt(ParamStr(0), '.ini');
end;

class function TIniUtil.ReadString(ASection, AIdent: String; ADefault: String = ''): String;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        Result := IniFile.ReadString(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

class function TIniUtil.ReadInteger(ASection, AIdent: String; ADefault: Integer = 0): Integer;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        Result := IniFile.ReadInteger(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

class function TIniUtil.ReadDate(ASection, AIdent: String; ADefault: TDate): TDate;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        Result := IniFile.ReadDate(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

class function TIniUtil.ReadDateTime(ASection, AIdent: String; ADefault: TDateTime): TDateTime;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        Result := IniFile.ReadDateTime(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

class procedure TIniUtil.WriteString(ASection, AIdent, AValue: String);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        IniFile.WriteString(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

class procedure TIniUtil.WriteInteger(ASection, AIdent: String; AValue: Integer);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        IniFile.WriteInteger(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

class procedure TIniUtil.WriteDate(ASection, AIdent: String; AValue: TDate);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        IniFile.WriteDate(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

class procedure TIniUtil.WriteDateTime(ASection, AIdent: String; AValue: TDateTime);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(GetIniFileName);
    try
        IniFile.WriteDateTime(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

end.
