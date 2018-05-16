Attribute VB_Name = "Module1"
Dim xma As New CDD
Private LineStr(10000) As String
Public reg As Boolean
Const maxL = 65500
Dim duc As Integer
Private zhiling As String, _
        Mdule As String, SavPth As String, _
        vstr(10000) As String, cnt As Integer
Public Const down As Integer = 0
Public Const up As Integer = 1
Public Const clk As Integer = 2
Public Const dbclk As Integer = 3
Public Const move0 As Integer = 4
Public Const key0 As Integer = 5
Public wx As Single, wy As Single
Public sx As Long, sy As Long

Sub wdt(a As Double)
wx = a
End Sub
Sub ht(a As Double)
wy = a
End Sub
Sub scl(xx As Long, yy As Long)
sx = xx
sy = yy
End Sub
Private Sub loadfile(fname As String)
Dim fl As Integer
'MsgBox fname
fl = FreeFile
Open fname For Input As fl
Do Until EOF(fl)
    Line Input #fl, vstr(cnt)
    If Left(vstr(cnt), 7) = "include" Then loadfile (App.Path + "\include\" + Right(vstr(cnt), Len(vstr(cnt)) - 8))
    If vstr(cnt) <> "" Then cnt = cnt + 1
Loop
Close fl
End Sub
Sub Main()

Dim i As Integer, j As Integer, tmp2 As String, tmp1 As String, tmp3 As String, ps As String, p As String
ps = App.Path + "\"
i = 0
zhiling = Command
If Left(zhiling, 1) = Chr(34) Then zhiling = Left(Right(zhiling, Len(zhiling) - 1), Len(zhiling) - 2)
If zhiling = "" Then zhiling = ps + "line.myc"
cnt = 0
loadfile (zhiling)

i = cnt


j = i - 1
For X = 0 To j
    k = InStr(1, vstr(X), ":", vbTextCompare) '+ InStr(1, vstr(x), "£º", vbTextCompare)
    If k <> 0 Then LineStr(X) = ConvertToStr(Left(vstr(X), k))
    
Next X


i = 0
Do Until i > j
    k = InStr(1, vstr(i), ":", vbTextCompare) + 1 '+ InStr(1, vstr(i), "£º", vbTextCompare)
    
    Do Until tmp1 = " " Or k > Len(vstr(i))
        tmp2 = tmp2 + tmp1
        tmp1 = Mid(vstr(i), k, 1)
        k = k + 1
    Loop
    If k > Len(vstr(i)) Or tmp2 = "exit" Then
         i = i + 1:
         If tmp2 = "exit" Then
            End
        End If
         GoTo env:
    End If
    If tmp2 = "pause" Then GoTo enx

    tmp1 = ""
    Do Until tmp1 = " " Or k > Len(vstr(i))
       
        tmp1 = Mid(vstr(i), k, 1)
       If tmp1 <> " " Then tmp3 = tmp3 + tmp1
        k = k + 1
    Loop
    If InStr(1, tmp2, "goto", vbTextCompare) <> 0 Or InStr(1, tmp2, "call", vbTextCompare) <> 0 _
                            Then: tmp3 = ConvertToLine(tmp3)
        If InStr(1, tmp2, "reg", vbTextCompare) <> 0 Then
        r = i
        i = ConvertToLine(tmp3)
    Select Case tmp2
        Case "regdb"
        reg = True
        Form1.regst i, dbclk
    Case "regmv"
        reg = True
        Form1.regst i, move0
    Case "regup"
        reg = True
        Form1.regst i, up
    Case "regdn"
        reg = True
        Form1.regst i, down
        
    End Select
    i = r + 1
    GoTo env
    End If
    If k <= Len(vstr(i)) Then
        tmp1 = ""
        Do Until tmp1 = " " Or k > Len(vstr(i))
        
            tmp1 = Mid(vstr(i), k, 1)
          If tmp1 <> " " Then p = p + tmp1
            k = k + 1
        Loop
    Else
    tmp1 = ""
    p = ""
    End If
    
    i = xma.XZHI(tmp2, tmp3, p, i)
env:
    tmp2 = ""
    tmp3 = ""
    p = ""
    tmp1 = ""
Loop
enx:
If Not reg Then
End
End If
End Sub
Function ConvertToStr(l As String) As String
For i = 0 To Len(l)
    mm = Mid(l, i + 1, 1)
    If (mm >= "a" And mm <= "z") Or (mm >= "A" And mm <= "Z") Or (mm >= "0" And mm <= "9") Then ConvertToStr = ConvertToStr + mm
Next i
End Function
Function ConvertToLine(l As String) As String
For i = 0 To 10000
    If LineStr(i) = l Then
        ConvertToLine = CStr(i)
        Exit Function
    End If
Next i
End Function
Public Sub clickv(X As Single, Y As Single, ducdm As Integer, lin As Integer)
If lin <> -1 Then
xma.Nowx = X
xma.Nowy = Y
dcu = ducdm
goon lin
End If
End Sub
Private Sub goon(lx As Integer)
'Dim xma As New CDD
Dim i As Integer, j As Integer, tmp2 As String, tmp1 As String, tmp3 As String, p As String

j = cnt - 1
i = lx
Do Until i > j
    k = InStr(1, vstr(i), ":", vbTextCompare) + 1 '+ InStr(1, vstr(i), "£º", vbTextCompare)
    
    Do Until tmp1 = " " Or k > Len(vstr(i))
        tmp2 = tmp2 + tmp1
        tmp1 = Mid(vstr(i), k, 1)
        k = k + 1
    Loop
    If k > Len(vstr(i)) Or tmp2 = "exit" Then
         i = i + 1:
         If tmp2 = "exit" Then
            End
        End If
         GoTo env:
    End If
    If tmp2 = "pause" Then GoTo enx
    tmp1 = ""
    Do Until tmp1 = " " Or k > Len(vstr(i))
       
        tmp1 = Mid(vstr(i), k, 1)
       If tmp1 <> " " Then tmp3 = tmp3 + tmp1
        k = k + 1
    Loop
    If InStr(1, tmp2, "goto", vbTextCompare) <> 0 Or InStr(1, tmp2, "call", vbTextCompare) <> 0 _
                            Then: tmp3 = ConvertToLine(tmp3)
    If InStr(1, tmp2, "reg", vbTextCompare) <> 0 Then
    r = i
        i = ConvertToLine(tmp3)
    Select Case tmp2
        Case "regdb"
        reg = True
        Form1.regst i, dbclk
    Case "regmv"
        reg = True
        Form1.regst i, move0
    Case "regup"
        reg = True
        Form1.regst i, up
    Case "regdn"
        reg = True
        Form1.regst i, down
    End Select
    i = r + 1
    GoTo env
    End If
    If k <= Len(vstr(i)) Then
        tmp1 = ""
        Do Until tmp1 = " " Or k > Len(vstr(i))
        
            tmp1 = Mid(vstr(i), k, 1)
          If tmp1 <> " " Then p = p + tmp1
            k = k + 1
        Loop
    Else
    tmp1 = ""
    p = ""
    End If
    
    i = xma.XZHI(tmp2, tmp3, p, i)
env:
    tmp2 = ""
    tmp3 = ""
    p = ""
    tmp1 = ""
Loop
enx:
If Not reg Then
End
End If

End Sub
