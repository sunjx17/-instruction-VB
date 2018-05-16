VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Object = "{3050F1C5-98B5-11CF-BB82-00AA00BDCE0B}#4.0#0"; "mshtml.tlb"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{94A0E92D-43C0-494E-AC29-FD45948A5221}#1.0#0"; "wiaaut.dll"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{314111BA-A502-11D2-BBCA-00C04F8EC294}#1.0#0"; "hxvz.dll"
Object = "{0292CB00-E841-4D56-8438-BE47A6CEE87D}#1.1#0"; "jhhb5.ocx"
Object = "{FAEEE763-117E-101B-8933-08002B2F4F5A}#1.1#0"; "DBLIST32.OCX"
Object = "{5C8CED40-8909-11D0-9483-00A0C91110ED}#1.0#0"; "MSDATREP.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{B0EDF154-910A-11D2-B632-00C04F79498E}#1.0#0"; "msvidctl.dll"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "msscript.ocx"
Object = "{05BFD3F1-6319-4F30-B752-C7A22889BCC4}#1.0#0"; "AcroPDF.dll"
Object = "Paint.Picture"; "mspaint.exe"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{1E9A88A4-2968-11D1-851D-00A0C911E8B0}#1.0#0"; "VCMVMB.OCX"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   8400
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   13785
   LinkTopic       =   "Form2"
   ScaleHeight     =   8400
   ScaleWidth      =   13785
   StartUpPosition =   3  '窗口缺省
   Begin ComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   13785
      _ExtentX        =   24315
      _ExtentY        =   741
      Appearance      =   1
      _Version        =   327682
   End
   Begin MSDataRepeaterLib.DataRepeater DataRepeater1 
      Height          =   1080
      Left            =   120
      TabIndex        =   13
      Top             =   4320
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   1905
      _StreamID       =   -1412567295
      _Version        =   393216
      Caption         =   "DataRepeater1"
      BeginProperty RepeatedControlName {21FC0FC0-1E5C-11D1-A327-00AA00688B10} 
         _StreamID       =   -1412567295
         _Version        =   65536
      EndProperty
   End
   Begin VisModelBrowser.VMBrowser VMBrowser1 
      Height          =   1095
      Left            =   11400
      TabIndex        =   1
      Top             =   6840
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   1931
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   2040
      Top             =   6120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   9960
      TabIndex        =   40
      Top             =   7200
      Width           =   1215
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   1095
      Left            =   8880
      TabIndex        =   39
      Top             =   6360
      Width           =   495
   End
   Begin VB.Timer Timer1 
      Left            =   6600
      Top             =   7560
   End
   Begin VB.DriveListBox Drive1 
      Height          =   300
      Left            =   6240
      TabIndex        =   38
      Top             =   7080
      Width           =   1815
   End
   Begin VB.DirListBox Dir1 
      Height          =   930
      Left            =   3240
      TabIndex        =   37
      Top             =   7080
      Width           =   2775
   End
   Begin VB.FileListBox File1 
      Height          =   810
      Left            =   360
      TabIndex        =   36
      Top             =   7080
      Width           =   2535
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access 2000;"
      DatabaseName    =   ""
      DefaultCursorType=   0  '缺省游标
      DefaultType     =   2  '使用 ODBC
      Exclusive       =   0   'False
      Height          =   1095
      Left            =   11880
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   ""
      Top             =   2040
      Width           =   1860
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   855
      Left            =   7680
      TabIndex        =   34
      Top             =   6120
      Width           =   1095
      ExtentX         =   1931
      ExtentY         =   1508
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin MSHTMLCtl.Scriptlet Scriptlet1 
      Height          =   975
      Left            =   12600
      TabIndex        =   33
      Top             =   5760
      Width           =   1215
      Scrollbar       =   0   'False
      URL             =   "about:blank"
   End
   Begin MSChart20Lib.MSChart MSChart1 
      Height          =   1455
      Left            =   240
      OleObjectBlob   =   "Form2.frx":0000
      TabIndex        =   32
      Top             =   5400
      Width           =   1695
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   8040
      Top             =   5280
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSForms.Frame Frame1 
      Height          =   495
      Left            =   2400
      OleObjectBlob   =   "Form2.frx":234D
      TabIndex        =   30
      Top             =   4080
      Width           =   1215
   End
   Begin MSForms.MultiPage MultiPage1 
      Height          =   495
      Left            =   8160
      OleObjectBlob   =   "Form2.frx":2D65
      TabIndex        =   19
      Top             =   4680
      Width           =   3135
   End
   Begin MSHelpControls.HxTocCtrl HxTocCtrl1 
      Height          =   1455
      Left            =   9480
      TabIndex        =   18
      Top             =   2760
      Width           =   2295
      _cx             =   4048
      _cy             =   2566
      HideSelection   =   0   'False
      LineStyle       =   1
      TreeStyle       =   7
      Appearance      =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BorderStyle     =   0
      MousePointer    =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Microsoft YaHei UI"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      LangId          =   2052
      FontSource      =   0
   End
   Begin MSHelpControls.HxIndexCtrl HxIndexCtrl1 
      Height          =   1455
      Left            =   9480
      TabIndex        =   17
      Top             =   840
      Width           =   2415
      _cx             =   4260
      _cy             =   2566
      Appearance      =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      HighlightBackColor=   -2147483633
      HighlightForeColor=   -2147483630
      FocusHighlightBackColor=   -2147483635
      FocusHighlightForeColor=   -2147483634
      BorderStyle     =   0
      MousePointer    =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Microsoft YaHei UI"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      LangId          =   2052
      FontSource      =   0
   End
   Begin GspControl.gsp gsp1 
      Height          =   615
      Left            =   2520
      TabIndex        =   16
      Top             =   3360
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   1085
      Window          =   -1  'True
      N               =   "Form2.frx":457D
   End
   Begin MSDBCtls.DBList DBList1 
      Height          =   1320
      Left            =   6480
      TabIndex        =   15
      Top             =   4560
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   2328
      _Version        =   393216
   End
   Begin MSDBCtls.DBCombo DBCombo1 
      Height          =   330
      Left            =   4560
      TabIndex        =   14
      Top             =   4680
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   582
      _Version        =   393216
      Text            =   "DBCombo1"
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   615
      Left            =   1920
      TabIndex        =   12
      Top             =   4440
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   1085
      _Version        =   393216
   End
   Begin ComctlLib.TabStrip TabStrip1 
      Height          =   975
      Left            =   6240
      TabIndex        =   11
      Top             =   840
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   1720
      _Version        =   327682
      BeginProperty Tabs {0713E432-850A-101B-AFC0-4210102A8DA7} 
         NumTabs         =   1
         BeginProperty Tab1 {0713F341-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   ""
            Key             =   ""
            Object.Tag             =   ""
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin AcroPDFLibCtl.AcroPDF AcroPDF1 
      Height          =   615
      Left            =   1440
      TabIndex        =   9
      Top             =   3120
      Width           =   735
      _cx             =   5080
      _cy             =   5080
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   8145
      Width           =   13785
      _ExtentX        =   24315
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ProgressBar ProgressBar1 
      Height          =   135
      Left            =   5760
      TabIndex        =   7
      Top             =   2880
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   238
      _Version        =   327682
      Appearance      =   1
   End
   Begin ComctlLib.TreeView TreeView1 
      Height          =   1215
      Left            =   4200
      TabIndex        =   6
      Top             =   2040
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   2143
      _Version        =   327682
      Style           =   7
      Appearance      =   1
   End
   Begin ComctlLib.ListView ListView1 
      Height          =   375
      Left            =   7200
      TabIndex        =   5
      Top             =   1200
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin ComctlLib.Slider Slider1 
      Height          =   195
      Left            =   5760
      TabIndex        =   4
      Top             =   3600
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   344
      _Version        =   327682
   End
   Begin RichTextLib.RichTextBox RichTextBox1 
      Height          =   615
      Left            =   7200
      TabIndex        =   2
      Top             =   1680
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   1085
      _Version        =   393217
      TextRTF         =   $"Form2.frx":459E
   End
   Begin MSScriptControlCtl.ScriptControl ScriptControl1 
      Left            =   3600
      Top             =   2760
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin VB.Shape Shape1 
      Height          =   495
      Left            =   12120
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Line Line1 
      X1              =   6240
      X2              =   7200
      Y1              =   600
      Y2              =   600
   End
   Begin VB.Image Image2 
      Height          =   615
      Left            =   4800
      Top             =   6360
      Width           =   975
   End
   Begin VB.OLE OLE1 
      Class           =   "Package"
      Height          =   1335
      Left            =   12480
      OleObjectBlob   =   "Form2.frx":462D
      SourceDoc       =   "E:\编程\工程\VB\vb6\zhiling\e.txt"
      TabIndex        =   35
      Top             =   4080
      Width           =   1215
   End
   Begin WMPLibCtl.WindowsMediaPlayer WindowsMediaPlayer1 
      Height          =   975
      Left            =   8880
      TabIndex        =   31
      Top             =   5160
      Width           =   2175
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "full"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   3836
      _cy             =   1720
   End
   Begin WIACtl.DeviceManager DeviceManager1 
      Left            =   8640
      Top             =   3960
   End
   Begin MSForms.Label Label1 
      Height          =   495
      Left            =   3360
      TabIndex        =   29
      Top             =   6120
      Width           =   975
      Size            =   "1720;873"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.CommandButton CommandButton1 
      Height          =   375
      Left            =   3600
      TabIndex        =   28
      Top             =   1440
      Width           =   495
      Size            =   "873;661"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
      ParagraphAlign  =   3
   End
   Begin MSForms.TextBox TextBox1 
      Height          =   495
      Left            =   5880
      TabIndex        =   27
      Top             =   2160
      Width           =   1335
      VariousPropertyBits=   746604571
      Size            =   "2355;873"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.ListBox ListBox1 
      Height          =   1335
      Left            =   11400
      TabIndex        =   26
      Top             =   4800
      Width           =   975
      ScrollBars      =   3
      DisplayStyle    =   2
      Size            =   "1720;2355"
      MatchEntry      =   0
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.ComboBox ComboBox1 
      Height          =   975
      Left            =   5040
      TabIndex        =   25
      Top             =   5280
      Width           =   975
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "1720;1720"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.CheckBox CheckBox1 
      Height          =   375
      Left            =   6600
      TabIndex        =   24
      Top             =   4080
      Width           =   1815
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   4
      Size            =   "3201;661"
      Value           =   "0"
      Caption         =   "CheckBox1"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.OptionButton OptionButton1 
      Height          =   375
      Left            =   7800
      TabIndex        =   23
      Top             =   3000
      Width           =   1575
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      DisplayStyle    =   5
      Size            =   "2778;661"
      Value           =   "0"
      Caption         =   "OptionButton1"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
   End
   Begin MSForms.ScrollBar ScrollBar1 
      Height          =   1095
      Left            =   13080
      TabIndex        =   22
      Top             =   720
      Width           =   375
      Size            =   "661;1931"
   End
   Begin MSForms.TabStrip TabStrip2 
      Height          =   855
      Left            =   2280
      TabIndex        =   21
      Top             =   5160
      Width           =   2295
      ListIndex       =   0
      Size            =   "4048;1508"
      Items           =   "Tab1;Tab2;"
      TipStrings      =   ";;"
      Names           =   "Tab1;Tab2;"
      NewVersion      =   -1  'True
      TabsAllocated   =   2
      Tags            =   ";;"
      TabData         =   2
      Accelerator     =   ";;"
      FontName        =   "宋体"
      FontHeight      =   180
      FontCharSet     =   134
      FontPitchAndFamily=   34
      TabState        =   "3;3"
   End
   Begin MSForms.SpinButton SpinButton1 
      Height          =   1095
      Left            =   12480
      TabIndex        =   20
      Top             =   720
      Width           =   375
      Size            =   "661;1931"
   End
   Begin MSForms.Image Image1 
      Height          =   615
      Left            =   7920
      Top             =   600
      Width           =   1095
      Size            =   "1931;1085"
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   240
      Top             =   3360
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327682
   End
   Begin MSVidCtlLibCtl.MSVidCtl MSVidCtl1 
      Height          =   495
      Left            =   4080
      TabIndex        =   3
      Top             =   3600
      Width           =   1455
      _cx             =   2566
      _cy             =   873
      AutoSize        =   0   'False
      Enabled         =   0   'False
      Object.TabStop         =   0   'False
      BackColor       =   0
   End
   Begin PaintCtl.Picture Picture1 
      Height          =   2835
      Left            =   480
      OleObjectBlob   =   "Form2.frx":5045
      TabIndex        =   0
      Top             =   120
      Width           =   2835
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

