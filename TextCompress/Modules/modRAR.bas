Attribute VB_Name = "modRAR"

Dim Msg As String
Public ExtFolder As String

Enum RarOperations
    OP_EXTRACT = 0
    OP_COMPRESS = 1
    OP_LIST = 2
End Enum

'*************************************************************************
'**函 数 名：RARExecute
'**输    入：Mode(RarOperations)       - 模式 x 解压缩  l 查看压缩文档
'**        :WBYS(String)           - 需要解压缩的文件
'**        ：Optional Password(String) - 密码
'**输    出：无
'**功能描述：
'**全局变量：
'**调用模块：
'**作    者：
'**修 改 人：
'**日    期：
'**版    本：V1.0.1
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
    MsgBox Msg, vbApplicationModal + vbCritical, "错误"
    End
End Sub


Public Sub ShowProp()
    '
    MsgBox Msg, vbInformation, "属性"
    '
End Sub
