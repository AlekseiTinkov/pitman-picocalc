Option EXPLICIT
Option DEFAULT NONE

DefineFont #8
  15E00C08
  3F7F7FFF 070F1F1F 01010307 FCFEFEFF E0F0F8F8 8080C0E0 C0808000 F8F0E0E0
  FEFEFCF8 03010100 1F0F0707 7F7F3F1F 00000000 FFFF0000 FFFFFFFF FFFFFFFF
  0000FFFF 00000000 F0F0F0F0 F0F0F0F0 F0F0F0F0 0F0F0F0F 0F0F0F0F 0F0F0F0F
  0F0F0F0F F0F00F0F F0F0F0F0 808080FF 80808080 80808080 000000FF 00000000
  00000000 010101FF 01010101 01010101 80808080 80808080 80808080 01010101
  01010101 01010101 80808080 80808080 FF808080 00000000 00000000 FF000000
  01010101 01010101 FF010101 80808080 80808080 80808080 01010101 01010101
  01010101 000000FF 00000000 00000000 00000000 00000000 FF000000
End DefineFont

Const TRUE  = 1
Const FALSE = 0

Const WHITE       = RGB(255, 255, 255)
Const BLACK       = RGB(0, 0, 0)
Const BLUE        = RGB(0, 0, 255)
Const LIGHT_BLUE  = RGB(0, 255, 255)
Const RED         = RGB(255, 0, 0)
Const GREEN       = RGB(0, 255, 0)
Const YELLOW      = RGB(255, 255, 0)

Const B_SPACE       = 0
Const B_LADDER      = 1
Const B_DIAMOND     = 2
Const B_SOFT_BLOCK  = 3
Const B_BOX         = 4
Const B_HARD_BLOCK  = 5
Const B_PIT         = 6
Const B_PIT_RIGHT   = 7
Const B_PIT_LEFT    = 8
Const B_PIT_LADDER  = 9

Const LEVELS_COUNT  = 50

Dim integer FONT_STATE, COLOR_FG_STATE, COLOR_BG_STATE

Dim INTEGER M(10, 7)
Dim STRING LEVELS(LEVELS_COUNT - 1)

Dim integer SCREENSHOT_COUNTER : SCREENSHOT_COUNTER = 0

