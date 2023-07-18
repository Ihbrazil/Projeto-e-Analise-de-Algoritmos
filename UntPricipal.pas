unit Untpricipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Gauges;

type
  TfrmPrincipal = class(TForm)
    rdgpTipoCaso: TRadioGroup;
    pnlTempo: TPanel;
    memVetorOriginal: TMemo;
    memVetorOrdenado: TMemo;
    pnlSelecao: TPanel;
    pnlMetodoOrdenacao: TPanel;
    Label3: TLabel;
    pnlEscolhasFeitas: TPanel;
    lblNumeroElementos: TLabel;
    Label9: TLabel;
    lblNomeAlgoritmo: TLabel;
    Label5: TLabel;
    StatusBar1: TStatusBar;
    Panel5: TPanel;
    TimerGerar: TTimer;
    TimerOrdenar: TTimer;
    lblGerar: TLabel;
    lblOrdenar: TLabel;
    TimerAtualizarHora: TTimer;
    pnlBotoes: TPanel;
    btbtnGerar: TButton;
    btnExecutar: TButton;
    pnlLimpar: TPanel;
    btnLimparTudo: TButton;
    pnlNumeroPosicoes: TPanel;
    Label4: TLabel;
    cbxNumeroPosicoes: TComboBox;
    cmbbxTipoAlgoritmo: TComboBox;
    btnLimparOrdenados: TButton;
    pnlOpcao: TPanel;
    chcListar: TCheckBox;
    procedure cmbbxTipoAlgoritmoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure cbxNumeroPosicoesChange(Sender: TObject);
    procedure cbxNumeroPosicoesExit(Sender: TObject);
    procedure btnLimparTudoClick(Sender: TObject);
    procedure TimerGerarTimer(Sender: TObject);
    procedure btbtnGerarClick(Sender: TObject);
    procedure TimerOrdenarTimer(Sender: TObject);
    procedure TimerAtualizarHoraTimer(Sender: TObject);
    procedure btnLimparOrdenadosClick(Sender: TObject);

  private
  { Private declarations }
    vIndiceLista: LongInt;
    TipoVetor: array [0..1000000] of LongInt;
    TipoVetor2: array [0..1000000] of LongInt;
    procedure CriarArray(TipoCaso:String; NumElem:LongInt);
    procedure BubbleSort();
    procedure InsertSort();
    procedure SelectSort();
    procedure Troca(Elemento1,Elemento2:LongInt);
    procedure Particao(var vList : array of LongInt; min,max : LongInt; var  p : LongInt );
    procedure QuickSort(var v : array of LongInt; min,max : LongInt );
    Procedure ajusta ( var  vList: array of LongInt; i, n : LongInt);
    procedure HeapSort ( var vList: array of LongInt; n : LongInt );
    procedure ShellInsere(r:LongInt; var vList:array of LongInt; k,i:LongInt);
    procedure ShellSort(var vList:array of LongInt; var N:LongInt);
    procedure MergeSort(VAR vList:array of LongInt;inicio,fim:LongInt);

  public
    { Public declarations }
    NumElementos:LongInt;
    //Variáveis utilizadas pelo merge
    C,M:LONGINT;
    //Variável utilizada Pelo ShellSort
    N:LongInt;
  end;

var
  //Variáveis utilizadas para se obter o tempo de processamento
  frmPrincipal: TfrmPrincipal;
  HoraInicial,HoraFinal, TempoOrdenacao, TempoGeracao:TTime;

implementation

{$R *.dfm}

//essas procedures fazem somente a apresentação de qual sort vai ser usado
procedure TfrmPrincipal.cmbbxTipoAlgoritmoChange(Sender: TObject);
begin
  lblNomeAlgoritmo.Caption := cmbbxTipoAlgoritmo.Text;
end;

