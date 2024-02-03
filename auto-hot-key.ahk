CoordMode, Pixel, Screen
CoordMode, Mouse, Screen



; 단축키 설정 (예: Ctrl+Alt+C)
^!c::
    Sleep, 1000

    ; 현재 활성 창 확인
    WinGetTitle, ActiveTitle, A

    ; 특정 프로그램이 활성화되어 있는지 확인 (여기서는 타이틀을 확인)
    If (ActiveTitle = "2024 익시아/엘레노아-6")
    {
        ; 대기 및 클릭 함수 호출
        GoSub WaitAndClick
    }
return




; 대기 및 클릭 함수
WaitAndClick:
    Loop
    {
        ; 현재 활성 창의 위치 가져오기
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A

        ; 이미지 찾기
        ImageSearch, FoundX, FoundY, %WinX%, %WinY%, (WinX + WinWidth), (WinY + WinHeight), C:\Users\yangg\Desktop\wk-macro\start-btn.png

        ; 이미지 매칭 확인
        If (ErrorLevel = 0)
        {
            Sleep, 500

            Click %FoundX%, %FoundY%

            GoSub setFight
            break
        }
    }
return

setFight:
{
    Loop
    {
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A

        ImageSearch, FoundX, FoundY, %WinX%, %WinY%, (WinX + WinWidth), (WinY + WinHeight), C:\Users\yangg\Desktop\wk-macro\ok.png

        If (ErrorLevel = 0)
        {
            Click %FoundX%, %FoundY%

            GoSub breakDunjun
            break
        }

        Sleep, 100

        ; 왼쪽 마우스 버튼을 1초 동안 누르기
        Click, % (WinX + WinWidth/2) " " (WinY + WinHeight/2) " down"
        Sleep, 1000

        ; 마우스를 2시 방향으로 100만큼 이동
        MouseMove 100, -100, 5, R

        ; 마우스 버튼 놓기
        Click, up
    }
}
return

breakDunjun:
{
    Loop
    {
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A

        ImageSearch, FoundX, FoundY, %WinX%, %WinY%, (WinX + WinWidth), (WinY + WinHeight), C:\Users\yangg\Desktop\wk-macro\ok.png

        Sleep, 1000

        ; 왼쪽 마우스 버튼을 1초 동안 누르기
        Click, down
        Sleep, 1000

        ; 마우스를 2시 방향으로 100만큼 이동
        MouseMove 100, -100, 5, R

        ; 마우스 버튼 놓기
        Click, up, Left

        If (ErrorLevel = 0)
        {
            Click %FoundX%, %FoundY%

            GoSub breakDunjun
            break
        }

        ; 이미지가 나타날 때까지 대기
        Sleep, 500
    }
}
return



^!p::Pause
return

; 리로드 단축키 설정 (Ctrl+Alt+R)
^!r::Reload
return
