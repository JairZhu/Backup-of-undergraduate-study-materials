Attribute VB_Name = "modDraw"
Option Explicit

Const mMax = 200

Private Type Sck
   xleft As Integer
   x As Integer
   y As Integer
End Type

Dim stack(mMax) As Sck
Dim scnt As Integer
Public Sub dmline(pc As PictureBox, x1, y1, z1, x2, y2, z2)

'Dim x12 As Integer
'Dim y12 As Integer
'Dim x22 As Integer
'Dim y22 As Integer
Dim p1 As Point
Dim p2 As Point
ChangCoodirate x1, y1, z1, p1.x, p1.y
ChangCoodirate x2, y2, z2, p2.x, p2.y
myline pc, p1, p2, 1, 1, RGB(0, 0, 0)

End Sub

Public Sub ChangCoodirate(x, y, z, nx, ny)
Dim R As Integer
R = 60 / 180 * 3.14159
nx = x - z * Cos(R)
ny = y - z * Sin(R)
End Sub
Public Sub BYangTiao(pc As PictureBox, PO() As Point, pcnt As Integer, col As ColorConstants)
Dim Matrix(40, 40) As Double
Dim D(40) As Double
Dim h(40) As Double
Dim x As Double
Dim y As Double
Dim px As Integer
Dim py As Integer
Dim nx As Integer
Dim ny As Integer
Dim f0 As Double
Dim fbcnt As Double
Dim i As Double
Dim j As Integer
Dim k As Integer
Dim m(40) As Double
Dim ti As Integer
Dim newx As Double
Dim newy As Double
Dim de As Integer
Dim temp As Double

Dim opcnt As Integer
opcnt = pcnt

For i = 1 To pcnt
 PO(i - 1) = PO(i)
Next

pcnt = pcnt - 1
f0 = 0
fbcnt = 0
For i = 1 To pcnt
   h(i - 1) = PO(i).x - PO(i - 1).x
Next
D(0) = 6 * ((PO(1).y - PO(0).y) / h(0) - f0)
For i = 1 To pcnt - 1
  D(i) = 6 * ((PO(i + 1).y - PO(i).y) / h(i - 1) - (PO(i).y - PO(i - 1).y) / h(i))
Next
D(pcnt) = 6 * (fbcnt - (PO(pcnt).y - PO(pcnt - 1).y) / h(pcnt - 1))


Matrix(0, 0) = 2 * h(0)
Matrix(0, 1) = h(0)
Matrix(pcnt, pcnt - 1) = h(pcnt - 1)
Matrix(pcnt, pcnt) = 2 * h(pcnt - 1)
For i = 1 To pcnt - 1
  Matrix(i, i - 1) = h(i - 1)
  Matrix(i, i) = 2 * (h(i - 1) + h(i))
  Matrix(i, i + 1) = h(i)
Next

For i = 0 To pcnt
  For j = 0 To pcnt
    If j <> i Then
        temp = Matrix(j, i)
        For k = 0 To pcnt
           Matrix(j, k) = Matrix(j, k) - Matrix(i, k) / Matrix(i, i) * temp
        Next
        D(j) = D(j) - D(i) * temp / Matrix(i, i)
    End If
  Next
Next

For i = 0 To pcnt
  D(i) = D(i) / Matrix(i, i)
Next

For i = 0 To pcnt
  m(i) = D(i)
Next

px = PO(0).x
py = PO(0).y

de = -1

For i = PO(0).x To PO(pcnt).x - 1 Step 1
    For ti = 0 To pcnt
       If PO(ti).x > i Then Exit For
    Next
    ti = ti - 1
    If ti > de Then
       DoEvents
       de = ti
    End If
    If i > 40 Then
       DoEvents
    End If
    newx = i
    newy = m(ti) * (PO(ti + 1).x - newx) * (PO(ti + 1).x - newx) * (PO(ti + 1).x - newx) / (6 * h(ti)) + m(ti + 1) * (newx - PO(ti).x) * (newx - PO(ti).x) * (newx - PO(ti).x) / (6 * h(ti)) + (PO(ti + 1).y / h(ti) - m(ti + 1) * h(ti) / 6) * (newx - PO(ti).x) + (PO(ti).y / h(ti) - m(ti) * h(ti) / 6) * (PO(ti + 1).x - newx)
    If newy > 3200 Then
       newy = 3200
    Else
       If newy < -3200 Then
          newy = -3200
       Else
          ny = newy
       End If
    End If
    nx = newx
    ny = newy
    pc.Line (px, py)-(nx, ny), col
    px = nx
    py = ny
    pc.PSet (px, py)
