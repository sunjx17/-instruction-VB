VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CDD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private ox(200) As String, Bo(200) As String
Private xI(200) As Long, Nx1(200) As String
Private D(200) As Double, Nd(200) As String
Private C(200) As Byte, Nc(200) As String
Private bigger As Boolean, same As Boolean, regline As String
Private gpuP(400, 400) As Long
Const maxL = 65500
Private Const down As Integer = 0
Private Const up As Integer = 1
Private Const clk As Integer = 2
Private Const dbclk As Integer = 3
Private Const move0 As Integer = 4
Private Const key0 As Integer = 5
Public Nowx As Integer, Nowy As Integer
Dim g As String, Maxspace As Integer, error0 As String, errlinE As Long, xa As Integer, ya As Integer, xb As Integer, yb As Integer
 Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Function XZHI(cm As String, a As String, Optional b As String, Optional nw As Integer) As Integer
On Error GoTo err0
Dim x1 As Integer, x0 As Integer

Select Case LCase(cm)
    Case "int", "整数"
        lookfree 0, a
    Case "dbl", "小数", "实数"
        lookfree 1, a
    Case "chr", "字节", "字符"
        lookfree 2, a
    Case "space", "使用", "空间"
        Maxspace = Val(a)
    Case "str", "字符串"
        lookfree 3, a
    Case "allfre", "清零"
        For i = 0 To Val(a)
             Bo(i) = "": ox(i) = ""
             Nx1(i) = "": xI(i) = 0
             Nd(i) = "": D(i) = 0
            Nc(i) = "": C(i) = 0
        Next i
    Case "tfre", "全部清零", "初始化"
        For i = 0 To Maxspace
            If Bo(i) = a Then Bo(i) = "": GoTo xx
            If Nx1(i) = a Then Nx1(i) = "": GoTo xx
            If Nd(i) = a Then Nd(i) = "": GoTo xx
            If Nc(i) = a Then Nc(i) = "": GoTo xx
        Next i
xx:
    Case "fre"
        For i = 0 To Maxspace
            If a = Bo(i) Then Bo(i) = "": ox(i) = "": GoTo xx22
            If a = Nx1(i) Then Nx1(i) = "": xI(i) = 0: GoTo xx22
            If a = Nc(i) Then Nc(i) = "": C(i) = 0: GoTo xx22
            If a = Nd(i) Then Nd(i) = "": D(i) = 0: GoTo xx22
        Next i
xx22:
    Case "call"
        For i = 0 To Maxspace
            If Nx1(i) = b Then GoTo find1
        Next i
       Error = "NO"
find1:
        xI(i) = nw
        nw = Val(a)
    Case "return"
        For i = 0 To Maxspace
            If Nx1(i) = a Then GoTo find0
        Next i
        
        Error = "NO" 'GoTo notfind
find0:
        nw = xI(i)
    Case "regcl"
        reg = True
        Form1.regst nw, clk

    Case "pause"
        nw = maxL
    Case "lgoto", "大于跳转"
    
        If bigger Then nw = Val(a) - 1
    Case "isgoto", "等于跳转"
        If same Then nw = Val(a) - 1
    Case "sgoto", "小于跳转"
        If (Not bigger) And (Not same) Then nw = Val(a) - 1
    Case "goto", "跳转"
        nw = Val(a) - 1
    Case "errgoto", "错误跳转"
        errlinE = Val(a)
    Case "toi", "整赋值"
        For i = 0 To Maxspace
            If Nx1(i) = a Then x1 = i
        Next i
    xI(x1) = Val(b)
    Case "sleep"
        Sleep getint(a)
    Case "tod", "实赋值", "小数赋值"
        For i = 0 To Maxspace
            If D(i) = a Then x1 = i
        Next i
    D(x1) = Val(b)
    Case "tos", "字符串赋值"
        For i = 0 To Maxspace
            If Bo(i) = a Then x1 = i
        Next i
        ox(x1) = b
    Case "tob", "字节赋值"
        For i = 0 To Maxspace
            If C(i) = a Then x1 = i
        Next i
    C(x1) = Val(b)
    Case "gpu"
        gpu a, b
    
Case Else
    For i = 0 To Maxspace
        If Bo(i) = a Then x1 = i: GoTo xx1
        If Nx1(i) = a Then x1 = i: GoTo xx1
        If Nd(i) = a Then x1 = i: GoTo xx1
        If Nc(i) = a Then x1 = i: GoTo xx1
    Next i
xx1:
    x0 = x1
    For i = 0 To Maxspace
        If Bo(i) = b Then x1 = i: GoTo xx11
        If Nx1(i) = b Then x1 = i: GoTo xx11
        If Nd(i) = b Then x1 = i: GoTo xx11
        If Nc(i) = b Then x1 = i: GoTo xx11
    Next i
