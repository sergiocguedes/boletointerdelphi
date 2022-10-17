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

unit uController.BancoInter;

interface

uses
  System.Classes, System.JSON, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdSSLOpenSSL,
  IdSSLOpenSSLHeaders, IdTCPClient, System.SysUtils, System.DateUtils, IdHTTP,
  IdCoderMIME,uLkJSON;

type
  TipoPessoa = (
    Fisica,
    Juridica);

 TipoMora = (
    ValorDia,
    TaxaMensal,
    Isento,
    ControledoBanco);

  TipoMulta = (
    NaoTemMulta,
    ValorFixo,
    Percentual);

  TipoDesconto = (
     NaoTemDesconto,
     ValorFixoDataInformada,
     PercentualDataInformada);

  Tipo_cancelamento = (
    Acertos,
    PagoDiretoAoCliente,
    SUBSTITUICAO,
    APedidoDoCliente);

  TBancoInter = class(TComponent)
  private
    FLogFile: String;
    FDirFile: String;
    FDirBin: String;
    FArqPDF: String;
    FCertFile: String;
    FKeyFile: String;
    FClientID: String;
    FClientSecret: String;
    FScope: String;
    FToken: String;
    FTokenTime: TDateTime;
    FSeuNumero: String;
    FNossoNumero: String;
    FCodigoBarras: String;
    FLinhaDigitavel: String;
    FValorNominal: Double;
    FDataVencimento: TDate;
    FCpfCnpj: String;
    FNome: String;
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FUF: String;
    FCEP: String;
    FEmail: String;
    FDDD: String;
    FTelefone: String;
    FLinha1: String;
    FLinha2: String;
    FDataDesconto: TDate;
    FTaxaDesconto: Double;
    FDataMulta: TDate;
    FSituacao: String;
    FValorPago: Double;
    FGetTokenResult: Boolean;
    FGetTokenError: String;
    FPostBoletoError: String;
    FPostBoletoResult: Boolean;
    FDownloadPDFError: String;
    FDownloadPDFResult: Boolean;
    FValorMulta: Double;
    FValorMora: Double;
    FDataMora: TDate;
    FTaxaMora: Double;
    FTaxaMulta: Double;
    ftipopessoa: TipoPessoa;
    FValorDesconto: Double;
    FnumDiasAgenda: integer;
    FCodigoDesconto: TipoDesconto;
    FCodigoMora: TipoMora;
    FCodigoMulta: TipoMulta;
    FMotivo_cancelamento: Tipo_cancelamento;
    FRetorno_cancelamento: String;
    procedure GravarLog(value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property LogFile: String read FLogFile write FLogFile;
    property DirFile: String read FDirFile write FDirFile;
    property DirBin: String read FDirBin write FDirBin;
    property ArqPDF: String read FArqPDF write FArqPDF;

    property CertFile: String read FCertFile write FCertFile;
    property KeyFile: String read FKeyFile write FKeyFile;
    property ClientID: String read FClientID write FClientID;
    property ClientSecret: String read FClientSecret write FClientSecret;
    property Scope: String read FScope write FScope;
    property Token: String read FToken write FToken;
    property TokenTime: TDateTime read FTokenTime write FTokenTime;

    property SeuNumero: String read FSeuNumero write FSeuNumero;

    property ValorNominal: Double read FValorNominal write FValorNominal;
    property DataVencimento: TDate read FDataVencimento write FDataVencimento;
    property numDiasAgenda: integer read FnumDiasAgenda write FnumDiasAgenda;

    property TipoPessoa: TipoPessoa read ftipopessoa write ftipopessoa;
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    property Nome: String read FNome write FNome;
    property Endereco: String read FEndereco write FEndereco;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;
    property Email: String read FEmail write FEmail;
    property DDD: String read FDDD write FDDD;
    property Telefone: String read FTelefone write FTelefone;
    property Linha1: String read FLinha1 write FLinha1;
    property Linha2: String read FLinha2 write FLinha2;

    property CodigoDesconto: TipoDesconto read FCodigoDesconto write FCodigoDesconto;
    property DataDesconto: TDate read FDataDesconto write FDataDesconto;
    property TaxaDesconto: Double read FTaxaDesconto write FTaxaDesconto;
    property ValorDesconto: Double read FValorDesconto write FValorDesconto;

    property CodigoMulta: TipoMulta read FCodigoMulta write FCodigoMulta;
    property DataMulta: TDate read FDataMulta write FDataMulta;
    property ValorMulta: Double read FValorMulta write FValorMulta;
    property TaxaMulta: Double read FTaxaMulta write FTaxaMulta;

    // juros de mora
    property CodigoMora: TipoMora read FCodigoMora write FCodigoMora;
    property DataMora: TDate read FDataMora write FDataMora;
    property ValorMora: Double read FValorMora write FValorMora;
    property TaxaMora: Double read FTaxaMora write FTaxaMora;

    // retorno
    property NossoNumero: String read FNossoNumero write FNossoNumero;
    property CodigoBarras: String read FCodigoBarras write FCodigoBarras;
    property LinhaDigitavel: String read FLinhaDigitavel write FLinhaDigitavel;

    // cancelamento
    property Motivo_cancelamento : Tipo_cancelamento read FMotivo_cancelamento write FMotivo_cancelamento;

    // retorno de consulta
    property Situacao: String read FSituacao write FSituacao;
    property ValorPago: Double read FValorPago write FValorPago;

    property GetTokenResult: Boolean read FGetTokenResult write FGetTokenResult;
    property GetTokenError: String read FGetTokenError write FGetTokenError;

    property PostBoletoError: String read FPostBoletoError
      write FPostBoletoError; // DownloadPDF

    property DownloadPDFResult: Boolean read FDownloadPDFResult
      write FDownloadPDFResult;

    property DownloadPDFError: String read FDownloadPDFError
      write FDownloadPDFError;

    property Retorno_cancelamento : String read FRetorno_cancelamento
      write FRetorno_cancelamento;

    procedure Gerar_Token;
    function GeraBoleto: Boolean;
    procedure DownloadPDF;
    procedure ConsultBoleto;
    function CancelaBoleto: Boolean;
    function Valida_Dados : Boolean;

    function Monta_Json_Gera_Boleto: Tstringlist;

    procedure Configura_http_cabecalho(http: TIdHTTP);

    function RetTipoPessoa(valor:TipoPessoa):string;
    function RetCodigoDesconto(valor:TipoDesconto):string;
    function RetCodigoMora(valor:TipoMora):string;
    function RetCodigoMulta(valor:TipoMulta):string;
    function RetData(data:tdate):string;
    function RetCodigoBaixa(valor:Tipo_cancelamento):string;
    //Remove o acento dos nomes e endereços do boleto
    function Remove_Acentos(S: String): String;

    function strzero(valor1:integer;valor2:integer):string;
    function numdos(valor:double):string;
  end;

Const
  // Const dos endereços da endpoint da api
  URL_GERAR_TOKEN = 'https://cdpj.partners.bancointer.com.br/oauth/v2/token';
  URL_GERAR_BOLETO = 'https://cdpj.partners.bancointer.com.br/cobranca/v2/boletos';
  URL_PDF = 'https://cdpj.partners.bancointer.com.br/cobranca/v2/boletos/';
  URL_CONSULTAR = 'https://cdpj.partners.bancointer.com.br/cobranca/v2/boletos/';
  URL_CANCELAR = 'https://cdpj.partners.bancointer.com.br/cobranca/v2/boletos/';

  // Cons para validação
  Campo_obrigatorio = 'Campo obrigatório não preenchido: ';

implementation

{ TBancoInter }

constructor TBancoInter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DirBin := ExtractFilePath(ParamStr(0));
  LogFile := ChangeFileExt(ParamStr(0), '.log');
  DirFile := ExtractFilePath(ParamStr(0)) + 'Boletos\';
  if Not DirectoryExists(DirFile) then
    ForceDirectories(DirFile);

  IdSSLOpenSSLHeaders.IdOpenSSLSetLibPath(DirBin);
end;

destructor TBancoInter.Destroy;
begin
  inherited Destroy;
end;

procedure TBancoInter.Gerar_Token;
var
  Params: TStringList;
  Resp: TStringStream;
  Jso: TJSONObject;
  JsoPair: TJSONPair;
  HTTP: TIdHTTP;
  IOHandle: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    Params := TStringList.Create;
    Resp := TStringStream.Create;

    HTTP := TIdHTTP.Create(nil);
    Configura_http_cabecalho(http);

   { HTTP.Request.BasicAuthentication := False;
    HTTP.Request.UserAgent :=
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    IOHandle := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
    IOHandle.SSLOptions.Method := sslvTLSv1_2;
    IOHandle.SSLOptions.Mode := sslmClient;
    IOHandle.SSLOptions.CertFile := CertFile;
    IOHandle.SSLOptions.KeyFile := KeyFile;
    HTTP.IOHandler := IOHandle;
    }
    HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    HTTP.Request.CharSet := 'UTF-8';

    Params.Add('client_id=' + ClientID);
    Params.Add('client_secret=' + ClientSecret);
    Params.Add('scope=' + Scope);
    Params.Add('grant_type=client_credentials');

    try
      HTTP.Post(URL_GERAR_TOKEN, Params, Resp);

      if HTTP.ResponseCode = 200 then
      begin
        GetTokenResult := true;

        try
          Jso := TJSONObject.Create;
          Jso.Parse(Resp.Bytes, 0);

          for JsoPair in Jso do
          begin
            if JsoPair.JsonString.value = 'access_token' then
              Token := JsoPair.JsonValue.value;
            TokenTime := IncSecond(now, 3600);
          end;
        finally
          FreeAndNil(Jso);
        end;
      end
      else
        GetTokenError := 'Error: ' + HTTP.ResponseText;
    except
      on e: EIdHTTPProtocolException do
        GetTokenError := 'Error: ' + HTTP.ResponseText + ' - ' + e.ErrorMessage;
    end;
  finally
    FreeAndNil(Params);
    FreeAndNil(Resp);
  end;
end;

procedure TBancoInter.GravarLog(value: String);
var
  txtLog: TextFile;
begin
  AssignFile(txtLog, LogFile);
  if FileExists(LogFile) then
    Append(txtLog)
  else
    Rewrite(txtLog);
  Writeln(txtLog, FormatDateTime('dd/mm/YY hh:mm:ss - ', now) + value);
  CloseFile(txtLog);
end;

function TBancoInter.Monta_Json_Gera_Boleto: Tstringlist;
var
  Dados:tstringlist;
begin
  Dados := TStringList.Create;
  Dados.Add('{');

  //dados do boleto

  Dados.Add('   "seuNumero":"' + SeuNumero + '",');
  Dados.Add('   "valorNominal":' + numdos(ValorNominal) + ',');
  Dados.Add('   "dataVencimento":"' + RetData(DataVencimento) + '",');
  Dados.Add('   "numDiasAgenda":"' + IntToStr(NumDiasAgenda) + '"');

  // dados do pagador
  Dados.Add('   "pagador":{');
  dados.Add('      "cpfCnpj":"' +  CpfCnpj + '",');
  dados.Add('      "tipoPessoa":"' + RetTipoPessoa(TipoPessoa) + '"');
  dados.Add('      "nome":"' + Remove_Acentos(Nome) + '",');
  dados.Add('      "endereco":"' + Remove_Acentos(Endereco) + '",');
  dados.Add('      "numero":"' + Numero + '",');
  dados.Add('      "complemento":"' + Remove_Acentos(Complemento) + '",');
  dados.Add('      "bairro":"' + Bairro + '",');
  dados.Add('      "cidade":"' + Cidade + '",');
  dados.Add('      "uf":"' +UF + '",');
  dados.Add('      "cep":"' + CEP + '",');
  dados.Add('      "email":"'  + Remove_Acentos(Email) + '",');
  dados.Add('      "ddd":"' + DDD + '",');
  dados.Add('      "telefone":"' + Telefone + '",');
  Dados.Add('   },');

  //mensagem no boleto
  Dados.Add('   "mensagem":{');
  dados.Add('      "linha1":"' + Linha1  + '",');
  dados.Add('      "linha2":"' + Linha2 + '",');
 // dados.Add('      "linha3":"' + Mensagem.Mensagem3 + '",');
 // dados.Add('      "linha4":"' + Mensagem.Mensagem4 + '",');
 // dados.Add('      "linha5":"' + Mensagem.Mensagem5 + '"');
  Dados.Add('   },');

  Dados.Add('   "desconto1":{');
  dados.Add('      "codigoDesconto":"' + RetCodigoDesconto(CodigoDesconto) + '",');
  dados.Add('      "taxa":' + numdos(TaxaDesconto) +  ',');
  dados.Add('      "valor":' + numdos(ValorDesconto) + ',');
  dados.Add('      "data":"' + RetData(DataDesconto) + '"');
  Dados.Add('   },');

 // Dados.Add('   "desconto2":{');
 // dados.Add('      "codigoDesconto":"' + RetCodigoDesconto(CodigoDesconto) + '",');
 // dados.Add('      "taxa":' + numdos(Desconto2.Taxa) +  ',');
 // dados.Add('      "valor":' + numdos(Desconto2.Valor) + ',');
 // dados.Add('      "data":"' + RetData(desconto2.DataDesconto) + '"');
 // Dados.Add('   },');

  //Dados.Add('   "desconto3":{');
 // dados.Add('      "codigoDesconto":"' + RetCodigoDesconto(desconto3.CodigoDesconto) + '",');
 // dados.Add('      "taxa":' + numdos(Desconto3.Taxa) +  ',');
 // dados.Add('      "valor":' + numdos(Desconto3.Valor) + ',');
  //dados.Add('      "data":"' + RetData(desconto3.DataDesconto) + '"');
 // Dados.Add('   },');

  //multa a ser aplicada
  if CodigoMulta = NAOTEMMULTA then
  begin
    Dados.Add('   "multa":{');
    dados.Add('      "codigoMulta":" NAOTEMMULTA ",');
    dados.Add('      "data":"' + RetData(DataMulta) + '",');
    dados.Add('      "valor": 0,');
    dados.Add('      "taxa": 0 ');
    Dados.Add('   },');
  end;

  if CodigoMulta = VALORFIXO then
  begin
    Dados.Add('   "multa":{');
    dados.Add('      "codigoMulta":"' + RetCodigoMulta(CodigoMulta) + '",');
    dados.Add('      "data":"' + RetData(DataMulta) + '",');
    dados.Add('      "valor":' + numdos(ValorMulta) + ',');
    dados.Add('      "taxa": 0');
    Dados.Add('   },');
  end;

  if CodigoMulta = PERCENTUAL then
  begin
    Dados.Add('   "multa":{');
    dados.Add('      "codigoMulta":"' + RetCodigoMulta(CodigoMulta) + '",');
    dados.Add('      "data":"' + RetData(DataMulta) + '",');
    dados.Add('      "valor": 0,');
    dados.Add('      "taxa":' + numdos(TaxaMulta) );
    Dados.Add('   },');
  end;

  // ---- mora --------------

  //mora diaria
  if CodigoMora = VALORDIA then
  begin
    Dados.Add('   "mora":{');
    dados.Add('      "codigoMora":"' + RetCodigoMora(CodigoMora) + '",');
    dados.Add('      "data":"' + RetData(DataMora) + '",');
    dados.Add('      "valor":' + numdos(ValorMora) + ',');
    dados.Add('      "taxa": 0' );
    Dados.Add('   },');
  end;

  //mora diaria
  if CodigoMora = TAXAMENSAL then
  begin
    Dados.Add('   "mora":{');
    dados.Add('      "codigoMora":"' + RetCodigoMora(CodigoMora) + '",');
    dados.Add('      "data":"' + RetData(DataMora) + '",');
    dados.Add('      "valor":0 ,');
    dados.Add('      "taxa":' + numdos(TaxaMora) );
    Dados.Add('   },');
  end;

  if CodigoMora = ISENTO then
  begin
    Dados.Add('   "mora":{');
    dados.Add('      "codigoMora":"' + RetCodigoMora(CodigoMora) + '",');
    //dados.Add('      "data":"' + RetData(DataMora) + '",');
    dados.Add('      "valor": 0 ,');
    dados.Add('      "taxa":0 ');
    Dados.Add('   },');
  end;

  if CodigoMora = CONTROLEDOBANCO then
  begin
    Dados.Add('   "mora":{');
    dados.Add('      "codigoMora":"' + RetCodigoMora(CodigoMora) + '",');
    dados.Add('      "data":"' + RetData(DataMora) + '",');
    dados.Add('      "valor":' + numdos(ValorMora) + ',');
    dados.Add('      "taxa":' + numdos(TaxaMora) );
    Dados.Add('   },');
  end;

 // Dados.Add('   "cnpjCPFBeneficiario":"' + CPF_CNPJ_Beneficiario + '",');
  Dados.Add('}');
  result := dados;
end;

function TBancoInter.numdos(valor: double): string;
var
  vtexto,resultado:string;
begin
  vtexto    := FloatToStr(valor);
  resultado := StringReplace(vtexto,'.','',[rfReplaceAll]);
  resultado := StringReplace(resultado,',','.',[rfReplaceAll]);
  result    := trim(resultado);
end;

function TBancoInter.GeraBoleto: Boolean;
var
  HTTP: TIdHTTP;
  ListParams: TStringList;
  JsonStreamEnvio, Resp: TStringStream;
  Jso: TJSONObject;
  JsoPair: TJSONPair;

  js:TlkJSONobject;
  SJson:string;
  i : integer;
begin
  result := false;

  Valida_Dados;

  try
    ListParams := TStringList.Create;
    Resp := TStringStream.Create;

    HTTP := TIdHTTP.Create(nil);
    Configura_http_cabecalho(HTTP);

    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.Accept := 'application/json';
    HTTP.Request.CharSet := 'UTF-8';
    HTTP.Request.CustomHeaders.FoldLines := False;
    HTTP.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);


    ListParams.text := Monta_Json_Gera_Boleto.Text;
    js := TlkJSON.ParseText(ListParams.Text) as TlkJSONobject;
    i:=0;
    SJson := GenerateReadableText(js,i);

    JsonStreamEnvio   := TStringStream.Create(SJson);
    ListParams.Clear;

    try
      HTTP.Post(URL_GERAR_BOLETO, JsonStreamEnvio, Resp);

      if HTTP.ResponseCode = 200 then
      begin

        try
          Jso := TJSONObject.Create;
          Jso.Parse(Resp.Bytes, 0);
          for JsoPair in Jso do
          begin
            if JsoPair.JsonString.value = 'seuNumero' then
              SeuNumero := JsoPair.JsonValue.value
            else if JsoPair.JsonString.value = 'nossoNumero' then
              NossoNumero := JsoPair.JsonValue.value
            else if JsoPair.JsonString.value = 'codigoBarras' then
              CodigoBarras := JsoPair.JsonValue.value
            else if JsoPair.JsonString.value = 'linhaDigitavel' then
              LinhaDigitavel := JsoPair.JsonValue.value;
          end;
        finally
          FreeAndNil(Jso);
        end;

        result := true;
      end
     else
      begin
        PostBoletoError := 'Error: ' + IntToStr(HTTP.ResponseCode) + ' - ' +
          Resp.DataString;
        result := false;
      end;

    except
      on e: EIdHTTPProtocolException do
        PostBoletoError := 'Error: ' + HTTP.ResponseText + ' - ' +
          e.ErrorMessage;
    end;


  finally
    FreeAndNil(ListParams);
    FreeAndNil(Resp);
    FreeAndNil(JsonStreamEnvio);
    //FreeAndNil(IOHandle);
    FreeAndNil(HTTP);
  end;