Next
'PC.Line (px, py)-(PO(pcnt).X, PO(pcnt).Y), Col
Dim PP As Point
PP.x = px
PP.y = py
myline pc, PP, PO(pcnt), 1, 1, col
pc.PSet (PO(pcnt).x, PO(pcnt).y)
pcnt = 0

pcnt = opcnt
For i = pcnt - 1 To 0 Step -1
 PO(i + 1) = PO(i)
Next

End Sub

Public Sub B3(pc As PictureBox, PO() As Point, col As ColorConstants)
Dim px As Integer
Dim py As Integer
Dim nx As Integer
Dim ny As Integer
Dim t As Double
px = PO(1).x
py = PO(1).y
pc.PSet (px, py)
For t = 0 To 1 Step 0.005
    nx = PO(1).x * (1 - t) * (1 - t) * (1 - t) + 3 * PO(2).x * (1 - t) * (1 - t) * t + 3 * PO(3).x * (1 - t) * t * t + PO(4).x * t * t * t
    ny = PO(1).y * (1 - t) * (1 - t) * (1 - t) + PO(2).y * 3 * (1 - t) * (1 - t) * t + 3 * PO(3).y * t * t * (1 - t) + PO(4).y * t * t * t
    pc.Line (px, py)-(nx, ny), col
    pc.PSet (nx, ny), col
    px = nx
    py = ny
Next

End Sub

Public Sub Lagenanri(pc As PictureBox, PO() As Point, pcnt As Integer, col As ColorConstants)
   Dim D(40) As Double
   Dim L(40) As Double
   Dim temp(40) As Double
   Dim B As Double
   Dim y As Double
   Dim mu As Double
   Dim i As Integer
   Dim id As Double
   Dim j As Integer
   Dim k As Integer
   Dim xi As Double
   Dim oldx As Double
   Dim oldy As Double
   Dim ti As Integer
   Dim bf As Boolean
   Dim sclleft As Integer
   Dim scltop As Integer
   Dim sclwidth As Integer
   Dim sclheight As Integer
   Dim th As Integer
   Dim tv As Integer
   Dim Vpo(20) As Point
   
   sclleft = pc.ScaleLeft
   scltop = pc.ScaleTop
   sclwidth = pc.ScaleWidth
   sclheight = pc.ScaleHeight
   th = sclwidth / 2
   tv = sclheight / 2
   'PC.Scale (-th, tv)-(th, -tv)
   pc.Scale (-th, tv)-(th, -tv)
   For i = 1 To pcnt
      Vpo(i).x = PO(i).x - th
      Vpo(i).y = -(PO(i).y - tv)
   Next
   
   oldx = Vpo(1).x
   oldy = Vpo(1).y
  ' pcnt = pcnt - 1
   For id = Vpo(1).x To Vpo(pcnt).x - 1 Step 1
        y = 0
        For ti = 1 To pcnt
           If id = Vpo(ti).x Then
              DoEvents
              bf = True
              Exit For
           Else
              bf = False
           End If
        Next
        For k = 0 To pcnt
          mu = Vpo(k).y
          For j = 0 To pcnt
            If j <> k Then
                mu = mu * (id - Vpo(j).x) / (Vpo(k).x - Vpo(j).x)
            End If
          Next
          y = y + mu
        Next
        If bf = True Then
           DoEvents
        End If
        pc.Line (oldx, oldy)-(id, y), col
        pc.PSet (id, y), col
        oldx = id
        oldy = y
    Next
    pc.Line (oldx, oldy)-(Vpo(pcnt).x, Vpo(pcnt).y), col
    pc.PSet (Vpo(pcnt).x, y), col

pc.Scale (sclleft, scltop)-(sclleft + sclwidth, scltop + sclheight)
End Sub