LEVELS(0)  = "0004000000015545055551100405000011063000000155550500001000050000012000000004155505550555"
LEVELS(1)  = "0040000000000404000000005123000000051322000200513330333205100333005051000000650555555555"
LEVELS(2)  = "0000605040000004151400000241512000023315122005211151550055555515200000000155005555555550"
LEVELS(3)  = "0000040000002000300002031012545010002135254002031034320231016333403002055533132135233331"
LEVELS(4)  = "5555555555542400005335444151053353330010533500215105335344001053352121510533510200165555"
LEVELS(5)  = "0040000000006404000000133010000001003333111033332001542000030550442000050012450531015132"
LEVELS(6)  = "0110400055501404006535014025515350140144153551502331535510011555355500515333535021155555"
LEVELS(7)  = "3330500111133365203021333154032413441530354103415003041003151110310251555155101110000001"
LEVELS(8)  = "0000400205315514015053105120150531051205505510514055001105553000511002005555110010060001"
LEVELS(9)  = "0060005330204333152334023311543130303153331300401513313035310510131510303513330133133123"
LEVELS(10) = "0000020000000020002000020006000200000545000000000200000545454545450000000000050505050505"
LEVELS(11) = "0040010040000555100400000000004110055555434100111114041001323030312010420500110102105061"
LEVELS(12) = "3220052023334521051403135331053101353331050113033331014165113115423351410113433313330001"
LEVELS(13) = "0004000000000040000050011405551000143440000001403400000013033000206100400024055113000120"
LEVELS(14) = "0040060040011111311111100403040011032303230110353035301103330333011000101000110001010001"
LEVELS(15) = "4000554004330640030021153313330330240133030033331001030254015050004033333002031000001050"
LEVELS(16) = "1111100000012441420000142412440001242143210014241244100132214231005515124110252151111601"
LEVELS(17) = "1000000000113334333431103236324011033443420110322033301100320240011002403400110333303301"
LEVELS(18) = "0000003354515543133525150251435451104013354510033300333011533333441064040003350550505121"
LEVELS(19) = "0111111111160000000001502240424015000202020150442040401502000202015042402240150000000001"
LEVELS(20) = "0004000000005451455510004403600100233033001003501000010200300000105055555555050500000000"
LEVELS(21) = "0000533544000025555440000311153110040401200111434005001163340020011303300500111111115001"
LEVELS(22) = "3400000000036055555551032400000013032400000103032400001303032400010303032000130303030001"
LEVELS(23) = "1146400000010414000000104140000001054541000010040401000105505055001004040500210550505005"
LEVELS(24) = "3323405204021334055451400031504413315410035101504331401302330013133055413150236333151511"
LEVELS(25) = "3000004000030353111111305350000013035304000130000333001300003230013333033300100030060001"
LEVELS(26) = "5555611111153355000421533350042315355504231553520023155535550311535335202155355551015533"
LEVELS(27) = "0000000024000000000141000000550310000000005100200400001015055001550100000010000000006100"
LEVELS(28) = "0004053333300040555555011400000020143455555501404011111013030323010100502420161005012101"
LEVELS(29) = "1000000100013333330400140060005551305550000014022500120130545000101003330000130133333330"
LEVELS(30) = "3233040400033331111111305203000013033030000130006400001133033000010000000000155555555500"
LEVELS(31) = "0000000524000004040531133310315411000130153114040001001130331055211030013055416015301254"
LEVELS(32) = "3000043000033440331000313430310603103205555531004030250312040345003140403500031111155555"
LEVELS(33) = "0000640400000001504000040150040000415000402013000004050130000422001001003220055510032200"
LEVELS(34) = "0000041111000002461410000241114102024115131010411524011103325130011003551400110033311100"
LEVELS(35) = "5666566652055555555551000040005010152300050101514400501133323406011000333150111111111500"
LEVELS(36) = "0000044444000200422220001102422260000522422100000222421000152222410001022222100051111111"
LEVELS(37) = "0040400000000301111111000414000010003210020105004140501025030100010100000006155101511155"
LEVELS(38) = "0003400400000115311111100153000015501530400102015033301150150323011101103330100000000061"
LEVELS(39) = "1600040002113044244031105242425011024222420110542224501114222224111122222221111111111111"
LEVELS(40) = "0014004000200110110015204101020461041010101200110100411010101041000001010102000010000010"
LEVELS(41) = "3320040204033401205030344011111011330000033113304600401100013332011003000150130333301000"
LEVELS(42) = "0000000400415555555002111116000420400055102232000051042332000510243332020132233330501022"
LEVELS(43) = "0000052040000000054551000405020411555050505110020030301101500313111010002505110000610101"
LEVELS(44) = "1250000040014000401142125554001341400040010212330420103130032503301000125334055161250030"
LEVELS(45) = "5000000000551555255555515354040255155540224551020214235515255552055103060020555555555555"
LEVELS(46) = "0204100000015041000000150410000001304100040051041551400500416003105422330031050231210010"
LEVELS(47) = "0400510020013304101540102031010401033010033110006100401333331015012000000103155055505333"
LEVELS(48) = "2421424422242213460444422111300002441500111144413451224444513313330005531552011111113310"
LEVELS(49) = "3004333333641112241112422144210103214422111033131113330233310133201423111331012202221210"

Dim integer x, y, x1, x2, dx, dy
Dim integer diamondCount, lives, playerX, playerY, currentLevel
Dim integer previousTimer : previousTimer = -1

currentLevel = 1
lives        = 5

showLoadingMessage
saveFontState
renderTitleScreen
renderBottomBorder
renderStatusPanel
resetLevel

Dim K$