end;

function TBancoInter.Remove_Acentos(S: String): String;
const
  StrA = 'áéíóúàèìòùãõâêîôûçüÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕÇÜ-';
  StrB = 'aeiouaeiouaoaeioucuAEIOUAEIOUAEIOUAOCU';
var
  I, aPos: Integer;
begin
  for I := 1 to Length(S) do
  begin
    aPos := Pos(S[I], StrA);
    if aPos > 0 then
      S[I] := StrB[aPos];
  end;

  result := S;
end;

function TBancoInter.RetCodigoBaixa(valor: Tipo_cancelamento): string;
begin
  case valor  of
    Acertos              :   result := 'ACERTOS';// (cancelado por acertos)
    APedidoDoCliente     :   result := 'APEDIDODOCLIENTE'; //(cancelado a pedido do cliente)
    PagoDiretoAoCliente  :   result := 'PAGODIRETOAOCLIENTE'; //(cancelado por ter sido pago direto ao cliente)
    SUBSTITUICAO         :   result := 'SUBSTITUICAO';//(cancelado por substituição)
  end;
end;

function TBancoInter.RetCodigoDesconto(valor: TipoDesconto): string;
begin
  case valor of
    NaoTemDesconto:                   result := 'NAOTEMDESCONTO';
    ValorFixoDataInformada:           result := 'VALORFIXODATAINFORMADA';
    PercentualDataInformada:          result := 'PERCENTUALDATAINFORMADA';
  end;