xx11:
    zhix cm, x0, x1
End Select
 XZHI = nw + 1
Exit Function
err0:
error0 = Error
XZHI = errlinE

End Function
Private Sub lookfree(tp As Integer, name As String)
Select Case tp
    Case 0
    For v = 0 To Maxspace
        If Nx1(v) = "" Then Nx1(v) = name: Exit Sub
    Next v

    Case 1
    For v = 0 To Maxspace
        If Nd(v) = "" Then Nd(v) = name: Exit Sub
    Next v

    Case 2
    For v = 0 To Maxspace
        If Nc(v) = "" Then Nc(v) = name: Exit Sub
    Next v
    
    Case 3
    For v = 0 To Maxspace
        If Bo(v) = "" Then Bo(v) = name: Exit Sub
    Next v
    
    
    
End Select
End Sub

Private Sub zhix(smc As String, can1 As Integer, Optional can2 As Integer)
m = can1
n = can2

    Select Case LCase(smc)
        Case "整和", "整加", "整数加", "整数和", "addi"
            xI(can1) = xI(can1) + xI(can2)
        Case "简单和", "简单加", "扩展加", "扩展和", "addx"
            D(can1) = D(can1) + xI(can2)
        Case "小数加", "小数和", "实数加", "实数和", "addd"
            D(can1) = D(can1) + D(can2)
        Case "rnd"
            D(can1) = Rnd
        Case "整拷贝", "整移", "整数拷贝", "整数移", "movi"
            xI(can1) = xI(can2)
        Case "实拷贝", "实移", "实数拷贝", "实数移", "movd"
            D(can1) = D(can2)
        Case "字符串拷贝", "字符串移", "movb"
            ox(can1) = ox(can2)
        Case "字节拷贝", "字节移", "movc"
            C(can1) = C(can2)
            
        Case "整差", "整数差", "subi"
            xI(can1) = xI(can1) - xI(can2)
        Case "实差", "实数差", "subd"
            D(can1) = D(can1) - D(can2)
        Case "实差整", "dsubi"
            D(can1) = D(can1) - xI(can2)
        Case "整差实", "isubd"
            xI(can1) = Fix(xI(can1) - D(can2))
        Case "fix", "取整"
            xI(can1) = Fix(D(xan2))
        '乘除
        Case "divi", "整除模", "整商模"
            ma = xI(can1) \ xI(can2)
            pa = xI(can1) Mod xI(can2)
            xI(can1) = ma
            xI(can2) = pa
        Case "divd", "除"
            D(can1) = D(can1) / D(can2)
        Case "idivd", "整除实"
            D(can1) = xI(can1) / D(can2)
        Case "ddivi", "实除整"
            D(can1) = D(can1) / xI(can2)
            
        Case "muli", "整积", "整乘"
            xI(can1) = xI(can1) * xI(can2)
        Case "mulx", "整乘实", "整实积"
            D(can1) = D(can1) * xI(can2)
        Case "muld", "实积", "实乘"
            D(can1) = D(can1) * D(can2)
        '比较
        Case "cmpi", "整比较"
            If xI(m) > xI(n) Then
                bigger = True
                same = False
            Else
                If xI(m) = xI(n) Then
                    same = True
                Else
                    same = False
                End If
                bigger = False
            End If
        Case "cmpd", "实比较"
            If D(m) > D(n) Then
                bigger = True
            Else
                bigger = False
            End If
        Case "cmps", "字符串比较"
            same = False
            If ox(m) = ox(n) Then same = True
        '转换
        Case "i2c", "整转短"
            C(can2) = xI(can1) Mod 256
        Case "i2d", "整转实"
            D(can2) = xI(can1)
        Case "d2i", "实转整"
            xI(can2) = Fix(D(can1))
        Case "s2d", "取实数"
            D(can2) = Val(ox(can1))
        Case "d2s", "实转字符串"
            ox(can2) = CStr(D(can1))
        Case "s2i", "取整数"
            xI(can2) = Val(ox(can1))
        Case "i2s", "整转字符串"
            ox(can2) = CStr(xI(can1))
        '字符串
        Case "mid", "取单字", "取字"
            ox(m) = Mid(ox(m), xI(n), 1)
        Case "connect", "连接"
            ox(m) = ox(m) + ox(n)
        Case "leftcut", "取左", "左截取"
            ox(m) = Left(ox(m), xI(n))
        Case "rightcut", "取右", "右截取"
            ox(m) = Right(ox(m), xI(n))
        '输入
        Case "ini", "输入整", "输入整数"
            xI(can1) = Fix(Val(InputBox(g)))
        Case "ind", "输入实数", "输入实"
            D(can1) = Val(InputBox(g))
        Case "ins", "输入"
            ox(can1) = InputBox(g)
        '输出
        Case "outs", "输出"
            MsgBox ox(can1)
        Case "outd", "输出实数", "输出实"
            MsgBox D(can1)
        Case "outi", "输出整数", "输出整"
            MsgBox xI(can1)
        Case "outg", "输入提示", "设提示", "设置提示"
            g = ox(m)
        Case Else
            trAns LCase(smc), can1, can2
    End Select