//define o numero de elementos do vetor
procedure TfrmPrincipal.cbxNumeroPosicoesExit(Sender: TObject);
begin
  if cbxNumeroPosicoes.ItemIndex<>0then
    begin
        if cbxNumeroPosicoes.ItemIndex = 1 then
          begin
          NumElementos := 50000;
          end;
          if cbxNumeroPosicoes.ItemIndex = 2 then
          begin
          NumElementos := 100000;
          end;
          if cbxNumeroPosicoes.ItemIndex = 3 then
          begin
          NumElementos := 250000;
          end;
          if cbxNumeroPosicoes.ItemIndex = 4 then
          begin
          NumElementos := 500000;
          end;
          if cbxNumeroPosicoes.ItemIndex = 5 then
          begin
          NumElementos := 1000000;
          end;
      N:= cbxNumeroPosicoes.ItemIndex;
      lblNumeroElementos.Visible:=true;
    end
  else
    begin
      lblNumeroElementos.Caption:='<POSIÇÕES>';
      lblNumeroElementos.Visible:=false;
    end;
end;

//cria os arrays nos tipos de casos
procedure TfrmPrincipal.CriarArray(TipoCaso: String; NumElem: LongInt);
var
  vCont:LongInt;
begin
    //cria um array em ordem crescente
  if TipoCaso = 'Otimista' then
    begin
      for vCont:= 1 to NumElem do
      begin
        HoraInicial := time;
        TipoVetor[vCont] := vCont;
        if chcListar.Checked then
            memVetorOriginal.Lines.Add(IntToStr(TipoVetor[VCont]));
        HoraFinal := Time;
      end;
    end
  //cria um array com numeros aleatorios positivos e negativos
  else if TipoCaso = 'Médio' then
  begin
    HoraInicial := time;
    Randomize;
	  for vCont:= 1 to NumElem do
	    begin
	      TipoVetor[vCont] := Random(NumElem);
	      if vCont mod 2 = 0 then
	        begin
	          TipoVetor[vCont] := TipoVetor[vCont]*-1;
	        end;
        if chcListar.Checked then
            memVetorOriginal.Lines.Add(IntToStr(TipoVetor[VCont]));
	    end;
    HoraFinal := Time;
  end
  //cria um array com numeros ordenados decrescente
  else if TipoCaso = 'Pessimista' then
    begin
      //vIndiceLista é a posição no vetor
      HoraInicial := time;
      vIndiceLista := 1;
      for vCont := NumElem -1 downto 0 do
        begin
          //A primeira posição é preenchida com o último número do total de elementos
          TipoVetor[vIndiceLista]:= vCont+1;
          if chcListar.Checked then
              memVetorOriginal.Lines.Add(IntToStr(TipoVetor[vIndiceLista]));
          inc(vIndiceLista);
        end;
      HoraFinal := Time;
    end;

end;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    StatusBar1.Panels[0].Text := '     ' + DateToStr(Date());
    StatusBar1.Panels[1].Text := '                              Grupo: Bruno Rodrigo - Isaias Horta Brazil - Ernani Guilhon - Rafael Bispo';
    StatusBar1.Panels[2].Text := '     ' + TimeToStr(time());
end;
///////////////////////////////////////////////////////////////////////////////


//executa todo o sistema
procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
var
  //Variável utilizada para jogar os valores do vetor no memo
  i:LongInt;
