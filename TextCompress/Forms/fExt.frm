VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form fExt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "解压缩到..."
   ClientHeight    =   2055
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5460
   ForeColor       =   &H8000000F&
   Icon            =   "fExt.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2055
   ScaleWidth      =   5460
   StartUpPosition =   1  '所有者中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MSComDlg.CommonDialog CD 
      Left            =   2010
      Top             =   1230
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "取消"
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   1620
      Width           =   1305
   End
   Begin VB.CommandButton cmdExtract 
      Caption         =   "解压缩"
      Default         =   -1  'True
      Height          =   375
      Left            =   4110
      TabIndex        =   0
      Top             =   1170
      Width           =   1305
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Left            =   5070
      TabIndex        =   3
      Top             =   270
      Width           =   315
   End
   Begin VB.TextBox txtPath 
      Height          =   315
      Left            =   930
      TabIndex        =   2
      Text            =   "C:\WINDOWS\Temp"
      Top             =   270
      Width           =   4065
   End
   Begin VB.Image imApp 
      Height          =   720
      Left            =   90
      Picture         =   "fExt.frx":37A2
      Top             =   90
      Width           =   720
   End
End
Attribute VB_Name = "fExt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Function SHBrowseForFolder Lib "shell32.dll" Alias "SHBrowseForFolderA" (lpBrowseInfo As BROWSEINFO) As Long 'ITEMIDLIST
Private Type BROWSEINFO    'bi
hOwner As Long
   pidlRoot As Long
   pszDisplayName As String
  lpszTitle As String
   ulFlags As Long
    lpfn As Long
    lParam As Long
    iImage As Long
End Type
Private Const BIF_RETURNONLYFSDIRS = &H1


Private Sub cmdBrowse_Click()
  Dim bi As BROWSEINFO
  Dim pidl&, path$, rtn&, pos%
'展开根目录,取值为0-普通,其他的值就是特殊的文件夹.(见上一个教程)
bi.pidlRoot = 0&
'列表框标题
bi.lpszTitle = "请选择压缩路径："
'规定只能选择文件夹，其他无效
  bi.ulFlags = BIF_RETURNONLYFSDIRS  'BIF_RETURNFSANCESTORS 'BIF_BROWSEFORPRINTER + BIF_DONTGOBELOWDOMAIN
  pidl& = SHBrowseForFolder(bi)
    path$ = Space$(512)
    rtn& = SHGetPathFromIDList(ByVal pidl&, ByVal path$)
    If rtn& Then
      pos% = InStr(path$, Chr$(0))
      txtPath.Text = Left(path$, pos - 1)
    Else
      txtPath.Text = ""
    End If
End Sub

Private Sub cmdCancel_Click()
    '
    Unload Me
    '
End Sub

Private Sub cmdExtract_Click()
    Dim str As String
    str = txtPath.Text
    If cmdExtract.Caption = "解压缩" Then
        If (Len(str) > 0) Then
          str = Replace(str, "/", "\")
          If (Right(str, 1) = "\") Then str = Left(str, Len(str) - 1)
          If Dir$(txtPath.Text, vbDirectory) = "" Then: MkDir str
        End If
        ExtFolder = str
        Unload Me
            Call fMain.ExtractRAR(ExtFolder)
    Else
        If (Len(str) > 0) Then
          str = Replace(str, "/", "\")
          If (Right(str, 1) = "\") Then str = Left(str, Len(str) - 1)
          If Dir$(txtPath.Text, vbDirectory) = "" Then: MkDir str
        End If
        ExtFolder = str
        Unload Me
            Call fMain.CompressRAR(ExtFolder)
    End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    '
    If KeyAscii = 27 Then: Unload Me
    '
End Sub

Private Sub Form_Load()
    '
    Me.Icon = Nothing
    '
End Sub