Public Sub myline(pc As PictureBox, PO1 As Point, PO2 As Point, width, solid, color)
  
  Dim Index As Integer
  Dim index2 As Integer
  Dim lx As Double
  Dim ly As Double
  
  Dim mstep As Integer
  Dim currentX As Long
  Dim currentY As Long
  Dim opo1x As Integer
  Dim opo1y As Integer
  Dim opo2x As Integer
  Dim opo2y As Integer
  Dim temp As Integer
  
  Dim mlen As Integer
  Dim index3 As Integer
  Dim starty As Integer
  Dim left As Integer
  
  opo1x = PO1.x
  opo1y = PO1.y
  opo2x = PO2.x
  opo2y = PO2.y
  
  If PO1.x = PO2.x And PO1.y = PO2.y Then
    pc.PSet (PO1.x, PO1.y), color
    Exit Sub
  End If
  For index2 = width / 2 - width To width / 2

    If Abs(PO1.x - PO2.x) >= Abs(PO1.y - PO2.y) Then
    
        PO1.y = opo1y + index2
        PO2.y = opo2y + index2
        currentX = PO1.x
        currentY = PO1.y
        lx = 1
        
        If (PO2.y - PO1.y) <> 0 Then
          ly = (PO2.y - PO1.y) / (PO2.x - PO1.x)
        Else
          ly = 0
        End If
        mstep = (PO2.x - PO1.x) / Abs(PO2.x - PO1.x)
        
        If solid = 1 Then
            For Index = PO1.x To PO2.x Step mstep
               pc.PSet (currentX, currentY), color
               currentX = currentX + mstep
               currentY = PO1.y + (currentX - PO1.x) * ly
            Next
            pc.PSet (PO2.x, PO2.y), color
        Else
            mlen = (PO2.x - PO1.x) \ 21
            left = (PO2.x - PO1.x) \ 21
            For index3 = 0 To 9
                 For Index = 0 To mlen Step mstep
                   pc.PSet (currentX, currentY), color
                   currentX = currentX + mstep
                   currentY = PO1.y + (currentX - PO1.x) * ly
                Next Index
                currentX = currentX + mlen
                currentY = PO1.y + (currentX - PO1.x) * ly
            Next index3
            temp = Index + 2 * index3 * mlen
            left = PO2.x - currentX
            For index3 = currentX To PO2.x + 1 Step mstep
               pc.PSet (index3, currentY), color
               currentY = PO1.y + (index3 - PO1.x) * ly
            Next index3
            pc.PSet (PO2.x, PO2.y), color
        End If
        
    Else
     
        PO1.x = opo1x + index2
        PO2.x = opo2x + index2
        currentX = PO1.x
        currentY = PO1.y
        If (PO2.x - PO1.x) <> 0 Then
          lx = (PO2.x - PO1.x) / (PO2.y - PO1.y)
        Else
          lx = 0
        End If
        ly = 1
        mstep = (PO2.y - PO1.y) / Abs(PO2.y - PO1.y)
        If solid = 1 Then
            For Index = PO1.y To PO2.y Step mstep
               pc.PSet (currentX, currentY), color
               currentY = currentY + mstep
               currentX = PO1.x + (currentY - PO1.y) * lx
            Next
            pc.PSet (PO2.x, PO2.y), color
        Else
        
            mlen = (PO2.y - PO1.y) \ 21
            left = (PO2.y - PO1.y) \ 21
            For index3 = 0 To 9
                 For Index = 0 To mlen Step mstep
                   pc.PSet (currentX, currentY), color
                   currentY = currentY + mstep
                   currentX = PO1.x + (currentY - PO1.y) * lx
                Next Index
                currentY = currentY + mlen
                currentX = PO1.x + (currentY - PO1.y) * lx
            Next index3
            temp = Index + 2 * index3 * mlen
            For index3 = currentY To PO2.y Step mstep
               pc.PSet (currentX, index3), color
               currentX = PO1.x + (index3 - PO1.y) * lx
            Next index3
            pc.PSet (PO2.x, PO2.y), color
        End If
    End If
  Next
  PO1.x = opo1x
  PO1.y = opo1y
  PO2.x = opo2x
  PO2.y = opo2y
  
End Sub