begin

  TimerOrdenar.Enabled := true;
  pnlTempo.Caption:='Ordenando Elementos...';
  memVetorOrdenado.Clear;
  Application.ProcessMessages;

  //Verifica se o usuario selecionou o sort e o n de elementos
  if cmbbxTipoAlgoritmo.ItemIndex=0 then
  begin
    Application.MessageBox('Selecione um método de ordenação!','Opção invalida',mb_ok+MB_ICONERROR);
    cmbbxTipoAlgoritmo.SetFocus;
    exit;
  end;
  if cbxNumeroPosicoes.ItemIndex=0 then
  begin
    Application.MessageBox('Selecione o número de elementos!','Opção invalida',mb_ok+MB_ICONERROR);
    cbxNumeroPosicoes.SetFocus;
    exit;
  end;
   if rdgpTipoCaso.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione um tipo de caso!','Opção invalida',mb_ok+MB_ICONERROR);
    cmbbxTipoAlgoritmo.SetFocus;
    exit;
  end;
  //Mostrando o panel com informações
  //chama o sort a ser executado
  case cmbbxTipoAlgoritmo.ItemIndex of
      1:  begin
            HoraInicial := Time;
            BubbleSort();
            HoraFinal := Time;
          end;
      2:  begin
            HoraInicial := Time;
            SelectSort();
            HoraFinal := Time;
          end;
      3:  begin
            HoraInicial := Time;
            InsertSort();
            HoraFinal := Time;
          end;
      4:  begin
            HoraInicial := Time;
            QuickSort(TipoVetor, 1, NumElementos);
            HoraFinal := Time;
          end;
      5:  begin
            HoraInicial:=Time;
            HeapSort(TipoVetor, NumElementos);
            HoraFinal := Time;
          end;
      6:  begin
            HoraInicial := Time;
            ShellSort(TipoVetor,N);
            HoraFinal := Time;
          end;
      7:  begin
            HoraInicial := Time;
            MergeSort(TipoVetor, 0, NumElementos);
            HoraFinal := Time;
          end;
end;
          memVetorOrdenado.Clear;
          //Jogando os valores do Array ordenado para a tela no memo

      if cmbbxTipoAlgoritmo.ItemIndex = 7 then
        for i := 1 to NumElementos do
          begin
            if chcListar.Checked then
                memVetorOrdenado.Lines.Add(IntToStr(TipoVetor2[i]));
          end
      else
        for i:=1 to (NumElementos) do
          begin
            if chcListar.Checked then
                memVetorOrdenado.Lines.Add(IntToStr(TipoVetor[i]));
          end;
    TempoOrdenacao := HoraFinal - HoraInicial;
    lblOrdenar.Caption := FormatDateTime('HH:MM:SS:ZZZ', TempoOrdenacao);
    TimerOrdenar.Enabled := false;
    pnlTempo.Caption:='Ordenado';
    btbtnGerar.Enabled := False;
    btnLimparOrdenados.Enabled:=true;
    btnLimparTudo.Enabled:=true;
    cbxNumeroPosicoes.Enabled := False;
    rdgpTipoCaso.Enabled := False;
end;

procedure TfrmPrincipal.Troca(Elemento1, Elemento2: LongInt);
var
  Elemento3:LongInt;
begin
  Elemento3 := TipoVetor[Elemento1];
  TipoVetor[Elemento1] := TipoVetor[Elemento2];
  TipoVetor[Elemento2] := Elemento3;
end;

//SORTS//
//InsertSort
procedure TfrmPrincipal.InsertSort;
var
  cont, cont2, aux:LongInt;
begin

  for cont2 := 2 to NumElementos do
    begin
      aux  := TipoVetor[cont2];
      cont :=cont2-1;
        while (cont>0) and (TipoVetor[cont]>aux) do
          begin
            TipoVetor[cont+1] := TipoVetor[cont];
            cont           := cont-1;
            TipoVetor[cont+1] := aux;
          end
    end;

end;
//SelectSort
procedure TfrmPrincipal.SelectSort;
Var
  cont,cont2,min:LongInt;
begin

  for cont := 1 to NumElementos - 1 do
    begin
      min := cont;
      for cont2 := cont+1 to NumElementos do
        begin
          if TipoVetor[cont2] < TipoVetor[min] then min:=cont2;
        end;
      troca(min,cont);
    end;

end;

//QuickSort
procedure TfrmPrincipal.QuickSort(var v : array of LongInt; min,max : LongInt );
var p : LongInt;
begin
  if min < max then
    begin
		  particao ( v, min, max, p );
		  quicksort ( v, min, p-1);
      quicksort ( v, p+1, max);
	  end;
