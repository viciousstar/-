VERSION 5.00
Begin VB.Form fComment 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "注释"
   ClientHeight    =   4560
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6885
   ForeColor       =   &H8000000F&
   Icon            =   "fComment.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4560
   ScaleWidth      =   6885
   StartUpPosition =   1  '所有者中心
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定(&O)"
      Default         =   -1  'True
      Height          =   345
      Left            =   5370
      TabIndex        =   0
      Top             =   4170
      Width           =   1455
   End
   Begin VB.TextBox txtComment 
      Height          =   4035
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   60
      Width           =   6765
   End
End
Attribute VB_Name = "fComment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub cmdOK_Click()
    '
    Unload Me
    '
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

