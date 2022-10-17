unit Boleto.Exception;

interface
  uses
    System.SysUtils;

type
  TErrors = class
  private
    FCode       : string;
    FDescription: string;
  published
    property Code       : string read FCode        write FCode;
    property Description: string read FDescription write FDescription;
  end;

  TErroList = class
  private
    FErrors: TArray<TErrors>;
  published
    property Errors: TArray<TErrors> read FErrors;
  end;

  EAsaasException = class(Exception)
  public
    constructor Create(const AStatus: TStatusComunicacao; const AMsg: string); overload;
    constructor Create(const AResponseStatusCode: Integer; const AResponseStatusText: string; const AMsg: string); overload;
    constructor CreateFmt(const AStatus: TStatusComunicacao; const AMsg: string; const Args: array of const); overload;
  end;

implementation
  uses
    REST.Json;

constructor EAsaasException.Create(const AStatus: TStatusComunicacao; const AMsg: string);
begin
  inherited Create('Status: ' + STATUS_COMUNICACAO[Integer(AStatus)] + ' ' + AMsg);
end;

constructor EAsaasException.Create(const AResponseStatusCode: Integer; const AResponseStatusText: string; const AMsg: string);
var
  FErro : TErroList;
begin
  case AResponseStatusCode of
    400:
    begin
      try
        FErro := TJson.JsonToObject<TErroList>(AMsg);
        inherited Create(AResponseStatusCode.ToString + ' ' + AResponseStatusText
                        + #13 + #10
                        + FErro.Errors[0].Code + ' ' + FErro.Errors[0].Description);
      finally
        if Assigned(FErro) then
          FreeAndNil(FErro);
      end;
    end;
    401:
      inherited Create(AResponseStatusCode.ToString + ' ' + AResponseStatusText
                      + #13 + #10
                      + 'Não foi enviada API Key ou ela é inválida.');
    404:
      inherited Create(AResponseStatusCode.ToString + ' ' + AResponseStatusText
                      + #13 + #10
                      + 'Problema na URL de envio para API do Asaas');
    500:
      inherited Create(AResponseStatusCode.ToString + ' ' + AResponseStatusText
                      + #13 + #10
                      + 'Erro interno API Asaas.' );
  else
    inherited Create(AResponseStatusCode.ToString + ' ' + AResponseStatusText);
  end;
end;

constructor EAsaasException.CreateFmt(const AStatus: TStatusComunicacao; const AMsg: string; const Args: array of const);
begin
  inherited CreateFmt('Status: ' + STATUS_COMUNICACAO[Integer(AStatus)] + ' ' + AMsg ,Args);
end;

end.