End Sub
Private Sub gpu(grp As String, words As String)
Dim a As String, b As String, C As String
Dim a0 As Integer, b0 As Integer, c0 As Integer
Select Case grp
    Case "show"
        Form1.Show
    Case "topoint"
        Nowx = getint(getword(words))
        Nowy = getint(getword(words))
    Case "pset"
        a0 = getint(getword(words)) Mod 256
        b0 = getint(getword(words)) Mod 256
        c0 = getint(getword(words)) Mod 256
        gpuP(Nowx, Nowy) = RGB(a0, b0, c0)
        Form1.PSet (Nowx, Nowy), RGB(a0, b0, c0)
    Case "height"
    Dim aa0 As Double
        aa0 = getdbl(getword(words))
        ht aa0 * 8000
    Case "width"
    Dim aaa0 As Double
        aaa0 = getdbl(getword(words))
        wdt aaa0 * 8000
        'b0 = getint(getword(words)) Mod 256
        '
    Case "scale"
    Dim a0x As Long, b0x As Long
        a0x = getint(getword(words))
        b0x = getint(getword(words))
       scl a0x, b0x
    Case "rgb"
        a0 = getint(getword(words)) Mod 256
        b0 = getint(getword(words)) Mod 256
        c0 = getint(getword(words)) Mod 256
        gpuP(Nowx, Nowy) = RGB(a0, b0, c0)
    Case "rfs", "refresh"
        For i = 0 To 400
            For j = 0 To 400
                Form1.PSet (i, j), gpuP(i, j)
            Next j
         DoEvents
         Next i
        DoEvents
    Case "line1"
        xa = xI(a)
        ya = xI(b)
        
    Case "line2"
        xb = xI(a)
        yb = xI(b)
    Case "words"
        Form1.CurrentX = Nowx
        Form1.CurrentY = Nowy
        Form1.FontSize = xI(b)
        Form1.pr ox(a)
    Case "nline"
        color0 = xI(a)
        type0 = xI(b)
        If type0 = 0 Then Form1.Line (xa, ya)-(xb, yb), color0
        If type0 = 1 Then Form1.Line (xa, ya)-(xb, yb), color0, BF
    Case "xline"
        color0 = gpuP(Nowx, Nowy)
        Form1.DrawWidth = xI(a)
        type0 = xI(b)
        If type0 = 0 Then Form1.Line (xa, ya)-(xb, yb), color0
        If type0 = 1 Then Form1.Line (xa, ya)-(xb, yb), color0, BF
End Select
End Sub
Private Function getword(ByRef us As String) As String
xxx = InStr(1, us, ",", vbTextCompare)
getword = Left(us, xxx - 1)
us = Right(us, Len(us) - xxx)
End Function
Private Sub trAns(str As String, a As Integer, Optional b As Integer)
Select Case str
    Case "gettime", "获取时间", "时间"
        ox(a) = CStr(Time)
    Case "iferr", "取错误值", "取错误"
        ox(a) = CStr(error0)
        error0 = ""
    Case "system"
        Shell ox(a), vbNormalNoFocus

    Case "getweb"
        
End Select
End Sub

Private Sub Class_Initialize()
g = "Input"
Maxspace = 100
errlinE = 255
End Sub
Private Function getdbl(b As String) As Double
If Left(b, 1) > "9" Or Left(b, 1) < "0" Then
For i = 0 To Maxspace
       ' If Bo(i) = b Then getint = i: Exit Function
        If Nx1(i) = b Then getdbl = CDbl(xI(i)): Exit Function
        If Nd(i) = b Then getdbl = CDbl(D(i)): Exit Function
        If Nc(i) = b Then getdbl = CDbl(C(i)): Exit Function
Next i
Else
    getdbl = CDbl(b)
End If
End Function

Private Function getint(b As String) As Long
If Left(b, 1) > "9" Or Left(b, 1) < "0" Then
For i = 0 To Maxspace
       ' If Bo(i) = b Then getint = i: Exit Function
        If Nx1(i) = b Then getint = CLng(xI(i)): Exit Function
        If Nd(i) = b Then getint = CLng(D(i)): Exit Function
        If Nc(i) = b Then getint = CLng(C(i)): Exit Function
Next i
Else
    getint = CLng(b)
End If
End Function
