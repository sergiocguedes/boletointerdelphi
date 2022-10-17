{ *****************************************************************
  *****************************************************************
  ** Neste projeto é apresentado como consumir a API v2 do       **
  ** Banco Inter com autenticação OAUTH 2.0, utilizando o Delphi **
  ** e o componente Indy. Compatibilidade testada na versão do   **
  ** Delphi Rio, mas poderá funcionar em versão diferente.       **
  ** Desenvolvido por Sérgio Guedes                              **
  ** Baseado no prijeto do Delmar                                **
  ** https://github.com/delmardelima/Api_BancoInter_v2           **
  *****************************************************************
  ** Segue Meu Código Fonte nas redes sociais                    **
  ** Instagram: https://www.instagram.com/sergioguedes           **
  ** WhatsApp:  https://wa.me/5592993194403                      **
  ** Site:      https://www.meucodigofonte.com.br                **
  ***************************************************************** }

unit uFrm.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uController.BancoInter, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Vcl.StdCtrls, Vcl.ExtCtrls, DateUtils, ShellApi, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, JvExMask, JvToolEdit, JvBaseEdits, Vcl.Samples.Spin;

type
  TFrmPrincipal = class(TForm)
    LinkLabel1: TLinkLabel;
    pgcinter: TPageControl;
    tsgerarboleto: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    edtArqPDF: TEdit;
    Label8: TLabel;
    btnDownloadPDF: TButton;
    edtSituacao: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtValorPago: TEdit;
    btnConsultBoleto: TButton;
    mResult: TMemo;
    Panel1: TPanel;
    edtNossoNumero: TEdit;
    Label5: TLabel;
    Button1: TButton;
    mmomotivo_cancelamento: TMemo;
    Label4: TLabel;
    edtToken: TEdit;
    btnGetToken: TButton;
    cbbtipo_cancelamento: TComboBox;
    Label10: TLabel;
    Label1: TLabel;
    Button2: TButton;
    TabSheet1: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtclientid: TEdit;
    edtclient_secret: TEdit;
    edtcertkey: TEdit;
    edtcertificado: TEdit;
    edtscope: TEdit;
    Label21: TLabel;
    OpenDialog: TOpenDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pgcboleto: TPageControl;
    tspagador: TTabSheet;
    tsdadosboleto: TTabSheet;
    cbbregradesconto: TComboBox;
    Label11: TLabel;
    cbbregramulta: TComboBox;
    Label13: TLabel;
    cbbregramora: TComboBox;
    Label14: TLabel;
    edtSeuNumero: TEdit;
    Label3: TLabel;
    Label23: TLabel;
    edtvalorboleto: TEdit;
    dtpdatavenc: TDateTimePicker;
    Label22: TLabel;
    Label25: TLabel;
    edtqtddiascancvenc: TSpinEdit;
    cbbtipocliente: TComboBox;
    Label26: TLabel;
    edtcpfcnpj: TEdit;
    Label24: TLabel;
    edtnome: TEdit;
    Label27: TLabel;
    edtcep: TEdit;
    Label28: TLabel;
    edtendereco: TEdit;
    Label29: TLabel;
    Label31: TLabel;
    edtnumero: TEdit;
    Label30: TLabel;
    edtbairro: TEdit;
    Label33: TLabel;
    edtcidade: TEdit;
    Label34: TLabel;
    edtuf: TEdit;
    Label35: TLabel;
    edtcompl: TEdit;
    Label36: TLabel;
    edttelefone: TEdit;
    Label39: TLabel;
    Label38: TLabel;
    edtddd: TEdit;
    edtemail: TEdit;
    Label37: TLabel;
    Label32: TLabel;
    btnPostBoleto: TButton;
    edtlinha1: TEdit;
    Label40: TLabel;
    edtlinha2: TEdit;
    lbllinha2: TLabel;
    edttaxavalorboleto: TEdit;
    Label41: TLabel;
    dtpdatadesconto: TDateTimePicker;
    Label42: TLabel;
    dtpdatamulta: TDateTimePicker;
    Label43: TLabel;
    Label44: TLabel;
    edttaxavalormulta: TEdit;
    dtpdatajurosmora: TDateTimePicker;
    Label45: TLabel;
    Label46: TLabel;
    edttaxavalorjuros: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    tsresultadogerar: TTabSheet;
    Label6: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    edtLinhaDigitavel: TEdit;
    edtCodigoBarras: TEdit;
    chkfazdownloadboleto: TCheckBox;
    btnabrirboleto_env: TButton;
    edtboletocaminho_env: TEdit;
    lblboleto_env: TLabel;
    Button4: TButton;
    Label49: TLabel;
    edtnossonumero_retor: TEdit;
    btnavancarconfig: TButton;
    Label2: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGetTokenClick(Sender: TObject);
    procedure btnPostBoletoClick(Sender: TObject);
    procedure btnDownloadPDFClick(Sender: TObject);
    procedure btnConsultBoletoClick(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure FormShow(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnavancarconfigClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnabrirboleto_envClick(Sender: TObject);
  private
    { Private declarations }
    BancoInter: TBancoInter;
  public
     procedure GetDir(Edit: TEdit);
  end;

var
  FrmPrincipal: TFrmPrincipal;


implementation

{$R *.dfm}

procedure TFrmPrincipal.btnabrirboleto_envClick(Sender: TObject);
begin
  if FileExists(edtboletocaminho_env.Text) then
    ShellExecute(Handle, nil, PChar(edtboletocaminho_env.Text), nil, nil,
      SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.btnConsultBoletoClick(Sender: TObject);
begin
  if edtNossoNumero.Text = '' then
  begin
    ShowMessage('Informe o nosso número');
    Exit;
  end;

  BancoInter.NossoNumero := edtNossoNumero.Text;
  BancoInter.ConsultBoleto;

  edtSituacao.Text := BancoInter.Situacao;
  edtValorPago.Text := BancoInter.ValorPago.ToString;
end;

procedure TFrmPrincipal.btnDownloadPDFClick(Sender: TObject);
begin
  if edtNossoNumero.Text = '' then
  begin
    ShowMessage('Informe o nosso número');
    Exit;
  end;

  BancoInter.NossoNumero := edtNossoNumero.Text;
  // Metedo GET da API
  BancoInter.DownloadPDF;
  edtArqPDF.Text := BancoInter.ArqPDF;
  if FileExists(BancoInter.ArqPDF) then
    ShellExecute(Handle, nil, PChar(BancoInter.ArqPDF), nil, nil,
      SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.btnGetTokenClick(Sender: TObject);
begin
  if edtclientid.Text = '' then
  begin
    ShowMessage('Impossível Continuar: Informe o Client ID;');
    Exit;
  end;

  if edtclient_secret.Text = '' then
  begin
    ShowMessage('Impossível Continuar: Informe o Client Secret;');
    Exit;
  end;

  if edtcertificado.Text = '' then
  begin
    ShowMessage('Impossível Continuar: Informe o certificado.crt');
    Exit;
  end;

  if edtcertkey.Text = '' then
  begin
    ShowMessage('Impossível Continuar: Informe o certificado.key');
    Exit;
  end;

  BancoInter.CertFile := edtcertificado.Text;
  BancoInter.KeyFile := edtcertkey.Text;

  BancoInter.ClientID := edtclientid.Text;
  BancoInter.ClientSecret := edtclient_secret.Text;
  BancoInter.Scope := 'extrato.read boleto-cobranca.read boleto-cobranca.write';

  // Metedo GET da API
  BancoInter.Gerar_Token;

  if Not BancoInter.GetTokenResult then
    mResult.Lines.Add(BancoInter.GetTokenError)
  else
    edtToken.Text := BancoInter.Token;
end;

procedure TFrmPrincipal.btnPostBoletoClick(Sender: TObject);
begin
  if edtToken.Text = '' then
  begin
    ShowMessage('Clique no botão Gerar Token e gere um número de Token para continuar!');
    exit;
  end;

  edtNossoNumero.Text := '';
  edtCodigoBarras.Text := '';
  edtLinhaDigitavel.Text := '';

  //Campo Seu Número do título
  BancoInter.SeuNumero := edtSeuNumero.Text;
  BancoInter.ValorNominal := StrToFloat(edtvalorboleto.Text);
  BancoInter.DataVencimento := dtpdatavenc.Date;
  {Número de dias corridos após o vencimento para o cancelamento efetivo
    automático do boleto. (de 0 até 60)}
  BancoInter.numDiasAgenda := edtqtddiascancvenc.Value;

  // Não pode ter acento ou caracteres especiais na solicitação.
  // Dados fictícios, retirado do site 4devs.com.br/gerador_de_pessoas
  BancoInter.CpfCnpj := edtcpfcnpj.Text;

  if cbbtipocliente.ItemIndex = 0 then
    BancoInter.TipoPessoa := Fisica
   else
    BancoInter.TipoPessoa := Juridica;

  //BancoInter.TipoPessoa := 'FISICA'; // JURIDICA
  BancoInter.Nome := edtnome.Text;
  BancoInter.Endereco := edtendereco.Text;
  BancoInter.Numero := edtnumero.Text;
  BancoInter.Complemento := edtcompl.Text;
  BancoInter.Bairro := edtbairro.Text;
  BancoInter.Cidade := edtcidade.Text;
  BancoInter.UF := edtuf.Text;
  BancoInter.CEP := edtcep.Text;
  BancoInter.Email := edtemail.Text;
  BancoInter.DDD := edtddd.Text;
  BancoInter.Telefone := edttelefone.Text;

  BancoInter.Linha1 := edtlinha1.Text;
  BancoInter.Linha2 := edtlinha2.text;

  {
    Código de Desconto do título.

    NAOTEMDESCONTO - Não tem desconto.
    VALORFIXODATAINFORMADA - Valor fixo até a data informada.
    PERCENTUALDATAINFORMADA - Percentual até a data informada.
  }

  //VALORFIXODATAINFORMADA
  if cbbregradesconto.ItemIndex = 0 then
  begin
    BancoInter.CodigoDesconto := PercentualDataInformada;
    BancoInter.DataDesconto := incDay(date, 20);
    BancoInter.TaxaDesconto := StrToFloat(edttaxavalorboleto.Text); // 0 -> 100
  end;

  // PERCENTUALDATAINFORMADA
  if cbbregradesconto.ItemIndex = 0 then
  begin
    BancoInter.CodigoDesconto := PercentualDataInformada;
    BancoInter.DataDesconto := incDay(dtpdatadesconto.Date, 20);
    BancoInter.valorDesconto := StrToFloat(edttaxavalorboleto.Text); // 0 -> 100
  end;

  // ------- Multa ------------
  {
    Código de Multa do título.

    NAOTEMMULTA - Não tem multa
    VALORFIXO – Valor fixo
    PERCENTUAL - Percentual
  }

  // se for não tem multa
  if cbbregramulta.ItemIndex = 0 then
  begin
    BancoInter.CodigoMulta := NAOTEMMULTA;
    BancoInter.ValorMulta := 0;
    BancoInter.Taxamulta := 0;
    BancoInter.DataMulta :=  incDay(BancoInter.DataVencimento, 5);
  end;

  // se os juros for por valor fixo
  if cbbregramulta.ItemIndex = 1 then
  begin
    BancoInter.CodigoMulta := VALORFIXO;
    BancoInter.ValorMulta := StrToFloat(edttaxavalormulta.Text);
    BancoInter.Taxamulta := 0;
    BancoInter.DataMulta :=  incDay(BancoInter.DataVencimento, 5);
  end;

  // se for multa por percentual
  if cbbregramulta.ItemIndex = 2 then
  begin
    BancoInter.CodigoMulta := PERCENTUAL;
    BancoInter.Taxamulta := StrToFloat(edttaxavalormulta.Text);
    BancoInter.ValorMulta := 0;
    BancoInter.DataMulta := incDay(BancoInter.DataVencimento, 5);
  end;

   // --------- juros de mora -------------
  {
    codigoMora
    Código de Mora do título.

    VALORDIA - Valor ao dia
    TAXAMENSAL - Taxa mensal
    ISENTO - Isento
    CONTROLEDOBANCO - Controle do banco
  }


  //VALORDIA - Valor ao dia
  if cbbregramora.ItemIndex = 0 then
  begin
    BancoInter.CodigoMora := VALORDIA;
    BancoInter.ValorMora := 0;
    // leva em consideração a carencia de dias para cobrar os juros
    BancoInter.DataMora :=  incDay(BancoInter.DataVencimento, 5);
  end;

  //TAXAMENSAL - Taxa mensal
  if cbbregramora.ItemIndex = 1 then
  begin
    BancoInter.CodigoMora := TAXAMENSAL;
    BancoInter.TaxaMora := 1;
    // leva em consideração a carencia de dias para cobrar os juros
    BancoInter.DataMora :=  incDay(BancoInter.DataVencimento, 5);
  end;

  //ISENTO - Isento
  if cbbregramora.ItemIndex = 2 then
  begin
    BancoInter.CodigoMora := ISENTO;
    BancoInter.TaxaMora := 0;
    BancoInter.ValorMora := 0;
  end;

  // chama a rotina de gerar o boleto na api
  if BancoInter.GeraBoleto then
  begin
    // retorno do webservice
    edtSeuNumero.Text := BancoInter.SeuNumero;
    edtNossoNumero.Text := BancoInter.NossoNumero;
    edtnossonumero_retor.Text := BancoInter.NossoNumero;
    edtCodigoBarras.Text := BancoInter.CodigoBarras;
    edtLinhaDigitavel.Text := BancoInter.LinhaDigitavel;

    // Se consulta e gera o boleto automatico
    if chkfazdownloadboleto.Checked then
    begin
      Sleep(1000);

      try
        Application.ProcessMessages;
        BancoInter.NossoNumero := BancoInter.NossoNumero;

        // Metedo GET da API
        BancoInter.DownloadPDF;

        // retorno o boleto que foi baixado
        edtboletocaminho_env.Text := BancoInter.ArqPDF;

      except

      end;
    end;

    pgcboleto.ActivePage := tsresultadogerar;
  end
 else
  begin
    mResult.Lines.Add(BancoInter.PostBoletoError);
  end;

end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  if edtNossoNumero.Text = '' then
  begin
    ShowMessage('Informe o nosso número');
    Exit;
  end;

  if cbbtipo_cancelamento.Text = '' then
  begin
    ShowMessage('Informe um motivo para cancelamento');
    Exit;
  end;

  case cbbtipo_cancelamento.ItemIndex of
     0 :  BancoInter.Motivo_cancelamento := ACERTOS;
     1 :  BancoInter.Motivo_cancelamento := APEDIDODOCLIENTE;
     2 :  BancoInter.Motivo_cancelamento := PAGODIRETOAOCLIENTE;
     3 :  BancoInter.Motivo_cancelamento := SUBSTITUICAO;
  end;

  BancoInter.NossoNumero := edtNossoNumero.Text;

  //Pega o retorno do cancelamento
  if BancoInter.CancelaBoleto then
    mResult.Lines.Text := BancoInter.Retorno_cancelamento;

end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  // se o arquivo existir abre ele
  if FileExists(edtArqPDF.Text) then
    ShellExecute(Handle, nil, PChar(edtArqPDF.Text), nil, nil,
      SW_SHOWNORMAL);
end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
begin
  pgcboleto.ActivePage := tsdadosboleto;
end;

procedure TFrmPrincipal.btnavancarconfigClick(Sender: TObject);
begin
  if edtclientid.Text = '' then
  begin
    ShowMessage('Informe o campo Client id');
    exit;
  end;

  if edtclient_secret.Text = '' then
  begin
    ShowMessage('Informe o campo Client secret');
    exit;
  end;

  if edtcertificado.Text = '' then
  begin
    ShowMessage('Informe o campo certificado');
    exit;
  end;

  if edtcertkey.Text = '' then
  begin
    ShowMessage('Informe o campo certificado key');
    exit;
  end;

  pgcinter.ActivePage := tsgerarboleto;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  BancoInter := TBancoInter.Create(Self);

  { ATENÇÃO!!! }
  { INFORMAÇÕES RETIRADA DA INTERNET BANKING }
  { NECESSARIO GERAR APLICAÇÃO NO MENU API DO BANCO INTER }
  { https://ajuda.bancointer.com.br/pt-BR/articles/4284884-como-cadastrar-uma-api }

  BancoInter.CertFile := ExtractFilePath(ParamStr(0)) + 'certificado.crt';
  BancoInter.KeyFile := ExtractFilePath(ParamStr(0)) + 'certificado.key';

  BancoInter.ClientID := '';
  BancoInter.ClientSecret := '';
  BancoInter.Scope := 'extrato.read boleto-cobranca.read boleto-cobranca.write';
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  BancoInter.Free;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  pgcinter.ActivePageIndex := 0;
  pgcboleto.ActivePageIndex := 0 ;

  dtpdatavenc.Date := incDay(date, 30);
  edtqtddiascancvenc.Value := 60;

  dtpdatadesconto.Date := incDay(date, 20);
  dtpdatamulta.Date := incDay(date, 35);
  dtpdatajurosmora.Date := incDay(date, 35);

  // Verifica se os certificados estão na pasta do sistema
  if FileExists(ExtractFilePath(ParamStr(0)) + 'certificado.crt') then
    edtcertificado.Text := ExtractFilePath(ParamStr(0)) + 'certificado.crt';

  if FileExists(ExtractFilePath(ParamStr(0)) + 'certificado.key') then
    edtcertkey.Text :=ExtractFilePath(ParamStr(0)) + 'certificado.key';

end;

procedure TFrmPrincipal.GetDir(Edit: TEdit);
begin
  OpenDialog.InitialDir := ExtractFileDir(Edit.Text);
  if (OpenDialog.Execute) then
    Edit.Text := OpenDialog.FileName;
end;

procedure TFrmPrincipal.Label18Click(Sender: TObject);
begin
  mResult.Lines.Clear;
end;

procedure TFrmPrincipal.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, nil, PChar(Link), nil, nil, 1);
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  GetDir(edtcertificado);
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  GetDir(edtcertkey);
end;

end.
