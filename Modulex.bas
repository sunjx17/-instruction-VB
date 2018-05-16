Attribute VB_Name = "Module1"
Sub Main()
Open Command For Input As #1
i = 0
Dim a(1000) As String
Do Until EOF(1)
Line Input #1, a(i)
i = i + 1
Loop
Close #1
Open Command For Output As #2
For j = 0 To i - 1
a(j) = CStr(j) + ":" + a(j)
Print #2, a(j)
Next j


End Sub