Do
  renderTimer

  dx = 0
  dy = 0

  Select Case UCase$(Inkey$)
    Case "N"    ' next level
      currentLevel = currentLevel + 1
      If currentLevel > LEVELS_COUNT Then currentLevel = 1
      lives = 5
      resetLevel

    Case "P"    ' previous level
      currentLevel = currentLevel - 1
      If currentLevel < 1 Then currentLevel = LEVELS_COUNT
      lives = 5
      resetLevel

    Case Chr$(130)  ' влево
      If playerX > 0 Then dx = -1 : dy = 0

    Case Chr$(131)  ' вправо
      If playerX < 10 Then dx = 1 : dy = 0

    Case Chr$(128)  ' вверх
      If playerY > 0 Then dx = 0 : dy = -1

    Case Chr$(129)  ' вниз
      If playerY < 7 Then dx = 0 : dy = 1

    Case Chr$(27)   ' ESC Ч level reset (loss of a life)
      lives = lives - 1
      If lives < 0 Then
        showMessage("GAME OVER!")
        currentLevel = 1
        lives = 5
      End If
      resetLevel

    Case "Q"        ' exit
      restoreFontState
      CLS
      End
  End Select

  If dx <> 0 Then
    playClick
    x1 = playerX
    x2 = playerX

    Select Case cellAt(playerX + dx, playerY)
      Case B_SPACE, B_LADDER
        movePlayer(dx, 0)
        x2 = playerX

      Case B_SOFT_BLOCK
        M(playerX + dx, playerY) = 0
        movePlayer(dx, 0)
        x2 = playerX

      Case B_BOX
        If playerX + 2 * dx >= 0 And playerX + 2 * dx <= 10 And cellAt(playerX + 2 * dx, playerY) = B_SPACE Then
          If dx > 0 Then
            renderPlayer(B_PIT_RIGHT)
          Else
            renderPlayer(B_PIT_LEFT)
          End If

          M(playerX + 2 * dx, playerY) = B_BOX
          renderCell(playerX + 2 * dx, playerY, B_BOX)

          M(playerX + dx, playerY) = B_SPACE
          renderCell(playerX + dx, playerY, B_SPACE)

          Pause 200

          If playerY = 0 Or (playerY > 0 And cellAt(playerX + dx, playerY - 1) <> B_BOX) Then
            movePlayer(dx, 0)
            x2 = playerX + dx
          Else
            renderPlayer(B_PIT)
            x2 = playerX + 2 * dx
          End If
        End If

      Case B_DIAMOND
        M(playerX + dx, playerY) = 0
        movePlayer(dx, 0)
        diamondCount = diamondCount - 1

        If diamondCount = 0 Then
          If currentLevel = LEVELS_COUNT Then
            showMessage("ALL LEVELS COMPLETED!")
            currentLevel = 1
            lives = 5
            renderTitleScreen
            renderBottomBorder
            renderStatusPanel
            resetLevel
          Else
            showMessage("LEVEL COMPLETED!")
            currentLevel = currentLevel + 1
            resetLevel
          End If
        End If
    End Select

    applyGravityToPlayer
    applyGravityToColumn(x1, x2)
  End If

  If dy <> 0 Then
    playClick

    Select Case cellAt(playerX, playerY + dy)
      Case B_LADDER
        movePlayer(0, dy)

      Case B_SPACE
        If cellAt(playerX, playerY) = B_LADDER Then movePlayer(0, dy)
    End Select

    applyGravityToPlayer
    applyGravityToColumn(playerX, playerX)
  End If

Loop

Function cellAt(x%, y%) As integer
  Local Integer result : result = -1
  If (x% >= 0) And (x% <= 10) And (y% >= 0) And (y% <= 7) Then result = M(x%, y%)
  cellAt = result
End Function

Sub playClick
  Play TONE 1000, 1000
  Pause 20
  Play STOP
End Sub

Sub showMessage(S$)
  Local Integer msgLen : msgLen = Len(S$)
  Local Integer xPos   : xPos   = 17 - msgLen / 2

  Color BLACK, GREEN
  printAt(xPos, 10, Space$(msgLen + 2))
  printAt(xPos, 11, " " + S$ + " ")
  printAt(xPos, 12, Space$(msgLen + 2))

  Do
  Loop While Inkey$ = ""
End Sub

Sub applyGravityToColumn(x1%, x2%)
  Local INTEGER hasFallen : hasFallen = FALSE
  Local INTEGER blockType
  Local INTEGER tx

  If x1% > x2% Then
    tx = x1%
    x1% = x2%
    x2% = tx
  End If

  For x = x1% To x2%
    If x >= 0 And x <= 10 Then
      For y = 6 To 0 Step -1
        If M(x, y) = B_BOX Or M(x, y) = B_DIAMOND Then
          blockType = M(x, y)

          If M(x, y + 1) = B_SPACE And (x <> playerX Or y + 1 <> playerY) Then
            M(x, y)     = B_SPACE
            renderCell(x, y, B_SPACE)

            M(x, y + 1) = blockType
            renderCell(x, y + 1, blockType)

            hasFallen = TRUE
          End If
        End If
      Next y
    End If
  Next x

  If hasFallen Then
    Pause 200
    applyGravityToColumn(x1%, x2%)
  End If
End Sub