end;
//Procedure utilizada no QuickSort
procedure TfrmPrincipal.Particao(var vList : array of LongInt; min, max : LongInt; var  p : LongInt );
var i,j : LongInt;
   pivot:LongInt;
begin
	i     := min;
	j     := max+1;
    pivot := vList[min];
	repeat
      repeat
        i := i + 1;
 	    until vList[i]>= pivot;
      repeat
        j := j - 1;
	    until vList[j]<= pivot;
      if i < j then troca(i,j);
	until i>=j;
    troca(min,j);
    p:= j;
end;

//HeapSort
procedure TfrmPrincipal.HeapSort(var vList: array of LongInt; n: LongInt);
var 	i: LongInt;
	    r: LongInt;
begin
	for i:= ( n div 2 ) downto 1 do
		ajusta(vList,i,n);
	for i:= ( n - 1 ) downto 1 do
    begin
      troca(i+1,1);
	    ajusta(vList,1,i);
	  end;
end;
procedure TfrmPrincipal.ajusta(var vList: array of LongInt; i, n: LongInt);
Var
  j : LongInt;
  c : LongInt;
  r : LongInt;
  fim : boolean;
Begin
	fim := false;
	r   := vList[i];
	c   := vList[i];
	j   := 2 * i;
	while (( j <= n ) and not fim ) do
	begin
		if j < n then
			if vList[j] < vList[j+1] then j := j +1;
		if c >= vList[j] then fim := true
		else
		begin
			vList[j div 2] := vList[j];
			j := 2*j;
		end;
	end;
	vList[ j div 2 ] := r;
end;

//BubbleSort
procedure TfrmPrincipal.BubbleSort();
var
  vCont,
  vCont2:LongInt;
begin

  for vCont := 1 to NumElementos-1 do
    begin
      for vCont2 := NumElementos downto vCont+1 do
        begin
          if TipoVetor[vCont2] < TipoVetor[vCont2-1] then
            begin
              Troca(vCont2,vCont2-1);
            end
        end
    end;

end;

//ShellSort
procedure TfrmPrincipal.ShellSort(var vList: array of LongInt;
  var N: LongInt);
var i, k : LongInt;
begin

  k := 1;
  repeat
    k := 3*k + 1;
  until k > N;

  repeat
    k:= k div 3;
      for i := k + 1 to N do
        ShellInsere ( vList[i], vList, k, i);
  until k = 1;

end;

procedure TfrmPrincipal.ShellInsere(r: LongInt; var vList: array of LongInt; k, i: LongInt);
var j : LongInt;
begin
  j := i;
  while vList[j - k] > r do
    begin
      vList[j] := vList[j-k];
      j := j - k;
      if j <= k then break;
    end;
  vList[j] := r;
end;

//MergeSort
procedure TfrmPrincipal.MergeSort(var vList: array of LongInt; inicio,
  fim: LongInt);

 procedure merge(inicio,meio,fim : LongInt);
    var i,j,k : LongInt;
    begin
    i:=inicio;j:=meio+1;k:=inicio;
    while (i<=meio) and (j<=fim) do
      begin
      if vlist[i]<vlist[j] then
        begin
        TipoVetor2[k]:=vlist[i];inc(i);
        end
        else
        begin
        TipoVetor2[k]:=vlist[j];inc(j);
        end;
      inc(k)
      end;
    if j>fim then
      for j:=i to meio do
        begin
        TipoVetor2[k]:=vlist[j];inc(k)
        end
      else
      if i>meio then
        for i:=j to fim do
          begin
          TipoVetor2[k]:=vlist[i];inc(k);
          end;
    for i:=inicio to fim do
      vlist[i]:=TipoVetor2[i];
    end; { mergesort }

  var meio : LongInt;
  begin
  if inicio<fim then
    begin
    meio:=(fim+inicio) div 2;
    mergesort(vlist,inicio,meio);
    mergesort(vlist,meio+1,fim);
    merge(inicio,meio,fim)
    end
  end; { mergesort }


