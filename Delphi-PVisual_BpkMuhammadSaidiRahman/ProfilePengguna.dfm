object FormProfile: TFormProfile
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormProfile'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object MainPanel: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 618
    ExplicitHeight = 424
    object ButtonPanel: TPanel
      Left = 1
      Top = 340
      Width = 622
      Height = 100
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 323
      ExplicitWidth = 616
      object BitTambah: TBitBtn
        AlignWithMargins = True
        Left = 192
        Top = 34
        Width = 100
        Height = 30
        Margins.Left = 0
        Margins.Top = 10
        Margins.Right = 5
        Margins.Bottom = 10
        Caption = 'SIMPAN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ImageIndex = 4
        ImageName = 'add'
        Images = DataModule1.VirtualImageButton
        Layout = blGlyphRight
        ParentFont = False
        TabOrder = 0
        OnClick = BitTambahClick
      end
      object BitTutup: TBitBtn
        AlignWithMargins = True
        Left = 302
        Top = 34
        Width = 100
        Height = 30
        Margins.Left = 5
        Margins.Top = 10
        Margins.Right = 5
        Margins.Bottom = 10
        Caption = 'TUTUP   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ImageIndex = 5
        ImageName = 'cross'
        Images = DataModule1.VirtualImageButton
        Layout = blGlyphRight
        ParentFont = False
        TabOrder = 1
        OnClick = BitTutupClick
      end
    end
    object PanelIdentitas: TPanel
      Left = 1
      Top = 51
      Width = 250
      Height = 289
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 272
      object BingkaiFotoProfile: TShape
        Left = 48
        Top = 55
        Width = 150
        Height = 150
        Shape = stCircle
      end
      object FotoProfil: TImage
        Left = 48
        Top = 55
        Width = 150
        Height = 150
        Stretch = True
      end
      object BitGantiFoto: TBitBtn
        AlignWithMargins = True
        Left = 72
        Top = 218
        Width = 100
        Height = 30
        Margins.Left = 5
        Margins.Top = 10
        Margins.Right = 5
        Margins.Bottom = 10
        Caption = 'GANTI FOTO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ImageIndex = 6
        ImageName = 'edit'
        Layout = blGlyphRight
        ParentFont = False
        TabOrder = 0
        OnClick = BitGantiFotoClick
      end
    end
    object PanelInformasi: TPanel
      Left = 251
      Top = 51
      Width = 372
      Height = 289
      Align = alClient
      TabOrder = 2
      ExplicitWidth = 366
      ExplicitHeight = 272
      object Label2: TLabel
        Left = 26
        Top = 111
        Width = 63
        Height = 15
        Caption = 'NIM / NIDN'
      end
      object Label3: TLabel
        Left = 26
        Top = 140
        Width = 28
        Height = 15
        Caption = 'Prodi'
      end
      object Label4: TLabel
        Left = 26
        Top = 169
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object Label5: TLabel
        Left = 26
        Top = 82
        Width = 80
        Height = 15
        Caption = 'Nama Lengkap'
      end
      object Edit1: TEdit
        Left = 147
        Top = 79
        Width = 190
        Height = 23
        TabOrder = 0
        TextHint = 'M. Rizky Rinaldy'
      end
      object Edit2: TEdit
        Left = 147
        Top = 108
        Width = 190
        Height = 23
        TabOrder = 1
        TextHint = '2510010102'
      end
      object Edit3: TEdit
        Left = 147
        Top = 137
        Width = 190
        Height = 23
        TabOrder = 2
        TextHint = 'Teknik Informatika'
      end
      object Edit4: TEdit
        Left = 147
        Top = 166
        Width = 190
        Height = 23
        TabOrder = 3
        TextHint = 'rizkyrinaldy.schwork@gmail.com'
      end
    end
    object HeaderPanel: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 50
      Align = alTop
      Caption = 'PROFIL PENGGUNA'
      Color = clSkyBlue
      ParentBackground = False
      TabOrder = 3
      ExplicitWidth = 616
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 49
    Top = 273
  end
end