Public Sub myRect(pc As PictureBox, PO1 As Point, PO2 As Point, color_in, color_out, Optional HasColor = 1)
   Dim mpo1 As Point
   Dim mpo2 As Point
   Dim temp As Integer
   Dim Index As Integer
   Dim a1 As Integer
   Dim a2 As Integer
   Dim a3 As Integer
   Dim a4 As Integer
   
   a1 = PO1.x
   a2 = PO1.y
   a3 = PO2.x
   a4 = PO2.y
   If PO1.x < PO2.x And PO1.y < PO2.y Then
      temp = PO2.x
      PO2.x = PO1.x
      PO1.x = temp
      temp = PO2.y
      PO2.y = PO1.y
      PO1.y = temp
   End If
   
   If PO1.x < PO2.x And PO1.y > PO2.y Then
      temp = PO2.x
      PO2.x = PO1.x
      PO1.x = temp
   End If
   
   If PO1.x > PO2.x And PO1.y < PO2.y Then
      temp = PO1.y
      PO1.y = PO2.y
      PO2.y = temp
   End If
   
   If PO1.x > PO2.y And PO1.y > PO2.y Then
    mpo1.x = PO1.x - 1
    mpo2.x = PO2.x
    mpo1.y = PO2.y + 1
    mpo2.y = PO2.y + 1
    End If
    If mpo1.x = mpo2.x And mpo1.x <> 0 Then Exit Sub
    If HasColor = 1 Then
        'If PC.BackColor <> color_in Then
        For Index = 1 To Abs(PO1.y - PO2.y - 1)
           myline pc, mpo1, mpo2, 1, 1, color_in
           mpo1.y = mpo1.y + 1
           mpo2.y = mpo1.y
        Next
       ' End If
    End If

    
   temp = PO1.x
   PO1.x = PO2.x
   myline pc, PO1, PO2, 1, 1, color_out
   PO1.x = temp
   temp = PO2.x
   PO2.x = PO1.x
   myline pc, PO1, PO2, 1, 1, color_out
   PO2.x = temp
   temp = PO2.y
   PO2.y = PO1.y
   myline pc, PO1, PO2, 1, 1, color_out
   PO2.y = temp
   PO1.y = PO2.y
   myline pc, PO1, PO2, 1, 1, color_out
   PO1.x = a1
   PO1.y = a2
   PO2.x = a3
   PO2.y = a4
End Sub

Public Sub myPolygon(pc As PictureBox, POcnt As Integer, PO() As Point, color_in, color_out, Optional HasColor = 1)
   Dim i As Integer
   Dim A As Point
   Dim Xmax, Xmin, Ymax, Ymin
   Dim x, y As Integer
   
   For i = 1 To POcnt - 1
     myline pc, PO(i), PO(i + 1), 1, 1, color_out
   Next i
   myline pc, PO(POcnt), PO(1), 1, 1, color_out
   If pc.BackColor = color_in Then Exit Sub
   x = 0
   y = 0
   For i = 1 To POcnt
     x = x + PO(i).x
     y = y + PO(i).y
   Next i
   A.x = x / POcnt
   A.y = y / POcnt
   If HasColor = 1 Then
      setColor pc, A, color_in
   End If
   Exit Sub
   
'   Randomize Timer
'   For i = 1 To 1000
'       'a.X = PC.width * Rnd
'       'a.Y = PC.Height * (1 - Rnd)
'       a.X = Xmin + Int(Rnd * (Xmax - Xmin) + 1)
'       a.Y = Ymin + Int(Rnd * (Ymax - Ymin) + 1)
'       If Inside(a, POcnt, po) = True Then
'          setColor PC, a, color_in
'          Exit Sub
'       End If
'   Next i
 '  MsgBox "Random lost"
End Sub

Public Sub myCircle(pc As PictureBox, PO As Point, R, color_in, color_out, Optional HasColor = 1)
On Error GoTo handle
   
   Dim i1 As Boolean
   Dim PO1 As Point
   Dim PO2 As Point
   Dim PO3 As Point
   Dim PO4 As Point
   Dim r2 As Long
   Dim f As Currency
   Dim flag As Boolean
   
   i1 = False
   flag = False
   
   PO1.x = PO.x + R
   PO1.y = PO.y
   r2 = R * R
   f = 0
   
   PO2.x = PO1.x
   PO2.y = PO1.y
   While (i1 = False)
       PO1.x = 2 * PO.x - PO2.x
       PO1.y = 2 * PO.y - PO2.y
       PO3.x = PO1.x
       PO3.y = PO2.y
       PO4.x = PO2.x
       PO4.y = PO1.y
       
       'If color_in <> PC.BackColor And flag <> True And HasColor = 1 Then
       If flag <> True And HasColor = 1 Then
            myline pc, PO2, PO4, 1, 1, color_in
            myline pc, PO1, PO3, 1, 1, color_in
       End If
       
       pc.PSet (PO1.x, PO1.y), color_out
       pc.PSet (PO2.x, PO2.y), color_out
       pc.PSet (PO3.x, PO3.y), color_out
       pc.PSet (PO4.x, PO4.y), color_out
       If f > 0 Then
          PO2.x = PO2.x - 1
          f = (PO2.x - PO.x) * (PO2.x - PO.x) + (PO2.y - PO.y) * (PO2.y - PO.y) - r2
       '   f = ((PO2.X - PO.X)  * ((PO2.X - PO.X)  + ((PO2.Y - PO.Y)  * (PO2.Y - PO.Y) - 1
          flag = False
       Else
          flag = True
          PO2.y = PO2.y + 1
          f = (PO2.x - PO.x)
          f = f * (PO2.x - PO.x)
          f = f + (PO2.y - PO.y) * (PO2.y - PO.y)
          f = f - r2
       End If
       If PO2.x < PO.x Then i1 = True
   Wend
