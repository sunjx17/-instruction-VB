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
    Case "int", "����"
        lookfree 0, a
    Case "dbl", "С��", "ʵ��"
        lookfree 1, a
    Case "chr", "�ֽ�", "�ַ�"
        lookfree 2, a
    Case "space", "ʹ��", "�ռ�"
        Maxspace = Val(a)
    Case "str", "�ַ���"
        lookfree 3, a
    Case "allfre", "����"
        For i = 0 To Val(a)
             Bo(i) = "": ox(i) = ""
             Nx1(i) = "": xI(i) = 0
             Nd(i) = "": D(i) = 0
            Nc(i) = "": C(i) = 0
        Next i
    Case "tfre", "ȫ������", "��ʼ��"
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
    Case "lgoto", "������ת"
    
        If bigger Then nw = Val(a) - 1
    Case "isgoto", "������ת"
        If same Then nw = Val(a) - 1
    Case "sgoto", "С����ת"
        If (Not bigger) And (Not same) Then nw = Val(a) - 1
    Case "goto", "��ת"
        nw = Val(a) - 1
    Case "errgoto", "������ת"
        errlinE = Val(a)
    Case "toi", "����ֵ"
        For i = 0 To Maxspace
            If Nx1(i) = a Then x1 = i
        Next i
    xI(x1) = Val(b)
    Case "sleep"
        Sleep getint(a)
    Case "tod", "ʵ��ֵ", "С����ֵ"
        For i = 0 To Maxspace
            If D(i) = a Then x1 = i
        Next i
    D(x1) = Val(b)
    Case "tos", "�ַ�����ֵ"
        For i = 0 To Maxspace
            If Bo(i) = a Then x1 = i
        Next i
        ox(x1) = b
    Case "tob", "�ֽڸ�ֵ"
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
        Case "����", "����", "������", "������", "addi"
            xI(can1) = xI(can1) + xI(can2)
        Case "�򵥺�", "�򵥼�", "��չ��", "��չ��", "addx"
            D(can1) = D(can1) + xI(can2)
        Case "С����", "С����", "ʵ����", "ʵ����", "addd"
            D(can1) = D(can1) + D(can2)
        Case "rnd"
            D(can1) = Rnd
        Case "������", "����", "��������", "������", "movi"
            xI(can1) = xI(can2)
        Case "ʵ����", "ʵ��", "ʵ������", "ʵ����", "movd"
            D(can1) = D(can2)
        Case "�ַ�������", "�ַ�����", "movb"
            ox(can1) = ox(can2)
        Case "�ֽڿ���", "�ֽ���", "movc"
            C(can1) = C(can2)
            
        Case "����", "������", "subi"
            xI(can1) = xI(can1) - xI(can2)
        Case "ʵ��", "ʵ����", "subd"
            D(can1) = D(can1) - D(can2)
        Case "ʵ����", "dsubi"
            D(can1) = D(can1) - xI(can2)
        Case "����ʵ", "isubd"
            xI(can1) = Fix(xI(can1) - D(can2))
        Case "fix", "ȡ��"
            xI(can1) = Fix(D(xan2))
        '�˳�
        Case "divi", "����ģ", "����ģ"
            ma = xI(can1) \ xI(can2)
            pa = xI(can1) Mod xI(can2)
            xI(can1) = ma
            xI(can2) = pa
        Case "divd", "��"
            D(can1) = D(can1) / D(can2)
        Case "idivd", "����ʵ"
            D(can1) = xI(can1) / D(can2)
        Case "ddivi", "ʵ����"
            D(can1) = D(can1) / xI(can2)
            
        Case "muli", "����", "����"
            xI(can1) = xI(can1) * xI(can2)
        Case "mulx", "����ʵ", "��ʵ��"
            D(can1) = D(can1) * xI(can2)
        Case "muld", "ʵ��", "ʵ��"
            D(can1) = D(can1) * D(can2)
        '�Ƚ�
        Case "cmpi", "���Ƚ�"
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
        Case "cmpd", "ʵ�Ƚ�"
            If D(m) > D(n) Then
                bigger = True
            Else
                bigger = False
            End If
        Case "cmps", "�ַ����Ƚ�"
            same = False
            If ox(m) = ox(n) Then same = True
        'ת��
        Case "i2c", "��ת��"
            C(can2) = xI(can1) Mod 256
        Case "i2d", "��תʵ"
            D(can2) = xI(can1)
        Case "d2i", "ʵת��"
            xI(can2) = Fix(D(can1))
        Case "s2d", "ȡʵ��"
            D(can2) = Val(ox(can1))
        Case "d2s", "ʵת�ַ���"
            ox(can2) = CStr(D(can1))
        Case "s2i", "ȡ����"
            xI(can2) = Val(ox(can1))
        Case "i2s", "��ת�ַ���"
            ox(can2) = CStr(xI(can1))
        '�ַ���
        Case "mid", "ȡ����", "ȡ��"
            ox(m) = Mid(ox(m), xI(n), 1)
        Case "connect", "����"
            ox(m) = ox(m) + ox(n)
        Case "leftcut", "ȡ��", "���ȡ"
            ox(m) = Left(ox(m), xI(n))
        Case "rightcut", "ȡ��", "�ҽ�ȡ"
            ox(m) = Right(ox(m), xI(n))
        '����
        Case "ini", "������", "��������"
            xI(can1) = Fix(Val(InputBox(g)))
        Case "ind", "����ʵ��", "����ʵ"
            D(can1) = Val(InputBox(g))
        Case "ins", "����"
            ox(can1) = InputBox(g)
        '���
        Case "outs", "���"
            MsgBox ox(can1)
        Case "outd", "���ʵ��", "���ʵ"
            MsgBox D(can1)
        Case "outi", "�������", "�����"
            MsgBox xI(can1)
        Case "outg", "������ʾ", "����ʾ", "������ʾ"
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
    Case "gettime", "��ȡʱ��", "ʱ��"
        ox(a) = CStr(Time)
    Case "iferr", "ȡ����ֵ", "ȡ����"
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
