Attribute VB_Name = "modRAR"

Dim Msg As String
Public ExtFolder As String

Enum RarOperations
    OP_EXTRACT = 0
    OP_COMPRESS = 1
    OP_LIST = 2
End Enum

'*************************************************************************
'**�� �� ����RARExecute
'**��    �룺Mode(RarOperations)       - ģʽ x ��ѹ��  l �鿴ѹ���ĵ�
'**        :WBYS(String)           - ��Ҫ��ѹ�����ļ�
'**        ��Optional Password(String) - ����
'**��    ������
'**����������
'**ȫ�ֱ�����
'**����ģ�飺
'**��    �ߣ�
'**�� �� �ˣ�
'**��    �ڣ�
'**��    ����V1.0.1
'*************************************************************************
Public Sub RARExecute(Mode As Long, RarFile As String, sPath As String)
    RarFile = Replace(RarFile, "\", "\\")
    sPath = Replace(sPath, "\", "\\")
    fMain.Show
    With fMain
        If Mode = OP_LIST Then
            .lvFiles.ListItems.Clear
        End If
        
        Select Case Mode
            Case OP_EXTRACT
                .sbStat.Panels(1).Text = "Extracting" + sPath
                Shell "E:\TextCompress\bin\Debug\TextCompress.exe 0 " + RarFile + " " + sPath, vbHide

            Case OP_COMPRESS
                .sbStat.Panels(1).Text = "Compress " + sPath
                Shell "E:\TextCompress\bin\Debug\TextCompress.exe 1 " + RarFile + " " + sPath, vbHide
        End Select
    End With
End Sub


Public Sub MakeError(Msg As String)
    MsgBox Msg, vbApplicationModal + vbCritical, "����"
    End
End Sub


Public Sub ShowProp()
    '
    MsgBox Msg, vbInformation, "����"
    '
End Sub