end;

function TBancoInter.RetCodigoMora(valor: TipoMora): string;
begin
  case valor of
    ValorDia: result   := 'VALORDIA';
    TaxaMensal: result := 'TAXAMENSAL';
    Isento: result     := 'ISENTO';
    ControledoBanco: result     := 'CONTROLEDOBANCO';
  end;
end;

function TBancoInter.RetCodigoMulta(valor: TipoMulta): string;
begin
  case valor of
    NaoTemMulta: result := 'NAOTEMMULTA';
    ValorFixo:   result := 'VALORFIXO';
    Percentual:  result := 'PERCENTUAL';
  end;
end;

//Formato aceito: YYYY-MM-DD
function TBancoInter.RetData(data: tdate): string;
var
  year,month,day:word;
begin
  DecodeDate(data,year,month,day);
  if year<2021 then
     result := ''
  else
     result := strzero(year,4)+ '-' + strzero(month,2) + '-' + strzero(day,2);
end;

function TBancoInter.RetTipoPessoa(valor: TipoPessoa): string;
begin
  case valor of
    Fisica: result := 'FISICA' ;
    Juridica: result := 'JURIDICA' ;
  end;
end;

function TBancoInter.strzero(valor1, valor2: integer): string;
var
monta:string;
tira,ia:integer;
begin
  if valor2=0 then
     begin
       result:='';
       exit;
     end;
  monta:=trim(inttostr(valor1));
  tira:=length(monta);
  if tira>valor2 then
     result := inttostr(valor1);
  tira:=valor2-tira;
  monta:='';
  for ia:=1 to tira do
    monta:=monta+'0';
  monta:=monta+trim(inttostr(valor1));
  result := monta