procedure TfrmPrincipal.cbxNumeroPosicoesChange(Sender: TObject);
begin
    lblNumeroElementos.Caption := cbxNumeroPosicoes.Text;
end;

procedure TfrmPrincipal.btnLimparTudoClick(Sender: TObject);
begin
    cmbbxTipoAlgoritmo.ItemIndex:=0;
    cbxNumeroPosicoes.ItemIndex:=0;
    memVetorOrdenado.Clear;
    memVetorOriginal.Clear;
    rdgpTipoCaso.ItemIndex:=-1;
    lblGerar.Caption:='00:00:00:000';
    lblOrdenar.Caption:='00:00:00:000';
    pnlTempo.Caption:='';
    btbtnGerar.Enabled := True;
    cbxNumeroPosicoes.Enabled := True;
    rdgpTipoCaso.Enabled := True;
    cmbbxTipoAlgoritmo.Enabled := False;
    btnLimparTudo.Enabled := False;
    btnLimparOrdenados.Enabled := False;
    btnExecutar.Enabled := False;
end;

procedure TfrmPrincipal.TimerGerarTimer(Sender: TObject);
begin
    HoraFinal:= Time;
    TempoGeracao := HoraFinal - HoraInicial;
end;

procedure TfrmPrincipal.TimerOrdenarTimer(Sender: TObject);
begin
  HoraFinal:= Time;
  TempoOrdenacao := HoraFinal - HoraInicial;
end;

procedure TfrmPrincipal.btbtnGerarClick(Sender: TObject);
begin
  TimerGerar.Enabled:=true;
  pnlTempo.Visible:=true;
  pnlTempo.Caption:='Gerando Elementos...';
  //Verifica se o usuario selecionou o sort e o n de elementos
 if cbxNumeroPosicoes.ItemIndex=0 then
  begin
    Application.MessageBox('Selecione o número de elementos!','Opção invalida',mb_ok+MB_ICONERROR);
    cbxNumeroPosicoes.SetFocus;
    exit;
  end;
   if rdgpTipoCaso.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione um tipo de caso!','Opção invalida',mb_ok+MB_ICONERROR);
    cmbbxTipoAlgoritmo.SetFocus;
    exit;
  end;
  Application.ProcessMessages;

  //Criando o array
  case rdgpTipoCaso.ItemIndex of
      0 : begin
            CriarArray('Otimista',(NumElementos));
          end;
      1 : begin
            CriarArray('Médio',(numElementos));
          end;
      2 : begin
            CriarArray('Pessimista',(numElementos));
          end;
    end;
    TempoGeracao := HoraFinal - HoraInicial;
    lblGerar.Caption := FormatDateTime('HH:MM:SS:ZZZ', TempoGeracao);
    TimerGerar.Enabled :=false;
    pnlTempo.Caption := 'Gerado';
    btnExecutar.Enabled := True;
    btnLimparTudo.Enabled := false;
    btnLimparOrdenados.Enabled := False;
    cmbbxTipoAlgoritmo.Enabled := True;
    rdgpTipoCaso.Enabled := True;
end;





procedure TfrmPrincipal.TimerAtualizarHoraTimer(Sender: TObject);
begin
    StatusBar1.Panels[2].Text := '                  ' + TimeToStr(time());
end;

procedure TfrmPrincipal.btnLimparOrdenadosClick(Sender: TObject);
begin
    memVetorOrdenado.Clear;
    lblOrdenar.Caption:='00:00:00:000';
    pnlTempo.Caption:='';
    btbtnGerar.Enabled := false;
    cbxNumeroPosicoes.Enabled := false;
    rdgpTipoCaso.Enabled := false;
    cmbbxTipoAlgoritmo.Enabled := true;
    btnLimparOrdenados.Enabled := False;
    btnLimparTudo.Enabled := False;
    btnExecutar.Enabled :=true;
end;

end.
