unit IniUtilTestsUnit;

interface

uses
  DUnitX.TestFramework, System.Classes, System.SysUtils;

const
  FILE_NAME = 'test.ini';

type
  [TestFixture]
  TIniUtilTests = class(TObject)
  private
    function GetDefaultFileName: String;
    function GetCustomFileName: String;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ReadStringDefaultFileTest;
    [Test]
    procedure ReadStringCustomFileTest;
    [Test]
    procedure WriteStringDefaultFileTest;
    [Test]
    procedure WriteStringCustomFileTest;
  end;

implementation

uses
  IniUtilUnit;

function TIniUtilTests.GetDefaultFileName: String;
begin
  Result := ChangeFileExt(ParamStr(0), '.ini');
end;

function TIniUtilTests.GetCustomFileName: String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + FILE_NAME;
end;

procedure TIniUtilTests.Setup;
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  StringList.Add('[SECTION1]');
  StringList.Add('StringValue1=string_value_1');
  StringList.Add('[SECTION2]');
  StringList.Add('StringValue2=string_value_2');
  StringList.SaveToFile(GetDefaultFileName);

  StringList := TStringList.Create;
  StringList.Add('[SECTION6]');
  StringList.Add('StringValue6=string_value_6');
  StringList.Add('[SECTION7]');
  StringList.Add('StringValue7=string_value_7');
  StringList.SaveToFile(GetCustomFileName);
end;

procedure TIniUtilTests.TearDown;
begin
  DeleteFile(GetDefaultFileName);
  DeleteFile(GetCustomFileName);
end;

procedure TIniUtilTests.ReadStringDefaultFileTest;
var
  ExpectedValue, ActualValue: String;
begin
  ExpectedValue := 'string_value_1';
  ActualValue := TIniUtil.ReadString('SECTION1', 'StringValue1', 'DefaultStringValue1');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'string_value_2';
  ActualValue := TIniUtil.ReadString('SECTION2', 'StringValue2', 'DefaultStringValue2');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'DefaultStringValue3';
  ActualValue := TIniUtil.ReadString('SECTION3', 'StringValue3', 'DefaultStringValue3');
  Assert.AreEqual(ExpectedValue, ActualValue);
end;

procedure TIniUtilTests.ReadStringCustomFileTest;
var
  ExpectedValue, ActualValue: String;
begin
  TIniUtil.FileName := GetCustomFileName;

  ExpectedValue := 'string_value_6';
  ActualValue := TIniUtil.ReadString('SECTION6', 'StringValue6', 'DefaultStringValue6');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'string_value_7';
  ActualValue := TIniUtil.ReadString('SECTION7', 'StringValue7', 'DefaultStringValue7');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'DefaultStringValue8';
  ActualValue := TIniUtil.ReadString('SECTION8', 'StringValue8', 'DefaultStringValue8');
  Assert.AreEqual(ExpectedValue, ActualValue);
end;

procedure TIniUtilTests.WriteStringDefaultFileTest;
var
  ExpectedValue, ActualValue: String;
begin
  ExpectedValue := 'string_value_3';
  TIniUtil.WriteString('SECTION3', 'StringValue3', ExpectedValue);
  ActualValue := TIniUtil.ReadString('SECTION3', 'StringValue3', 'DefaultStringValue3');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'string_value_3';
  TIniUtil.WriteString('SECTION2', 'StringValue3', ExpectedValue);
  ActualValue := TIniUtil.ReadString('SECTION2', 'StringValue3', 'DefaultStringValue3');
  Assert.AreEqual(ExpectedValue, ActualValue);
end;

procedure TIniUtilTests.WriteStringCustomFileTest;
var
  ExpectedValue, ActualValue: String;
begin
  TIniUtil.FileName := GetCustomFileName;

  ExpectedValue := 'string_value_3';
  TIniUtil.WriteString('SECTION3', 'StringValue3', ExpectedValue);
  ActualValue := TIniUtil.ReadString('SECTION3', 'StringValue3', 'DefaultStringValue3');
  Assert.AreEqual(ExpectedValue, ActualValue);

  ExpectedValue := 'string_value_3';
  TIniUtil.WriteString('SECTION2', 'StringValue3', ExpectedValue);
  ActualValue := TIniUtil.ReadString('SECTION2', 'StringValue3', 'DefaultStringValue3');
  Assert.AreEqual(ExpectedValue, ActualValue);
end;

initialization
  TDUnitX.RegisterTestFixture(TIniUtilTests);

end.
