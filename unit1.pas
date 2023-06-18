unit Unit1;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

{ TForm1 }

TForm1 = class(TForm)
  Button1: TButton;
slButton: TButton;
prostButton: TButton;
ComboBox1: TComboBox;
rezMemo: TMemo;
perEdit: TEdit;
nachEdit: TEdit;
Label1: TLabel;
rezLabel: TLabel;
periodLabel: TLabel;
perLabel: TLabel;
nachLabel: TLabel;
procedure Button1Click(Sender: TObject);
procedure FormCreate(Sender: TObject);
procedure slButtonClick(Sender: TObject);
procedure prostButtonClick(Sender: TObject);
private

public

end;

var
Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  // Заполняем ComboBox значениями от 1 до 12
  for i := 1 to 12 do
    ComboBox1.Items.Add(IntToStr(i));
  rezMemo.Clear;

  // Привязываем обработчики событий к кнопкам
  slButton.OnClick := @slButtonClick;
  prostButton.OnClick := @prostButtonClick;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  nachEdit.Clear;
  perEdit.Clear;
  ComboBox1.ItemIndex := -1;
  rezMemo.Clear;
end;



procedure TForm1.slButtonClick(Sender: TObject);
var
  nach, per, result: Double;
  months: Integer;
begin
  if TryStrToFloat(nachEdit.Text, nach) and TryStrToFloat(perEdit.Text, per) and TryStrToInt(ComboBox1.Text, months) then
  begin
    // Расчет сложного процента
    result := nach * Power(1 + per / 100, months);

    rezMemo.Clear; // Очищаем rezMemo перед добавлением нового текста
    rezMemo.Text := 'Сложный процент:'#13#10 + FloatToStr(result);
  end
  else
    ShowMessage('Пожалуйста, введите числовые значения в поля ввода.');
end;

procedure TForm1.prostButtonClick(Sender: TObject);
var
  nach, per, result: Double;
  months: Integer;
begin
  if TryStrToFloat(nachEdit.Text, nach) and TryStrToFloat(perEdit.Text, per) and TryStrToInt(ComboBox1.Text, months) then
  begin
    // Расчет простого процента
    result := nach + nach * (per / 100) * months;

    rezMemo.Clear; // Очищаем rezMemo перед добавлением нового текста
    rezMemo.Text := 'Простой процент:'#13#10 + FloatToStr(result);
  end
  else
    ShowMessage('Пожалуйста, введите числовые значения в поля ввода.');
end;



end.