Exit Sub

handle:
 
   
End Sub

Public Sub myBline(pc As PictureBox, PO() As Point, width, color)
   Dim PO1 As Point
   Dim PO2 As Point
   Dim t As Double
   Dim mstep As Double
   Dim fen As Integer
   Dim i As Integer
   If PO(1).x <> PO(3).x Then
    
    fen = Abs(PO(1).x - PO(3).x)
    mstep = 1 / fen


    For i = 1 To width
        PO1.x = PO(1).x
        PO1.y = PO(1).y
        PO(1).y = PO(1).y + i - 1
        PO(2).y = PO(2).y + i - 1
        PO(3).y = PO(3).y + i - 1
        For t = mstep To 1 Step mstep
           'change place 2,3 by hpk
           PO2.x = (1 - t) * (1 - t) * PO(1).x + 2 * t * (1 - t) * PO(3).x + t * t * PO(2).x
           PO2.y = (1 - t) * (1 - t) * PO(1).y + 2 * t * (1 - t) * PO(3).y + t * t * PO(2).y
           myline pc, PO1, PO2, 1, 1, color
           PO1.x = PO2.x
           PO1.y = PO2.y
        Next t
    Next i
   End If
End Sub

Public Sub myEllispce(pc As PictureBox, PO As Point, A, B, color_in, color_out, Optional HasColor = 1)
   Dim i1 As Boolean
   Dim PO1 As Point
   Dim PO2 As Point
   Dim PO3 As Point
   Dim PO4 As Point
   Dim r2 As Long
   Dim f As Double
   Dim flag As Boolean
   
   If A = 0 Or B = 0 Then Exit Sub
   
   i1 = False
   flag = False
   
   PO1.x = PO.x + A
   PO1.y = PO.y
   f = 0
   
   PO2.x = PO1.x
   PO2.y = PO1.y
   While (i1 = False)
       PO1.x = 2 * PO.x - PO2.x
       PO1.y = 2 * PO.y - PO2.y
       PO3.x = PO1.x
       PO3.y = PO2.y
       PO4.x = PO2.x
       PO4.y = PO1.y
       'If color_in <> PC.BackColor And flag <> True And HasColor = 1 Then
       If flag <> True And HasColor = 1 Then
            myline pc, PO2, PO4, 1, 1, color_in
            myline pc, PO1, PO3, 1, 1, color_in
       End If
       pc.PSet (PO1.x, PO1.y), color_out
       pc.PSet (PO2.x, PO2.y), color_out
       pc.PSet (PO3.x, PO3.y), color_out
       pc.PSet (PO4.x, PO4.y), color_out
       If f > 0 Then
          PO2.x = PO2.x - 1
          f = ((PO2.x - PO.x) / A) * ((PO2.x - PO.x) / A) + ((PO2.y - PO.y) / B) * ((PO2.y - PO.y) / B) - 1
          flag = False
       Else
          flag = True
          PO2.y = PO2.y + 1
          f = ((PO2.x - PO.x) / A) * ((PO2.x - PO.x) / A) + ((PO2.y - PO.y) / B) * ((PO2.y - PO.y) / B) - 1
       End If
       If PO2.x < PO.x Then i1 = True
   Wend
End Sub