end;

function TBancoInter.Valida_Dados: Boolean;
begin
  result := False;

  if (Token = '') or (TokenTime <= now) then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Token OAuth não gerado!');
  end;

  if (ValorNominal <=0) then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Valor do Boleto!');
  end;

  if DataVencimento < date then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Seu Número!');
  end;

  if CpfCnpj = '' then
  begin
    Raise exception.Create(Campo_obrigatorio + 'CPF / CNPJ!');
  end;

  if (Nome = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Nome do cliente!');
  end;

  if (Endereco = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Endereco!');
  end;

  if (Numero = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Numero!');
  end;

  if (Bairro = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Bairro!');
  end;

  if (Cidade = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Cidade!');
  end;

  if (UF = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'UF!');
  end;

  if (CEP = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'CEP!');
  end;

  if (Email = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Email!');
  end;

  if (DDD = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'DDD!');
  end;

  if (Telefone = '') then
  begin
    Raise exception.Create(Campo_obrigatorio + 'Telefone!');
  end;


end;

procedure TBancoInter.DownloadPDF;
var
  RespPDF: TStringStream;
  wJSONObj: TJSONObject;
  wJSONV: TJSONValue;
  wPDF, URI_PDF_FINAL: String;
  MStream: TMemoryStream;
  Decoder: TIdDecoderMIME;
  FileDownload: TFileStream;
  HTTPBaixarPDF: TIdHTTP;
  IOHandleBaixarPDF: TIdSSLIOHandlerSocketOpenSSL;
begin
  if (Token = '') or (TokenTime <= now) then
  begin
    DownloadPDFError := 'Error: Token OAuth não gerado ou venceu!';
    exit;
  end;
  if (NossoNumero = '') then
  begin
    DownloadPDFError := 'Error: NossoNumero não informado!';
    exit;
  end;
  try
    RespPDF := TStringStream.Create;

    HTTPBaixarPDF := TIdHTTP.Create(nil);
    HTTPBaixarPDF.Request.BasicAuthentication := False;
    HTTPBaixarPDF.Request.UserAgent :=
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    IOHandleBaixarPDF := TIdSSLIOHandlerSocketOpenSSL.Create(HTTPBaixarPDF);
    IOHandleBaixarPDF.SSLOptions.Method := sslvTLSv1_2;
    IOHandleBaixarPDF.SSLOptions.Mode := sslmClient;
    IOHandleBaixarPDF.SSLOptions.CertFile := CertFile;
    IOHandleBaixarPDF.SSLOptions.KeyFile := KeyFile;
    HTTPBaixarPDF.IOHandler := IOHandleBaixarPDF;
    HTTPBaixarPDF.Request.Accept := 'application/json';
    HTTPBaixarPDF.Request.CharSet := 'UTF-8';
    HTTPBaixarPDF.Request.CustomHeaders.FoldLines := False;
    HTTPBaixarPDF.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);

    try
      URI_PDF_FINAL := URL_PDF + NossoNumero + '/pdf';
      HTTPBaixarPDF.Get(URI_PDF_FINAL, RespPDF);

      if HTTPBaixarPDF.ResponseCode = 200 then
      begin
        DownloadPDFResult := true;
        try
          wJSONObj := TJSONObject.Create;

          wJSONV := TJSONObject.ParseJSONValue(RespPDF.DataString);
          wJSONObj := TJSONObject(wJSONV);
          wPDF := wJSONObj.GetValue('pdf').value;

          Decoder := TIdDecoderMIME.Create(nil);
          MStream := TMemoryStream.Create;

          Decoder.DecodeStream(wPDF, MStream);
          ArqPDF := DirFile + NossoNumero + '.pdf';
          MStream.SaveToFile(ArqPDF);
        finally
          FreeAndNil(wJSONObj);
          //FreeAndNil(wJSONV);
          FreeAndNil(Decoder);
          FreeAndNil(MStream);
        end;
      end
      else
        DownloadPDFError := 'Error: ' + IntToStr(HTTPBaixarPDF.ResponseCode) +
          ' - ' + RespPDF.DataString;
    except
      on e: EIdHTTPProtocolException do
        DownloadPDFError := 'Error: ' + HTTPBaixarPDF.ResponseText + ' - ' +
          e.ErrorMessage;
    end;
  finally
    FreeAndNil(RespPDF);
    FreeAndNil(IOHandleBaixarPDF);
    FreeAndNil(HTTPBaixarPDF);
  end;
end;

function TBancoInter.CancelaBoleto: Boolean;
var
  HTTP: TIdHTTP;
  IOHandle: TIdSSLIOHandlerSocketOpenSSL;
  DadosJson: TStringList;
  JsonStreamEnvio, Resp: TStringStream;
  Jso: TJSONObject;
  JsoPair: TJSONPair;
  js:TlkJSONobject;
  SJson:string;
  i : integer;
  URI_CONSULT_FINAL :  string;
begin
  Result := false;

  if (Token = '') then
  begin
    PostBoletoError := 'Error: Token OAuth!';
    exit;
  end;

  try
    DadosJson := TStringList.Create;
    Resp := TStringStream.Create;

    HTTP := TIdHTTP.Create(nil);

    HTTP.Request.BasicAuthentication := False;
    HTTP.Request.UserAgent :=
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';

    IOHandle := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
    IOHandle.SSLOptions.Method := sslvTLSv1_2;
    IOHandle.SSLOptions.Mode := sslmClient;
    IOHandle.SSLOptions.CertFile := CertFile;
    IOHandle.SSLOptions.KeyFile := KeyFile;

    HTTP.IOHandler := IOHandle;
    HTTP.Request.ContentType := 'application/json';
    HTTP.Request.Accept := 'application/json';
    HTTP.Request.CharSet := 'UTF-8';
    HTTP.Request.CustomHeaders.FoldLines := False;
    HTTP.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);

    SJson             :='{"motivoCancelamento"'+RetCodigoBaixa(Motivo_cancelamento)+'"}';
    JsonStreamEnvio   := TStringStream.Create(SJson);

    try
      URI_CONSULT_FINAL := URL_CANCELAR + NossoNumero +'/cancelar';
      HTTP.Post(URI_CONSULT_FINAL, JsonStreamEnvio, Resp);

      if HTTP.ResponseCode = 204 then
      begin
        if Resp.DataString<>'' then
        begin
          DadosJson.add(Resp.DataString);

          //aqui tratamos os dados recebidos
          js := TlkJSON.ParseText(DadosJson.Text) as TlkJSONobject;
          i:=0;
          SJson := GenerateReadableText(js,i);
          DadosJson.Clear;

          DadosJson.Add(SJson);
        end
       else
         DadosJson.Add('Cancelamento em processso, acompanhe o processamento no app!');

        result := true;
      end
      else
      begin
        result := false;
        DadosJson.Add('Código de retorno: '+inttostr(HTTP.ResponseCode));
        DadosJson.Add('');

        GravarLog('Erro: ' + IntToStr(HTTP.ResponseCode) + ' - ' +
          Resp.DataString);
      end;

      Retorno_cancelamento := DadosJson.Text;

    finally
      FreeAndNil(DadosJson);
      FreeAndNil(Resp);
      FreeAndNil(JsonStreamEnvio);
      FreeAndNil(IOHandle);
      FreeAndNil(HTTP);
    end;
  except
    on ex: exception do
      GravarLog('Erro ao cancelar boleto: ' + ex.Message);
  end;
end;

procedure TBancoInter.Configura_http_cabecalho(http: TIdHTTP);
var
  IOHandle: TIdSSLIOHandlerSocketOpenSSL;
begin
 { HTTP.Request.BasicAuthentication := False;
  HTTP.Request.UserAgent :=
    'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';

  IOHandle := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  IOHandle.SSLOptions.Method := sslvTLSv1_2;
  IOHandle.SSLOptions.Mode := sslmClient;
  IOHandle.SSLOptions.CertFile := CertFile;
  IOHandle.SSLOptions.KeyFile := KeyFile;
  HTTP.IOHandler := IOHandle;
  HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
  HTTP.Request.CharSet := 'UTF-8';}


  http.Request.BasicAuthentication := False;
  http.Request.UserAgent :=
    'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';

  IOHandle := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  IOHandle.SSLOptions.Method := sslvTLSv1_2;
  IOHandle.SSLOptions.Mode := sslmClient;
  IOHandle.SSLOptions.CertFile := CertFile;
  IOHandle.SSLOptions.KeyFile := KeyFile;
  HTTP.IOHandler := IOHandle;

end;

procedure TBancoInter.ConsultBoleto;
var
  RespConsult: TStringStream;
  Jso: TJSONObject;
  JsoPair: TJSONPair;
  URI_CONSULT_FINAL: String;
  HTTPConsult: TIdHTTP;
  IOHandleConsult: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    RespConsult := TStringStream.Create;

    HTTPConsult := TIdHTTP.Create(nil);
    HTTPConsult.Request.BasicAuthentication := False;
    HTTPConsult.Request.UserAgent :=
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
    IOHandleConsult := TIdSSLIOHandlerSocketOpenSSL.Create(HTTPConsult);
    IOHandleConsult.SSLOptions.Method := sslvTLSv1_2;
    IOHandleConsult.SSLOptions.Mode := sslmClient;
    IOHandleConsult.SSLOptions.CertFile := CertFile;
    IOHandleConsult.SSLOptions.KeyFile := KeyFile;
    HTTPConsult.IOHandler := IOHandleConsult;
    HTTPConsult.Request.Accept := 'application/json';
    HTTPConsult.Request.CustomHeaders.FoldLines := False;
    HTTPConsult.Request.CustomHeaders.Add('Authorization: Bearer ' + Token);

    try
      URI_CONSULT_FINAL := URL_CONSULTAR + NossoNumero;
      HTTPConsult.Get(URI_CONSULT_FINAL, RespConsult);
      if HTTPConsult.ResponseCode = 200 then
      begin
        Jso := TJSONObject.Create;
        Jso.Parse(RespConsult.Bytes, 0);

        for JsoPair in Jso do
        begin
          if JsoPair.JsonString.value = 'situacao' then
            Situacao := JsoPair.JsonValue.value;
          if Situacao = 'PAGO' then
          begin
            if JsoPair.JsonString.value = 'valorTotalRecebimento' then
              ValorPago := JsoPair.JsonValue.GetValue<Double>;
          end;
        end;
      end
      else
        GravarLog('Erro: ' + IntToStr(HTTPConsult.ResponseCode) + ' - ' +
          RespConsult.DataString);

    finally
      FreeAndNil(RespConsult);
      FreeAndNil(IOHandleConsult);
      FreeAndNil(HTTPConsult);
    end;
  except
    on ex: exception do
      GravarLog('Erro ao consultar boleto: ' + ex.Message);
  end;
end;

end.
