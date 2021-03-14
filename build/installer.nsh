!macro customHeader
  RequestExecutionLevel admin
!macroend

!macro customInit
  WriteRegStr HKLM "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" "$INSTDIR\${PRODUCT_FILENAME}.exe" "RUNASADMIN"
  WriteRegStr HKCU "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" "$INSTDIR\${PRODUCT_FILENAME}.exe" "RUNASADMIN"
!macroend

!macro customInstall
  WriteRegStr HKCR "emper" "" "URL:emper"
  WriteRegStr HKCR "emper" "URL Protocol" ""
  WriteRegStr HKCR "emper\shell" "" ""
  WriteRegStr HKCR "emper\shell\Open" "" ""
  WriteRegStr HKCR "emper\shell\Open\command" "" "$INSTDIR\${APP_EXECUTABLE_FILENAME} %1"
!macroend

!macro customUnInstall
  DeleteRegKey HKCR "emper"
  DeleteRegKey /ifempty HKCR "emper"
!macroend