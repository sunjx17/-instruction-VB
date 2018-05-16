VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   7995
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7995
   Icon            =   "Formn.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7995
   ScaleWidth      =   7995
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim linecl As Integer, ldb As Integer, linemv As Integer, linedn As Integer, lineup As Integer

Public Sub pr(o As String)
Print o
End Sub
Private Sub Form_Click()
clickv 0, 0, clk, linecl
End Sub
Private Sub Form_DblClick()
clickv 0, 0, dbclk, ldb
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
'clickv 0, 0, key0, linename
End Sub

Private Sub Form_Load()
If sx = 0 Then sx = 400
If sy = 0 Then sy = 400
Me.Scale (0, sy)-(sx, 0)
If wx = 0 Then wx = 7995
If wy = 0 Then wy = 7995
Me.Width = wx
Me.Height = wy
linecl = -1
ldb = -1
linemv = -1
lineup = -1
linedn = -1
End Sub
Public Sub regst(lin As Integer, vv As Integer)
Select Case vv
Case clk
    linecl = lin
Case move0
    linemv = lin
Case up
    lineup = lin
Case down
    linedn = lin
Case dbclk
    ldb = lin
    
End Select
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
clickv X, Y, down, linedn
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
clickv X, Y, move0, linemv
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
clickv X, Y, up, lineup
End Sub

Private Sub Picture1_GotFocus()

End Sub
