unit RegistryUtilUnit;

interface

uses
    System.Classes, System.SysUtils, System.Win.Registry, Winapi.Windows;

type
    TRegistryUtil = class
    strict private
        const ROOT_KEY = HKEY_CURRENT_USER;
    public
        class function ReadString(AKey, AName, ADefault: String): String;
        class function ReadInteger(AKey, AName: String; ADefault: Integer): Integer;
        class procedure WriteString(AKey, AName: String; AValue: String);
        class procedure WriteInteger(AKey, AName: String; AValue: Integer);
    end;

implementation

{ TRegistryUtil }

class function TRegistryUtil.ReadString(AKey, AName, ADefault: String): String;
var
    Registry: TRegistry;
begin
    Result := ADefault;
    Registry := TRegistry.Create;
    try
        Registry.RootKey := ROOT_KEY;
        Registry.OpenKey(AKey, True);
        if Registry.ValueExists(AName)
        then
            Result := Registry.ReadString(AName);
    finally
        Registry.Free;
    end;
end;

class function TRegistryUtil.ReadInteger(AKey, AName: String; ADefault: Integer): Integer;
var
    Registry: TRegistry;
begin
    Result := ADefault;
    Registry := TRegistry.Create;
    try
        Registry.RootKey := ROOT_KEY;
        Registry.OpenKey(AKey, True);
        if Registry.ValueExists(AName)
        then
            Result := Registry.ReadInteger(AName);
    finally
        Registry.Free;
    end;
end;

class procedure TRegistryUtil.WriteString(AKey, AName: String; AValue: String);
var
    Registry: TRegistry;
begin
    Registry := TRegistry.Create;
    try
        Registry.RootKey := ROOT_KEY;
        Registry.OpenKey(AKey, True);
        Registry.WriteString(AName, AValue);
    finally
        Registry.Free;
    end;
end;

class procedure TRegistryUtil.WriteInteger(AKey, AName: String; AValue: Integer);
var
    Registry: TRegistry;
begin
    Registry := TRegistry.Create;
    try
        Registry.RootKey := ROOT_KEY;
        Registry.OpenKey(AKey, True);
        Registry.WriteInteger(AName, AValue);
    finally
        Registry.Free;
    end;
end;

end.
