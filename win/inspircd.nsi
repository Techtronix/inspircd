; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "InspIRCd"
!define PRODUCT_VERSION "1.1"
!define PRODUCT_PUBLISHER "InspIRCd Development Team"
!define PRODUCT_WEB_SITE "http://www.inspircd.org/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\inspircd.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor bzip2

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\arrow2-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\arrow2-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "..\..\COPYING"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\InspGUI.exe"
!define MUI_FINISHPAGE_RUN_PARAMETERS "--nofork"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup.exe"
InstallDir "$PROGRAMFILES\InspIRCd"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "Binary Executable" SEC01
  SetOutPath "$INSTDIR\bin"
  SetOverwrite ifnewer
  File "..\bin\debug\InspGUI.exe"
  File "..\bin\debug\bin\inspircd.exe"
  CreateDirectory "$SMPROGRAMS\InspIRCd"
  CreateShortCut "$SMPROGRAMS\InspIRCd\InspIRCd.lnk" "$INSTDIR\InspGUI.exe"
SectionEnd

Section "Config Files" SEC02
  SetOutPath "$INSTDIR\conf"
  File "..\bin\debug\conf\inspircd.motd.example"
  File "..\bin\debug\conf\inspircd.helpop-full.example"
  File "..\bin\debug\conf\inspircd.helpop.example"
  File "..\bin\debug\conf\inspircd.filter.example"
  File "..\bin\debug\conf\inspircd.conf.example"
  File "..\bin\debug\conf\inspircd.censor.example"
  File "..\bin\debug\conf\inspircd.rules.example"
  File "..\bin\debug\conf\inspircd.quotes.example"
SectionEnd

Section "Command Handlers" SEC03
  SetOutPath "$INSTDIR\lib"
  File "..\bin\debug\lib\cmd_zline.so"
  File "..\bin\debug\lib\cmd_whois.so"
  File "..\bin\debug\lib\cmd_who.so"
  File "..\bin\debug\lib\cmd_wallops.so"
  File "..\bin\debug\lib\cmd_version.so"
  File "..\bin\debug\lib\cmd_users.so"
  File "..\bin\debug\lib\cmd_userhost.so"
  File "..\bin\debug\lib\cmd_user.so"
  File "..\bin\debug\lib\cmd_unloadmodule.so"
  File "..\bin\debug\lib\cmd_trace.so"
  File "..\bin\debug\lib\cmd_topic.so"
  File "..\bin\debug\lib\cmd_time.so"
  File "..\bin\debug\lib\cmd_summon.so"
  File "..\bin\debug\lib\cmd_stats.so"
  File "..\bin\debug\lib\cmd_squit.so"
  File "..\bin\debug\lib\cmd_server.so"
  File "..\bin\debug\lib\cmd_rules.so"
  File "..\bin\debug\lib\cmd_restart.so"
  File "..\bin\debug\lib\cmd_rehash.so"
  File "..\bin\debug\lib\cmd_quit.so"
  File "..\bin\debug\lib\cmd_qline.so"
  File "..\bin\debug\lib\cmd_privmsg.so"
  File "..\bin\debug\lib\cmd_pong.so"
  File "..\bin\debug\lib\cmd_ping.so"
  File "..\bin\debug\lib\cmd_pass.so"
  File "..\bin\debug\lib\cmd_part.so"
  File "..\bin\debug\lib\cmd_oper.so"
  File "..\bin\debug\lib\cmd_notice.so"
  File "..\bin\debug\lib\cmd_nick.so"
  File "..\bin\debug\lib\cmd_names.so"
  File "..\bin\debug\lib\cmd_motd.so"
  File "..\bin\debug\lib\cmd_modules.so"
  File "..\bin\debug\lib\cmd_mode.so"
  File "..\bin\debug\lib\cmd_map.so"
  File "..\bin\debug\lib\cmd_lusers.so"
  File "..\bin\debug\lib\cmd_loadmodule.so"
  File "..\bin\debug\lib\cmd_list.so"
  File "..\bin\debug\lib\cmd_links.so"
  File "..\bin\debug\lib\cmd_kline.so"
  File "..\bin\debug\lib\cmd_kill.so"
  File "..\bin\debug\lib\cmd_kick.so"
  File "..\bin\debug\lib\cmd_join.so"
  File "..\bin\debug\lib\cmd_ison.so"
  File "..\bin\debug\lib\cmd_invite.so"
  File "..\bin\debug\lib\cmd_info.so"
  File "..\bin\debug\lib\cmd_gline.so"
  File "..\bin\debug\lib\cmd_eline.so"
  File "..\bin\debug\lib\cmd_die.so"
  File "..\bin\debug\lib\cmd_connect.so"
  File "..\bin\debug\lib\cmd_commands.so"
  File "..\bin\debug\lib\cmd_clearcache.so"
  File "..\bin\debug\lib\cmd_away.so"
  File "..\bin\debug\lib\cmd_admin.so"
