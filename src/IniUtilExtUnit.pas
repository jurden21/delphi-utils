unit IniUtilExtUnit;

interface

type
    IIniUtil = interface
        function ReadString(ASection, AIdent: String; ADefault: String = ''): String;
        function ReadInteger(ASection, AIdent: String; ADefault: Integer = 0): Integer;
        function ReadDate(ASection, AIdent: String; ADefault: TDate): TDate;
        function ReadDateTime(ASection, AIdent: String; ADefault: TDateTime): TDateTime;
        procedure WriteString(ASection, AIdent, AValue: String);
        procedure WriteInteger(ASection, AIdent: String; AValue: Integer);
        procedure WriteDate(ASection, AIdent: String; AValue: TDate);
        procedure WriteDateTime(ASection, AIdent: String; AValue: TDateTime);
        function GetFileName: String;
    end;

    TIniUtil = class (TInterfacedObject, IIniUtil)
    private
        FFileName: String;
    public
        constructor Create; overload;
        constructor Create(AFileName: String); overload;
        function ReadString(ASection, AIdent: String; ADefault: String = ''): String;
        function ReadInteger(ASection, AIdent: String; ADefault: Integer = 0): Integer;
        function ReadDate(ASection, AIdent: String; ADefault: TDate): TDate;
        function ReadDateTime(ASection, AIdent: String; ADefault: TDateTime): TDateTime;
        procedure WriteString(ASection, AIdent, AValue: String);
        procedure WriteInteger(ASection, AIdent: String; AValue: Integer);
        procedure WriteDate(ASection, AIdent: String; AValue: TDate);
        procedure WriteDateTime(ASection, AIdent: String; AValue: TDateTime);
        function GetFileName: String;
    end;

implementation

uses
    System.SysUtils, System.IniFiles;

{ TIniUtil }

constructor TIniUtil.Create;
begin
    FFileName := ChangeFileExt(ParamStr(0), '.ini');
end;

constructor TIniUtil.Create(AFileName: String);
begin
    FFileName := AFileName;
end;

function TIniUtil.ReadString(ASection, AIdent: String; ADefault: String = ''): String;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        Result := IniFile.ReadString(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

function TIniUtil.ReadInteger(ASection, AIdent: String; ADefault: Integer = 0): Integer;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        Result := IniFile.ReadInteger(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

function TIniUtil.ReadDate(ASection, AIdent: String; ADefault: TDate): TDate;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        Result := IniFile.ReadDate(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

function TIniUtil.ReadDateTime(ASection, AIdent: String; ADefault: TDateTime): TDateTime;
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        Result := IniFile.ReadDateTime(ASection, AIdent, ADefault);
    finally
        IniFile.Free;
    end;
end;

procedure TIniUtil.WriteString(ASection, AIdent, AValue: String);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        IniFile.WriteString(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

procedure TIniUtil.WriteInteger(ASection, AIdent: String; AValue: Integer);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        IniFile.WriteInteger(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

procedure TIniUtil.WriteDate(ASection, AIdent: String; AValue: TDate);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        IniFile.WriteDate(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

procedure TIniUtil.WriteDateTime(ASection, AIdent: String; AValue: TDateTime);
var
    IniFile: TIniFile;
begin
    IniFile := TIniFile.Create(FFileName);
    try
        IniFile.WriteDateTime(ASection, AIdent, AValue);
    finally
        IniFile.Free;
    end;
end;

function TIniUtil.GetFileName: String;
begin
    Result := FFileName;
end;

end.
