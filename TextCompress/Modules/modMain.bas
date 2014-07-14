Attribute VB_Name = "modMain"

Option Explicit

Public Const WM_USER = &H400
Public Const TB_SETSTYLE = WM_USER + 56
Public Const TB_GETSTYLE = WM_USER + 57
Public Const TBSTYLE_FLAT = &H800

Public Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function InitCommonControlsEx Lib "comctl32.dll" (iccex As tagInitCommonControlsEx) As Boolean
Public Declare Function ShellAbout Lib "shell32.dll" Alias "ShellAboutA" (ByVal hWnd As Long, ByVal szApp As String, ByVal szOtherStuff As String, ByVal hIcon As Long) As Long
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
    
Private Type tagInitCommonControlsEx
   lngSize As Long
   lngICC As Long
End Type

Private Const ICC_USEREX_CLASSES = &H200

Public Function InitCommonControlsVB() As Boolean
   On Error Resume Next
   Dim iccex As tagInitCommonControlsEx
   With iccex
       .lngSize = LenB(iccex)
       .lngICC = ICC_USEREX_CLASSES
   End With
   InitCommonControlsEx iccex
   InitCommonControlsVB = (Err.Number = 0)
   On Error GoTo 0
End Function

Public Sub MakeFlatToolbar(ctlToolbar As Toolbar)

    Dim style As Long
    Dim hToolbar As Long
    Dim r As Long
    hToolbar = FindWindowEx(ctlToolbar.hWnd, 0&, "ToolbarWindow32", vbNullString)
    style = SendMessageLong(hToolbar, TB_GETSTYLE, 0&, 0&)
    If style And TBSTYLE_FLAT Then
    style = style Xor TBSTYLE_FLAT
    Else
    style = style Or TBSTYLE_FLAT
    End If
    r = SendMessageLong(hToolbar, TB_SETSTYLE, 0, style)
End Sub

Public Sub ReadCommand(sCommand As String)
    '
    Dim Vals() As String
    If sCommand = "" Then
        Call fMain.CloseArc
    Exit Sub
    End If
    '
    Vals = Split(Command, "=")
    '
    fMain.Tag = VBA.Right(Command, Len(Command) - 2)
    ReDim Preserve Vals(2)
    If Vals(0) = "" Or Vals(1) = "" Then MakeError ("丢失信息!")
    Select Case UCase(Vals(0))
    Case "X"
        RARExecute OP_EXTRACT, Vals(1), Vals(2)
    Case "T"
        RARExecute OP_COMPRESS, Vals(1), Vals(2)
    Case "L"
        RARExecute OP_LIST, Vals(1), Vals(2)
    Case Else
        MakeError "I无效信息!"
    End Select
    '
End Sub

Public Sub OpenArchive()
    '
    With fMain
        .CD.CancelError = True
        .CD.DialogTitle = "选择文件..."
        .CD.ShowOpen
            If .CD.FileName <> "" Then
                .lvFiles.ListItems.Add 1, .CD.FileName, .CD.FileName, , 1
            End If
        .mnuextract.Enabled = True
        .muncompress.Enabled = True
        .mnuclose.Enabled = True
        .mnuprop.Enabled = True
        .mnucat.Enabled = True
        .tbMenu.Buttons(2).Enabled = .mnuclose.Enabled
        .tbMenu.Buttons(4).Enabled = .mnuextract.Enabled
        .tbMenu.Buttons(5).Enabled = .muncompress.Enabled
        .tbMenu.Buttons(7).Enabled = .mnucat.Enabled
        .Tag = .CD.FileName
    End With

End Sub

Public Sub ShowAbout()
    '
    Call ShellAbout(fMain.hWnd, "文本压缩", "", fMain.imApp.Picture)
    '
End Sub

Public Sub Show()
    
End Sub
