VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form fMain 
   Caption         =   "文本压缩"
   ClientHeight    =   6705
   ClientLeft      =   6330
   ClientTop       =   2820
   ClientWidth     =   8130
   ForeColor       =   &H8000000F&
   Icon            =   "fMain.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   6705
   ScaleWidth      =   8130
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin ComctlLib.Toolbar tbMenu 
      Align           =   1  'Align Top
      Height          =   1170
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   8130
      _ExtentX        =   14340
      _ExtentY        =   2064
      ButtonWidth     =   1455
      ButtonHeight    =   1905
      Appearance      =   1
      ImageList       =   "imMenu"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   8
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "打开"
            Object.ToolTipText     =   "选择一个压缩文件"
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "关闭"
            Object.ToolTipText     =   "关闭当前压缩文件"
            Object.Tag             =   ""
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "解压缩"
            Object.ToolTipText     =   "解压缩文件 "
            Object.Tag             =   ""
            ImageIndex      =   3
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "压缩"
            Object.ToolTipText     =   " 压缩文件"
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "查看"
            Object.ToolTipText     =   " 预览文件内容"
            Object.Tag             =   ""
            ImageIndex      =   5
         EndProperty
         BeginProperty Button8 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "关于"
            Object.ToolTipText     =   " 关于"
            Object.Tag             =   ""
            ImageIndex      =   6
         EndProperty
      EndProperty
   End
   Begin ComctlLib.StatusBar sbStat 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   0
      Top             =   6360
      Width           =   8130
      _ExtentX        =   14340
      _ExtentY        =   609
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   2
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   7056
            MinWidth        =   7056
            TextSave        =   ""
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   6720
            Text            =   "文本压缩"
            TextSave        =   "文本压缩"
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ListView lvFiles 
      Height          =   5025
      Left            =   30
      TabIndex        =   1
      Top             =   1290
      Width           =   8115
      _ExtentX        =   14314
      _ExtentY        =   8864
      View            =   3
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      SmallIcons      =   "imFile"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   1
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "文件名"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   1950
      Top             =   3780
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Image imApp 
      Height          =   480
      Left            =   960
      Picture         =   "fMain.frx":37A2
      Top             =   9000
      Visible         =   0   'False
      Width           =   480
   End
   Begin ComctlLib.ImageList imMenu 
      Left            =   5640
      Top             =   3960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   48
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   6
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":446C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":5FBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":7B10
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":9662
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":B1B4
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":CD06
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList imFile 
      Left            =   4290
      Top             =   3660
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   1
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "fMain.frx":E858
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnufile 
      Caption         =   "文件(&F)"
      Begin VB.Menu mnuopen 
         Caption         =   "打开压缩文件(&O)..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuclose 
         Caption         =   "关闭压缩文件(&C)..."
         Shortcut        =   ^C
      End
      Begin VB.Menu mnusep0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuprop 
         Caption         =   "属性(&P)"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnusep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuexit 
         Caption         =   "退出(&E)"
      End
   End
   Begin VB.Menu mnuedit 
      Caption         =   "命令(&E)"
      Begin VB.Menu mnuextract 
         Caption         =   "解压缩(&E)"
         Shortcut        =   ^E
      End
      Begin VB.Menu muncompress 
         Caption         =   "压缩文件(&O)..."
         Shortcut        =   ^T
      End
   End
   Begin VB.Menu mnuhlp 
      Caption         =   "帮助(&H)"
      Begin VB.Menu mnucat 
         Caption         =   "查看(&H)"
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnusep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuabout 
         Caption         =   "关于(&A)"
         Shortcut        =   {F2}
      End
   End
End
Attribute VB_Name = "fMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Option Explicit

Private Sub Form_Load()
    '
    InitCommonControlsVB
    MakeFlatToolbar tbMenu
    ReadCommand (Command)
    '
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    ' 如果应用程序是最小化到任务栏上，则不执行Resize
    If Me.WindowState = vbMinimized Then: Exit Sub
        lvFiles.Top = tbMenu.Top + tbMenu.Height
        lvFiles.Left = 30
        lvFiles.Width = Me.ScaleWidth - 60
        lvFiles.Height = Me.ScaleHeight - (sbStat.Height + 30 + tbMenu.Height)
        Dim OnePart As Long
        OnePart = lvFiles.Width / 10
        lvFiles.ColumnHeaders.Item(1).Width = OnePart * 6
        lvFiles.ColumnHeaders.Item(2).Width = OnePart
        lvFiles.ColumnHeaders.Item(3).Width = OnePart
        lvFiles.ColumnHeaders.Item(4).Width = OnePart
        '
End Sub

Private Sub lvFiles_Click()
    '
    If lvFiles.ListItems.Count = 0 Then: Exit Sub
        If lvFiles.SelectedItem.Selected = True Then: Exit Sub
            sbStat.Panels(1).Text = "按 F1 获取更多帮助"
            '
End Sub

Private Sub lvFiles_ItemClick(ByVal Item As ComctlLib.ListItem)
    '
    If lvFiles.ListItems.Count = 0 Then: Exit Sub
        sbStat.Panels(1).Text = lvFiles.ListItems(Item.Index).Key
        '
End Sub

Private Sub mnuabout_Click()
    '
    Call ShowAbout
    '
End Sub

Private Sub mnuclose_Click()
    '
    lvFiles.ListItems.Clear
    sbStat.Panels(1).Text = "按 F1 获取更多帮助"
    '
    mnuclose.Enabled = False
    mnuextract.Enabled = False
    muncompress.Enabled = False
    mnuprop.Enabled = False
    mnucat.Enabled = False
    '
    tbMenu.Buttons(2).Enabled = mnuclose.Enabled
    tbMenu.Buttons(4).Enabled = mnuextract.Enabled
    tbMenu.Buttons(5).Enabled = muncompress.Enabled
    tbMenu.Buttons(7).Enabled = mnucat.Enabled
    Me.Caption = "文本压缩"
    CD.FileName = ""
    '
End Sub

Private Sub mnuexit_Click()
    On Error Resume Next
    Unload fComment
    Unload fMain
    '
End Sub

Private Sub mnuextract_Click()
    '
    fExt.Tag = Me.Tag
    fExt.Show vbModal, Me
    '
End Sub

Private Sub muncat_Click()
    '
    Shell "NotePad " & Me.Tag, vbNormalFocus
    '
End Sub

Private Sub mnuopen_Click()
    '
    Call OpenArchive
    '
End Sub

Private Sub mnuprop_Click()
    '
    Call ShowProp
    '
End Sub

Private Sub muncompress_Click()
    fExt.Tag = Me.Tag
    fExt.Caption = "压缩到..."
    fExt.cmdExtract.Caption = "压缩"
    fExt.Show vbModal, Me
End Sub


Private Sub tbMenu_ButtonClick(ByVal Button As ComctlLib.Button)
    '
    Select Case Button.Index
        Case 1
            mnuopen_Click
        Case 2
            mnuclose_Click
        Case 4
            mnuextract_Click
        Case 5
            muncompress_Click
        Case 7
            muncat_Click
        Case 8
            mnuabout_Click
    End Select
    '
End Sub

Public Sub ExtractRAR(sPath As String)
    
    Call RARExecute(OP_EXTRACT, Me.Tag, sPath)

End Sub

Public Sub CompressRAR(sPath As String)
 
    Call RARExecute(OP_COMPRESS, Me.Tag, sPath)
    
End Sub
Public Sub CloseArc()
    '
    mnuclose_Click
    '
End Sub