Sub applyGravityToPlayer
  If playerY > 6 Then Exit Sub

  If cellAt(playerX, playerY + 1) = B_SPACE And cellAt(playerX, playerY) <> B_LADDER Then
    Pause 200
    movePlayer(0, 1)
    applyGravityToPlayer
  End If
End Sub

Sub movePlayer(x%, y%)
  renderCell(playerX, playerY, M(playerX, playerY))
  playerX = playerX + x%
  playerY = playerY + y%
  renderPlayer(B_PIT)
End Sub

Sub renderTimer
  Local INTEGER seconds, hours, minutes

  seconds = Timer \ 1000
  If seconds = previousTimer Then Exit Sub
  previousTimer = seconds

  hours   = seconds \ 3600
  minutes = (seconds Mod 3600) \ 60
  seconds = seconds Mod 60

  Color BLACK, GREEN
  printAt(33, 12, Str$(hours) + ":" + Right$("0" + Str$(minutes), 2) + ":" + Right$("0" + Str$(seconds), 2))
End Sub

Sub renderLevelNumber
  Color BLACK, GREEN
  printAt(34, 3, Right$(Space$(5) + Str$(currentLevel), 5))
End Sub

Sub renderLives
  Color BLACK, GREEN
  printAt(34, 8, Space$(5 - lives) + String$(lives, Chr$(152)))
End Sub

Sub resetLevel
  Timer = 0
  renderLevelNumber
  renderLives
  loadLevelData
  renderLevel
  renderPlayer(B_PIT)
End Sub

Sub renderCell x%, y%, q%
  Select Case q%
    Case B_SPACE
      printCell x%, y%, "         ", BLACK, BLACK

    Case B_LADDER
      printCell x%, y%, Chr$(195) + Chr$(196) + Chr$(180) + Chr$(195) + Chr$(196) + Chr$(180) + Chr$(195) + Chr$(196) + Chr$(180), WHITE, BLACK

    Case B_DIAMOND
      printCell x%, y%, " " + Chr$(228) + " " + Chr$(231) + Chr$(232) + Chr$(230) + Chr$(219) + Chr$(219) + Chr$(219), YELLOW, BLACK

    Case B_SOFT_BLOCK
      printCell x%, y%, Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177) + Chr$(177), RED, BLACK

    Case B_BOX
      printCell x%, y%, Chr$(227) + Chr$(219) + Chr$(226) + Chr$(219) + Chr$(219) + Chr$(219) + Chr$(224) + Chr$(219) + Chr$(225), RED, BLACK

    Case B_HARD_BLOCK
      printCell x%, y%, Chr$(233) + Chr$(234) + Chr$(235) + Chr$(236) + " " + Chr$(237) + Chr$(238) + Chr$(239) + Chr$(240), WHITE, LIGHT_BLUE

    Case B_PIT
      printCell x%, y%, " " + Chr$(136) + " (" + Chr$(219) + ") " + Chr$(186) + " ", WHITE, BLACK

    Case B_PIT_LEFT
      printCell x%, y%, "\" + Chr$(136) + " _" + Chr$(219) + ") " + Chr$(179) + " ", WHITE, BLACK

    Case B_PIT_RIGHT
      printCell x%, y%, " " + Chr$(136) + "/(" + Chr$(219) + "_ " + Chr$(179) + " ", WHITE, BLACK

    Case B_PIT_LADDER
      printCell x%, y%, Chr$(195) + Chr$(136) + Chr$(180) + "(" + Chr$(219) + ")" + Chr$(195) + Chr$(186) + Chr$(180), WHITE, BLACK
  End Select
End Sub

Sub renderPlayer q%
  If M(playerX, playerY) = B_LADDER Then
    renderCell playerX, playerY, B_PIT_LADDER
  Else
    renderCell playerX, playerY, q%
  End If
End Sub

Sub printCell x%, y%, t$, fc%, bc%
  Color fc%, bc%
  printAt(x% * 3, y% * 3, Mid$(t$, 1, 3))
  printAt(x% * 3, y% * 3 + 1, Mid$(t$, 4, 3))
  printAt(x% * 3, y% * 3 + 2, Mid$(t$, 7, 3))
End Sub

Sub renderBottomBorder
  Color BLACK, WHITE
  For x = 0 To 11 * 3 - 1
    Print @(MM.Info(FONTWIDTH) * x, MM.Info(FONTHEIGHT) * 8 * 3) " "
  Next x
End Sub

Sub renderStatusPanel
  Color BLACK, GREEN
  For x = 33 To 39
    For y = 0 To 24
      printAt x, y, " "
    Next y
  Next x

  printAt(34, 1, "LEVEL")
  printAt(34, 6, "PIT")
