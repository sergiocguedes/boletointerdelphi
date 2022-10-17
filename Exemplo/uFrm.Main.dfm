object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Projeto de exemplo Boleto Inter v2'
  ClientHeight = 636
  ClientWidth = 864
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object LinkLabel1: TLinkLabel
    Left = 0
    Top = 615
    Width = 864
    Height = 21
    Align = alBottom
    Caption = 
      '<a href="https://meucodigofonte.com.br/">Desenvolvido por: Comun' +
      'idade Meu C'#243'digo Fonte | meucodigofonte.com.br</a>'
    TabOrder = 0
    OnLinkClick = LinkLabel1LinkClick
    ExplicitWidth = 452
  end
  object pgcinter: TPageControl
    Left = 0
    Top = 97
    Width = 864
    Height = 447
    ActivePage = TabSheet3
    Align = alTop
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Configura'#231#227'o'
      ExplicitLeft = 7
      ExplicitTop = 26
      object Label17: TLabel
        Left = 23
        Top = 5
        Width = 44
        Height = 17
        Caption = 'ClientID'
      end
      object Label18: TLabel
        Left = 23
        Top = 54
        Width = 70
        Height = 17
        Caption = 'client_secret'
      end
      object Label19: TLabel
        Left = 23
        Top = 173
        Width = 85
        Height = 17
        Caption = 'Certificado.key'
      end
      object Label20: TLabel
        Left = 23
        Top = 117
        Width = 81
        Height = 17
        Caption = 'Certificado.crt'
      end
      object Label21: TLabel
        Left = 23
        Top = 237
        Width = 36
        Height = 17
        Caption = 'Scope'
      end
      object SpeedButton1: TSpeedButton
        Left = 663
        Top = 143
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 663
        Top = 196
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object edtclientid: TEdit
        Left = 23
        Top = 25
        Width = 634
        Height = 25
        TabOrder = 0
      end
      object edtclient_secret: TEdit
        Left = 23
        Top = 77
        Width = 634
        Height = 25
        TabOrder = 1
      end
      object edtcertkey: TEdit
        Left = 23
        Top = 196
        Width = 634
        Height = 25
        TabOrder = 2
        Text = 'certificado.key'
      end
      object edtcertificado: TEdit
        Left = 23
        Top = 142
        Width = 634
        Height = 25
        TabOrder = 3
        Text = 'certificado.crt'
      end
      object edtscope: TEdit
        Left = 23
        Top = 260
        Width = 634
        Height = 25
        ReadOnly = True
        TabOrder = 4
        Text = 'extrato.read boleto-cobranca.read boleto-cobranca.write'
      end
      object btnavancarconfig: TButton
        Left = 703
        Top = 337
        Width = 137
        Height = 36
        Caption = 'Avan'#231'ar >>>'
        TabOrder = 5
        OnClick = btnavancarconfigClick
      end
    end
    object tsgerarboleto: TTabSheet
      Caption = 'Gerar Boleto'
      ImageIndex = 1
      object pgcboleto: TPageControl
        Left = 0
        Top = 0
        Width = 856
        Height = 415
        ActivePage = tspagador
        Align = alClient
        TabOrder = 0
        object tspagador: TTabSheet
          Caption = 'Dados Pagador'
          object Label26: TLabel
            Left = 7
            Top = 6
            Width = 99
            Height = 17
            Caption = 'Tipo de Pagador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 153
            Top = 6
            Width = 63
            Height = 17
            Caption = 'CPF /CNPJ '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 323
            Top = 6
            Width = 36
            Height = 17
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 10
            Top = 57
            Width = 27
            Height = 17
            Caption = 'Cep '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label29: TLabel
            Left = 146
            Top = 55
            Width = 55
            Height = 17
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 17
            Top = 99
            Width = 94
            Height = 13
            Caption = 'Somente N'#250'meros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label30: TLabel
            Left = 609
            Top = 57
            Width = 48
            Height = 17
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 10
            Top = 113
            Width = 35
            Height = 17
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label34: TLabel
            Left = 191
            Top = 113
            Width = 41
            Height = 17
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 324
            Top = 108
            Width = 18
            Height = 17
            Caption = 'UF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label36: TLabel
            Left = 465
            Top = 112
            Width = 82
            Height = 17
            Caption = 'Complemento'
          end
          object Label39: TLabel
            Left = 423
            Top = 160
            Width = 52
            Height = 17
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 368
            Top = 160
            Width = 30
            Height = 17
            Caption = 'DDD:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 8
            Top = 160
            Width = 36
            Height = 17
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label32: TLabel
            Left = 220
            Top = 50
            Width = 94
            Height = 13
            Caption = 'Somente N'#250'meros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label40: TLabel
            Left = 11
            Top = 230
            Width = 119
            Height = 17
            Caption = 'Linha observa'#231#245'es 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object lbllinha2: TLabel
            Left = 11
            Top = 283
            Width = 119
            Height = 17
            Caption = 'Linha observa'#231#245'es 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object cbbtipocliente: TComboBox
            Left = 10
            Top = 24
            Width = 137
            Height = 25
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'PESSOA FISICA'
            Items.Strings = (
              'PESSOA FISICA'
              'PESSOA JURIDICA')
          end
          object edtcpfcnpj: TEdit
            Left = 153
            Top = 24
            Width = 161
            Height = 25
            TabOrder = 1
            Text = '71725694239'
          end
          object edtnome: TEdit
            Left = 323
            Top = 24
            Width = 494
            Height = 25
            TabOrder = 2
            Text = 'Heitor Erick Carvalho'
          end
          object edtcep: TEdit
            Left = 8
            Top = 74
            Width = 129
            Height = 25
            TabOrder = 3
            Text = '69060412'
          end
          object edtendereco: TEdit
            Left = 149
            Top = 74
            Width = 454
            Height = 25
            TabOrder = 4
            Text = 'Rua Cine Ypiranga'
          end
          object edtnumero: TEdit
            Left = 609
            Top = 74
            Width = 129
            Height = 25
            TabOrder = 5
            Text = '943'
          end
          object edtbairro: TEdit
            Left = 10
            Top = 131
            Width = 175
            Height = 25
            TabOrder = 6
            Text = 'Aleixo'
          end
          object edtcidade: TEdit
            Left = 191
            Top = 131
            Width = 127
            Height = 25
            TabOrder = 7
            Text = 'Manaus'
          end
          object edtuf: TEdit
            Left = 324
            Top = 131
            Width = 127
            Height = 25
            TabOrder = 8
            Text = 'AM'
          end
          object edtcompl: TEdit
            Left = 465
            Top = 131
            Width = 352
            Height = 25
            TabOrder = 9
          end
          object edttelefone: TEdit
            Left = 423
            Top = 179
            Width = 139
            Height = 25
            TabOrder = 10
          end
          object edtddd: TEdit
            Left = 368
            Top = 179
            Width = 49
            Height = 25
            TabOrder = 11
            Text = '92'
          end
          object edtemail: TEdit
            Left = 8
            Top = 179
            Width = 352
            Height = 25
            TabOrder = 12
            Text = 'seuemail@emai.com.br'
          end
          object edtlinha1: TEdit
            Left = 12
            Top = 248
            Width = 550
            Height = 25
            TabOrder = 13
            Text = 'Boleto gerado utilizando o exemplo do Meu Codigo Fonte'
          end
          object edtlinha2: TEdit
            Left = 11
            Top = 302
            Width = 550
            Height = 25
            TabOrder = 14
            Text = 'Conhe'#231'a www.meucodigofonte.com.br'
          end
          object Button4: TButton
            Left = 696
            Top = 329
            Width = 137
            Height = 36
            Caption = 'Avan'#231'ar >>>'
            TabOrder = 15
            OnClick = Button4Click
          end
        end
        object tsdadosboleto: TTabSheet
          Caption = 'Boleto'
          ImageIndex = 1
          object Label11: TLabel
            Left = 16
            Top = 69
            Width = 162
            Height = 17
            Caption = 'Regra desconto antecipado'
          end
          object Label13: TLabel
            Left = 289
            Top = 69
            Width = 91
            Height = 17
            Caption = 'Regra de Multa'
          end
          object Label14: TLabel
            Left = 536
            Top = 69
            Width = 133
            Height = 17
            Caption = 'Regra de Juros (Mora)'
          end
          object Label3: TLabel
            Left = 16
            Top = 7
            Width = 72
            Height = 17
            Caption = 'SeuNumero:'
          end
          object Label23: TLabel
            Left = 115
            Top = 7
            Width = 91
            Height = 17
            Caption = 'Valor do Boleto'
          end
          object Label22: TLabel
            Left = 214
            Top = 7
            Width = 117
            Height = 17
            Caption = 'Data de Vencimento'
          end
          object Label25: TLabel
            Left = 337
            Top = 7
            Width = 127
            Height = 17
            Caption = 'Dias Canc. Apos venc.'
          end
          object Label41: TLabel
            Left = 16
            Top = 119
            Width = 91
            Height = 17
            Caption = 'Valor do Boleto'
          end
          object Label42: TLabel
            Left = 119
            Top = 119
            Width = 117
            Height = 17
            Caption = 'Data de Vencimento'
          end
          object Label43: TLabel
            Left = 390
            Top = 119
            Width = 117
            Height = 17
            Caption = 'Data de Vencimento'
          end
          object Label44: TLabel
            Left = 287
            Top = 119
            Width = 91
            Height = 17
            Caption = 'Valor do Boleto'
          end
          object Label45: TLabel
            Left = 639
            Top = 119
            Width = 117
            Height = 17
            Caption = 'Data de Vencimento'
          end
          object Label46: TLabel
            Left = 536
            Top = 119
            Width = 91
            Height = 17
            Caption = 'Valor do Boleto'
          end
          object Label51: TLabel
            Left = 287
            Top = 168
            Width = 413
            Height = 17
            Caption = 
              '*A data de multa e Juros n'#227'o se menor ou igual a data de vencime' +
              'nto.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object cbbregradesconto: TComboBox
            Left = 16
            Top = 88
            Width = 220
            Height = 25
            Style = csDropDownList
            ItemIndex = 2
            TabOrder = 0
            Text = 'Percentual at'#233' a data informada.'
            Items.Strings = (
              'N'#227'o tem desconto.'
              'Valor fixo at'#233' a data informada.'
              'Percentual at'#233' a data informada.')
          end
          object cbbregramulta: TComboBox
            Left = 289
            Top = 88
            Width = 169
            Height = 25
            Style = csDropDownList
            ItemIndex = 2
            TabOrder = 1
            Text = 'Percentual'
            Items.Strings = (
              'N'#227'o tem multa'
              'Valor fixo'
              'Percentual')
          end
          object cbbregramora: TComboBox
            Left = 536
            Top = 88
            Width = 169
            Height = 25
            Style = csDropDownList
            ItemIndex = 2
            TabOrder = 2
            Text = 'Isento'
            Items.Strings = (
              'Valor ao dia'
              'Taxa mensal'
              'Isento'
              'Controle do banco')
          end
          object edtSeuNumero: TEdit
            Left = 16
            Top = 25
            Width = 93
            Height = 25
            Alignment = taCenter
            NumbersOnly = True
            TabOrder = 3
            Text = '1'
          end
          object edtvalorboleto: TEdit
            Left = 115
            Top = 25
            Width = 93
            Height = 25
            Alignment = taRightJustify
            NumbersOnly = True
            TabOrder = 4
            Text = '5'
          end
          object dtpdatavenc: TDateTimePicker
            Left = 214
            Top = 25
            Width = 115
            Height = 25
            Date = 44850.064790509260000000
            Time = 44850.064790509260000000
            TabOrder = 5
          end
          object edtqtddiascancvenc: TSpinEdit
            Left = 337
            Top = 25
            Width = 121
            Height = 27
            MaxValue = 0
            MinValue = 0
            TabOrder = 6
            Value = 0
          end
          object btnPostBoleto: TButton
            Left = 16
            Top = 225
            Width = 169
            Height = 40
            Caption = 'Gerar Boleto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnClick = btnPostBoletoClick
          end
          object edttaxavalorboleto: TEdit
            Left = 17
            Top = 137
            Width = 93
            Height = 25
            Alignment = taRightJustify
            NumbersOnly = True
            TabOrder = 8
            Text = '1'
          end
          object dtpdatadesconto: TDateTimePicker
            Left = 119
            Top = 137
            Width = 115
            Height = 25
            Date = 44850.064790509260000000
            Time = 44850.064790509260000000
            TabOrder = 9
          end
          object dtpdatamulta: TDateTimePicker
            Left = 389
            Top = 137
            Width = 115
            Height = 25
            Date = 44850.064790509260000000
            Time = 44850.064790509260000000
            TabOrder = 10
          end
          object edttaxavalormulta: TEdit
            Left = 287
            Top = 137
            Width = 93
            Height = 25
            Alignment = taRightJustify
            NumbersOnly = True
            TabOrder = 11
            Text = '1'
          end
          object dtpdatajurosmora: TDateTimePicker
            Left = 639
            Top = 137
            Width = 115
            Height = 25
            Date = 44850.064790509260000000
            Time = 44850.064790509260000000
            TabOrder = 12
          end
          object edttaxavalorjuros: TEdit
            Left = 536
            Top = 137
            Width = 93
            Height = 25
            Alignment = taRightJustify
            NumbersOnly = True
            TabOrder = 13
            Text = '1'
          end
          object chkfazdownloadboleto: TCheckBox
            Left = 16
            Top = 192
            Width = 289
            Height = 27
            Caption = 'Retorna o Boleto ap'#243's enviar?'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
        end
        object tsresultadogerar: TTabSheet
          Caption = 'Resultado'
          ImageIndex = 2
          object Label6: TLabel
            Left = 10
            Top = 86
            Width = 83
            Height = 17
            Caption = 'CodigoBarras:'
          end
          object Label12: TLabel
            Left = 10
            Top = 20
            Width = 97
            Height = 17
            Caption = 'Retorno da API:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 10
            Top = 117
            Width = 83
            Height = 17
            Caption = 'LinhaDigitavel:'
          end
          object lblboleto_env: TLabel
            Left = 12
            Top = 175
            Width = 190
            Height = 17
            Caption = 'Retorno da API PDF do boleto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 10
            Top = 54
            Width = 93
            Height = 17
            Caption = 'Nosso N'#250'mero:'
          end
          object edtLinhaDigitavel: TEdit
            Left = 115
            Top = 114
            Width = 398
            Height = 25
            ReadOnly = True
            TabOrder = 0
          end
          object edtCodigoBarras: TEdit
            Left = 115
            Top = 82
            Width = 398
            Height = 25
            ReadOnly = True
            TabOrder = 1
          end
          object btnabrirboleto_env: TButton
            Left = 12
            Top = 229
            Width = 183
            Height = 30
            Caption = 'Abrir PDF '
            TabOrder = 2
            OnClick = btnabrirboleto_envClick
          end
          object edtboletocaminho_env: TEdit
            Left = 12
            Top = 198
            Width = 797
            Height = 25
            TabOrder = 3
          end
          object edtnossonumero_retor: TEdit
            Left = 115
            Top = 51
            Width = 190
            Height = 25
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Download Boleto'
      ImageIndex = 2
      object Label9: TLabel
        Left = 16
        Top = 127
        Width = 190
        Height = 17
        Caption = 'Retorno da API PDF do boleto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 41
        Width = 243
        Height = 17
        Caption = 'Clique para gerar baixar o PDF do boleto'
      end
      object Label2: TLabel
        Left = 16
        Top = 15
        Width = 363
        Height = 17
        Caption = 'Para consultar informe o par'#226'metro nosso n'#250'mero do boleto.'
      end
      object edtArqPDF: TEdit
        Left = 16
        Top = 150
        Width = 801
        Height = 25
        TabOrder = 0
      end
      object btnDownloadPDF: TButton
        Left = 16
        Top = 64
        Width = 201
        Height = 33
        Caption = 'Download em PDF'
        TabOrder = 1
        OnClick = btnDownloadPDFClick
      end
      object Button2: TButton
        Left = 634
        Top = 188
        Width = 183
        Height = 30
        Caption = 'Abrir PDF '
        TabOrder = 2
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Consulta Boleto'
      ImageIndex = 3
      object Label15: TLabel
        Left = 15
        Top = 125
        Width = 52
        Height = 17
        Caption = 'Situacao:'
      end
      object Label16: TLabel
        Left = 213
        Top = 125
        Width = 63
        Height = 17
        Caption = 'ValorPago:'
      end
      object Label47: TLabel
        Left = 15
        Top = 13
        Width = 363
        Height = 17
        Caption = 'Para consultar informe o par'#226'metro nosso n'#250'mero do boleto.'
      end
      object Label48: TLabel
        Left = 14
        Top = 102
        Width = 97
        Height = 17
        Caption = 'Retorno da API:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtSituacao: TEdit
        Left = 14
        Top = 147
        Width = 168
        Height = 25
        Enabled = False
        TabOrder = 0
      end
      object edtValorPago: TEdit
        Left = 213
        Top = 147
        Width = 129
        Height = 25
        Enabled = False
        TabOrder = 1
      end
      object btnConsultBoleto: TButton
        Left = 15
        Top = 41
        Width = 124
        Height = 38
        Caption = 'Consultar Situa'#231#227'o'
        TabOrder = 2
        OnClick = btnConsultBoletoClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Cancelar Boleto'
      ImageIndex = 4
      object Label10: TLabel
        Left = 16
        Top = 229
        Width = 131
        Height = 17
        Caption = 'Tipo de Cancelamento'
      end
      object Label50: TLabel
        Left = 16
        Top = 305
        Width = 363
        Height = 17
        Caption = 'Para consultar informe o par'#226'metro nosso n'#250'mero do boleto.'
      end
      object Button1: TButton
        Left = 16
        Top = 328
        Width = 121
        Height = 41
        Caption = 'Cancelar'
        TabOrder = 0
        OnClick = Button1Click
      end
      object mmomotivo_cancelamento: TMemo
        Left = 16
        Top = 16
        Width = 633
        Height = 201
        Lines.Strings = (
          
            'A api do inter n'#227'o pede um motivo digitado pelo usu'#225'rio, e preci' +
            'so passar um motivo fixo conforme '
          'abaixo:'
          ''
          'Dom'#237'nio que descreve o tipo de cancelamento sendo solicitado.'
          ''
          'ACERTOS (cancelado por acertos)'
          'APEDIDODOCLIENTE (cancelado a pedido do cliente)'
          
            'PAGODIRETOAOCLIENTE (cancelado por ter sido pago direto ao clien' +
            'te)'
          'SUBSTITUICAO (cancelado por substitui'#231#227'o)')
        ReadOnly = True
        TabOrder = 1
      end
      object cbbtipo_cancelamento: TComboBox
        Left = 16
        Top = 252
        Width = 289
        Height = 25
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = 'ACERTOS '
        Items.Strings = (
          'ACERTOS '
          'APEDIDODOCLIENTE'
          'PAGODIRETOAOCLIENTE'
          'SUBSTITUICAO')
      end
    end
  end
  object mResult: TMemo
    Left = 0
    Top = 544
    Width = 864
    Height = 71
    Align = alClient
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 864
    Height = 97
    Align = alTop
    TabOrder = 3
    object Label5: TLabel
      Left = 601
      Top = 57
      Width = 96
      Height = 17
      Caption = 'Nosso Numero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 61
      Width = 37
      Height = 17
      Caption = 'Token:'
    end
    object Label1: TLabel
      Left = 20
      Top = 13
      Width = 482
      Height = 21
      Caption = 'Primeiro antes de cada chamada na API, clique em gerar Token.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNossoNumero: TEdit
      Left = 703
      Top = 54
      Width = 138
      Height = 25
      Alignment = taRightJustify
      TabOrder = 0
      Text = '0'
    end
    object edtToken: TEdit
      Left = 65
      Top = 54
      Width = 398
      Height = 25
      TabOrder = 1
    end
    object btnGetToken: TButton
      Left = 469
      Top = 50
      Width = 108
      Height = 34
      Caption = 'Gerar Token'
      TabOrder = 2
      OnClick = btnGetTokenClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 608
  end
end