Public Sub setColor(pc As PictureBox, PO As Point, color)
   Dim flag As Boolean
   Dim mColor As Long
   Dim oldx As Integer
   Dim PO1 As Sck
   Dim left As Integer
   Dim right As Integer
   Dim left1 As Integer
   
   On Error GoTo ex
   If color = pc.Point(PO.x, PO.y) Then Exit Sub
   flag = False
   scnt = 1
   mColor = pc.Point(PO.x, PO.y)
   PO1.x = PO.x
   PO1.y = PO.y
   PO1.xleft = PO.x
 
   
   While (flag = False)
      If (pc.Point(PO1.x, PO1.y) <> color) Then
          oldx = PO1.x
          While (pc.Point(oldx, PO1.y) = mColor And oldx > 0)
             pc.PSet (oldx, PO1.y), color
             oldx = oldx - 1
          Wend
          left = oldx + 1
          oldx = PO1.x
          oldx = oldx + 1
          While (pc.Point(oldx, PO1.y) = mColor And oldx < pc.width)
             pc.PSet (oldx, PO1.y), color
             oldx = oldx + 1
          Wend
          oldx = oldx - 1
          
          If (Abs(PO1.xleft - left) > 1) Then
                GetSpecialPoint pc, stack, PO1.xleft, left, PO1.y, mColor
          End If
         
          If (pc.Point(oldx, PO1.y - 1) = mColor) Then
             right = oldx
          Else
             right = oldx - 1
             While (pc.Point(right, PO1.y - 1) <> mColor And right > 0)
                right = right - 1
             Wend
          End If
          If (right > left) Then
                stack(scnt).x = right
                stack(scnt).y = PO1.y - 1
                stack(scnt).xleft = left
                scnt = scnt + 1
                If scnt > mMax Then
                  MsgBox "too complicated picture!" & scnt
                  Exit Sub
                End If
          End If
          
          If (pc.Point(oldx, PO1.y + 1) = mColor) Then
             right = oldx
          Else
             right = oldx - 1
             While (pc.Point(right, PO1.y + 1) <> mColor And right > 0)
                right = right - 1
             Wend
          End If
        If (right > left) Then
           stack(scnt).x = right
           stack(scnt).y = PO1.y + 1
           stack(scnt).xleft = left
           scnt = scnt + 1
           If scnt > mMax Then
             MsgBox "too complicated picture!" & scnt
           Exit Sub
           End If
        End If
    End If
    
    If (scnt = 1) Then
       flag = True
    Else
       scnt = scnt - 1
       PO1.x = stack(scnt).x
       PO1.y = stack(scnt).y
       PO1.xleft = stack(scnt).xleft
    End If
   
   Wend
   
   Exit Sub
ex:
 MsgBox Err.Description & "as"
 'MsgBox scnt
End Sub

Private Sub GetSpecialPoint(pc As PictureBox, stack() As Sck, oleft As Integer, left As Integer, y As Integer, mColor)
   Dim lx As Integer
   Dim lx1 As Integer
   Dim ly As Integer
   Dim right As Integer
On Error GoTo ex
    
    If (left > oleft) Then
        lx1 = left
        ly = y
        Do
            lx = lx1 - 2
            If (pc.Point(lx, ly) = mColor) Then
               right = lx
            Else
               While (pc.Point(lx, ly) <> mColor And lx > 0)
                 lx = lx - 1
               Wend
               right = lx + 1
            End If

            If (right <= oleft) Then Exit Sub
            right = right - 1
            stack(scnt).x = right
            stack(scnt).y = ly
            stack(scnt).xleft = left
            
            'If scnt > 1 Then
            ' If stack(scnt).X = stack(scnt - 1).X And stack(scnt).Y = stack(scnt - 1).Y Then
            '  MsgBox "dd": Exit Sub
            ' End If
            'End If
            
            scnt = scnt + 1
            lx1 = right + 1
            If scnt > mMax Then
              MsgBox "too complicated picture!" & scnt
              Exit Sub
            End If
            While (pc.Point(right, ly) = mColor) And right < pc.width
               right = right - 1
            Wend
            right = right + 2
            lx1 = right
         Loop While (lx1 > oleft)
    End If
 Exit Sub
ex:
 MsgBox Err.Description & "ee"
End Sub

Sub ReDrawArea()
 ExecSource "setbackcolor[white];clear;"
 ExecSource frmMethord.txtMethord.Text
 frmDraw.PicBak.Picture = frmDraw.PicDraw.Image
 frmDraw.PicBak.Refresh
End Sub