End Sub

Sub printAt x%, y%, t$
  Local Integer i
  For i = 1 To Len(t$)
    If Mid$(t$, i, 1) >= Chr$(224) Then
      Font 8
    Else
      Font 1
    End If
    Print @(MM.Info(FONTWIDTH) * (x% + i - 1), MM.Info(FONTHEIGHT) * y%) Mid$(t$, i, 1);
  Next i
End Sub

Sub loadLevelData
  diamondCount = 0

  For x = 0 To 10
    For y = 0 To 7
      M(x, y) = Val(Mid$(LEVELS(currentLevel - 1), x + y * 11 + 1, 1))

      If M(x, y) = B_DIAMOND Then
        diamondCount = diamondCount + 1
      End If

      If M(x, y) = B_PIT Then
        playerX = x
        playerY = y
        M(x, y) = 0
      End If
    Next y
  Next x
End Sub

Sub renderLevel
  For x = 0 To 10
    For y = 0 To 7
      renderCell x, y, M(x, y)
    Next y
  Next x
End Sub

Sub saveFontState
  FONT_STATE      = MM.Info(FONT)
  COLOR_FG_STATE  = MM.Info(FCOLOUR)
  COLOR_BG_STATE  = MM.Info(BCOLOUR)
End Sub

Sub restoreFontState
  Font FONT_STATE
  Color COLOR_FG_STATE, COLOR_BG_STATE
End Sub

Sub renderTitleScreen
  Local integer mx, my
  Local STRING D : D = String$(2, Chr$(219))

  Color WHITE, BLACK
  CLS

  Color WHITE, LIGHT_BLUE
  printAt(0, 2, Space$(40))

  For y = 3 To 12
    printAt(0, y, Space$(3) + D + Space$(4) + D + Space$(3) + D + Space$(3) + D + Space$(2) + D + Space$(1) + D + Space$(1) + D + Space$(1) + D + Space$(1) + D + Space$(3))
  Next y

  printAt(0, 13, Space$(40))

  Data 3, 3, 3, 8, 12, 3, 13, 3, 19, 4, 26, 3, 26, 8, 32, 4

  For x = 0 To 4
    Restore
    For y = 0 To 7
      Read mx, my
      printAt(mx + x, my, Chr$(219))
    Next y
    printAt(6, 3 + x, D)
  Next x

  printAt(7, 3, Chr$(226))
  printAt(7, 8, Chr$(225))
  printAt(21, 3, Chr$(226) + Chr$(227))
  printAt(21, 5, Chr$(224) + Chr$(225))
  printAt(26, 3, Chr$(227))
  printAt(30, 3, Chr$(226))
  printAt(34, 3, Chr$(226))
  printAt(34, 5, Chr$(224))

  renderCell(2, 7, B_DIAMOND)
  renderCell(10, 7, B_DIAMOND)

  Color WHITE, BLACK
  renderControls(10, 16, 19, 10)

  Do
  Loop While Inkey$ = ""

  CLS
End Sub

Sub showLoadingMessage
  Local STRING IS : IS = "Initializing, please wait, it's done."
  Local Integer c

  For c = 1 To Len(IS)
    Print Mid$(IS, c, 1);
    Pause 100
  Next c

  Pause 500
End Sub

Sub renderControls x%, y%, w%, h%
  Local Integer i

  printAt(x%, y%, Chr$(218) + String$(w% - 2, 196) + Chr$(191))

  For i = y% + 1 To y% + h% - 2
    printAt(x%, i, Chr$(179) + Space$(w% - 2) + Chr$(179))
  Next i

  printAt(x%, y% + h% - 1, Chr$(192) + String$(w% - 2, 196) + Chr$(217))

  printAt(x% + 6, y%, "CONTROL")
  printAt(x% + 2, y% + 1, Chr$(146) + ":Up")
  printAt(x% + 2, y% + 2, Chr$(147) + ":Down")
  printAt(x% + 2, y% + 3, Chr$(149) + ":Left")
  printAt(x% + 2, y% + 4, Chr$(148) + ":Right")
  printAt(x% + 2, y% + 5, "ESC:Reset")
  printAt(x% + 2, y% + 6, "N:Next")
  printAt(x% + 2, y% + 7, "P:Previous")
  printAt(x% + 2, y% + 8, "Q:Quit")
End Sub