SectionEnd

Section "Modules" SEC04
  SetOutPath "$INSTDIR\modules"
  File "..\bin\debug\modules\m_showwhois.so"
  File "..\bin\debug\modules\m_sha256.so"
  File "..\bin\debug\modules\m_setname.so"
  File "..\bin\debug\modules\m_setident.so"
  File "..\bin\debug\modules\m_sethost.so"
  File "..\bin\debug\modules\m_services_account.so"
  File "..\bin\debug\modules\m_saquit.so"
  File "..\bin\debug\modules\m_sapart.so"
  File "..\bin\debug\modules\m_sanick.so"
  File "..\bin\debug\modules\m_samode.so"
  File "..\bin\debug\modules\m_sajoin.so"
  File "..\bin\debug\modules\m_randquote.so"
  File "..\bin\debug\modules\m_operchans.so"
  File "..\bin\debug\modules\m_noctcp.so"
  File "..\bin\debug\modules\m_md5.so"
  File "..\bin\debug\modules\m_hideoper.so"
  File "..\bin\debug\modules\m_hidechans.so"
  File "..\bin\debug\modules\m_globops.so"
  File "..\bin\debug\modules\m_globalload.so"
  File "..\bin\debug\modules\m_devoice.so"
  File "..\bin\debug\modules\m_conn_umodes.so"
  File "..\bin\debug\modules\m_conn_lusers.so"
  File "..\bin\debug\modules\m_cloaking.so"
  File "..\bin\debug\modules\m_chghost.so"
  File "..\bin\debug\modules\m_blockcolor.so"
  File "..\bin\debug\modules\m_banexception.so"
  File "..\bin\debug\modules\m_alltime.so"
  File "..\bin\debug\modules\m_alias.so"
  File "..\bin\debug\modules\m_spanningtree.so"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\InspIRCd\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\InspIRCd\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\bin\inspircd.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\inspircd.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Actual Executable"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Default Config Files"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Command Modules"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Optional Modules"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\modules\m_spanningtree.so"
  Delete "$INSTDIR\modules\m_alias.so"
  Delete "$INSTDIR\modules\m_alltime.so"
  Delete "$INSTDIR\modules\m_banexception.so"
  Delete "$INSTDIR\modules\m_blockcolor.so"
  Delete "$INSTDIR\modules\m_chghost.so"
  Delete "$INSTDIR\modules\m_cloaking.so"
  Delete "$INSTDIR\modules\m_conn_lusers.so"
  Delete "$INSTDIR\modules\m_conn_umodes.so"
  Delete "$INSTDIR\modules\m_devoice.so"
  Delete "$INSTDIR\modules\m_globalload.so"
  Delete "$INSTDIR\modules\m_globops.so"
  Delete "$INSTDIR\modules\m_hidechans.so"
  Delete "$INSTDIR\modules\m_hideoper.so"
  Delete "$INSTDIR\modules\m_md5.so"
  Delete "$INSTDIR\modules\m_noctcp.so"
  Delete "$INSTDIR\modules\m_operchans.so"
  Delete "$INSTDIR\modules\m_randquote.so"
  Delete "$INSTDIR\modules\m_sajoin.so"
  Delete "$INSTDIR\modules\m_samode.so"
  Delete "$INSTDIR\modules\m_sanick.so"
  Delete "$INSTDIR\modules\m_sapart.so"
  Delete "$INSTDIR\modules\m_saquit.so"
  Delete "$INSTDIR\modules\m_services_account.so"
  Delete "$INSTDIR\modules\m_sethost.so"
  Delete "$INSTDIR\modules\m_setident.so"
  Delete "$INSTDIR\modules\m_setname.so"
  Delete "$INSTDIR\modules\m_sha256.so"
  Delete "$INSTDIR\modules\m_showwhois.so"
  Delete "$INSTDIR\lib\cmd_admin.so"
  Delete "$INSTDIR\lib\cmd_away.so"
  Delete "$INSTDIR\lib\cmd_clearcache.so"
  Delete "$INSTDIR\lib\cmd_commands.so"
  Delete "$INSTDIR\lib\cmd_connect.so"
  Delete "$INSTDIR\lib\cmd_die.so"
  Delete "$INSTDIR\lib\cmd_eline.so"
  Delete "$INSTDIR\lib\cmd_gline.so"
  Delete "$INSTDIR\lib\cmd_info.so"
  Delete "$INSTDIR\lib\cmd_invite.so"
  Delete "$INSTDIR\lib\cmd_ison.so"
  Delete "$INSTDIR\lib\cmd_join.so"
  Delete "$INSTDIR\lib\cmd_kick.so"
  Delete "$INSTDIR\lib\cmd_kill.so"
  Delete "$INSTDIR\lib\cmd_kline.so"
  Delete "$INSTDIR\lib\cmd_links.so"
  Delete "$INSTDIR\lib\cmd_list.so"
  Delete "$INSTDIR\lib\cmd_loadmodule.so"
  Delete "$INSTDIR\lib\cmd_lusers.so"
  Delete "$INSTDIR\lib\cmd_map.so"
  Delete "$INSTDIR\lib\cmd_mode.so"
  Delete "$INSTDIR\lib\cmd_modules.so"
  Delete "$INSTDIR\lib\cmd_motd.so"
  Delete "$INSTDIR\lib\cmd_names.so"
  Delete "$INSTDIR\lib\cmd_nick.so"
  Delete "$INSTDIR\lib\cmd_notice.so"
  Delete "$INSTDIR\lib\cmd_oper.so"
  Delete "$INSTDIR\lib\cmd_part.so"
  Delete "$INSTDIR\lib\cmd_pass.so"
  Delete "$INSTDIR\lib\cmd_ping.so"
  Delete "$INSTDIR\lib\cmd_pong.so"
  Delete "$INSTDIR\lib\cmd_privmsg.so"
  Delete "$INSTDIR\lib\cmd_qline.so"
  Delete "$INSTDIR\lib\cmd_quit.so"
  Delete "$INSTDIR\lib\cmd_rehash.so"
  Delete "$INSTDIR\lib\cmd_restart.so"
  Delete "$INSTDIR\lib\cmd_rules.so"
  Delete "$INSTDIR\lib\cmd_server.so"
  Delete "$INSTDIR\lib\cmd_squit.so"
  Delete "$INSTDIR\lib\cmd_stats.so"
  Delete "$INSTDIR\lib\cmd_summon.so"
  Delete "$INSTDIR\lib\cmd_time.so"
  Delete "$INSTDIR\lib\cmd_topic.so"
  Delete "$INSTDIR\lib\cmd_trace.so"
  Delete "$INSTDIR\lib\cmd_unloadmodule.so"
  Delete "$INSTDIR\lib\cmd_user.so"
  Delete "$INSTDIR\lib\cmd_userhost.so"
  Delete "$INSTDIR\lib\cmd_users.so"
  Delete "$INSTDIR\lib\cmd_version.so"
  Delete "$INSTDIR\lib\cmd_wallops.so"
  Delete "$INSTDIR\lib\cmd_who.so"
  Delete "$INSTDIR\lib\cmd_whois.so"
  Delete "$INSTDIR\lib\cmd_zline.so"
  Delete "$INSTDIR\conf\inspircd.quotes.example"
  Delete "$INSTDIR\conf\inspircd.rules.example"
  Delete "$INSTDIR\conf\inspircd.censor.example"
  Delete "$INSTDIR\conf\inspircd.conf.example"
  Delete "$INSTDIR\conf\inspircd.filter.example"
  Delete "$INSTDIR\conf\inspircd.helpop.example"
  Delete "$INSTDIR\conf\inspircd.helpop-full.example"
  Delete "$INSTDIR\conf\inspircd.motd.example"
  Delete "$INSTDIR\bin\inspircd.exe"
  Delete "$INSTDIR\InspGUI.exe"

  Delete "$SMPROGRAMS\InspIRCd\Uninstall.lnk"
  Delete "$SMPROGRAMS\InspIRCd\Website.lnk"
  Delete "$SMPROGRAMS\InspIRCd\InspIRCd.lnk"

  RMDir "$SMPROGRAMS\InspIRCd"
  RMDir "$INSTDIR\modules"
  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR\conf"
  RMDir "$INSTDIR\bin"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
