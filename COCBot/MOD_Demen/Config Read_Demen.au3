; #FUNCTION# ====================================================================================================================
; Name ..........: readConfig.au3
; Description ...: Reads config file and sets variables
; Syntax ........: readConfig()
; Parameters ....: NA
; Return values .: NA
; Author ........: Demen
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func ReadConfig_SmartTrain()

	; QuickTrainCombo (check box)
	$g_bQuickTrainEnable = (IniRead($g_sProfileConfigPath, "other", "ChkUseQTrain", "0") = "1")
	$g_bQuickTrainArmy[0] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy1", "0") = "1")
	$g_bQuickTrainArmy[1] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy2", "0") = "1")
	$g_bQuickTrainArmy[2] = (IniRead($g_sProfileConfigPath, "troop", "QuickTrainArmy3", "0") = "1")
	$g_bChkMultiClick = (IniRead($g_sProfileConfigPath, "other", "ChkMultiClick", "0") = "1")

	; SmartTrain
	IniReadS($ichkSmartTrain, $g_sProfileConfigPath, "SmartTrain", "Enable", 0, "int")
	IniReadS($ichkPreciseTroops, $g_sProfileConfigPath, "SmartTrain", "PreciseTroops", 0, "int")
	IniReadS($ichkFillArcher, $g_sProfileConfigPath, "SmartTrain", "ChkFillArcher", 0, "int")
	IniReadS($iFillArcher, $g_sProfileConfigPath, "SmartTrain", "FillArcher", 5, "int")
	IniReadS($ichkFillEQ, $g_sProfileConfigPath, "SmartTrain", "FillEQ", 0, "int")

	; ExtendedAttackBar
	IniReadS($g_abChkExtendedAttackBar[$DB], $g_sProfileConfigPath, "attack", "ExtendedAttackBarDB", False, "Bool")
	IniReadS($g_abChkExtendedAttackBar[$LB], $g_sProfileConfigPath, "attack", "ExtendedAttackBarLB", False, "Bool")

	; CheckCCTroops
	IniReadS($g_bChkCC, $g_sProfileConfigPath, "CheckCC", "Enable", False, "Bool")
	IniReadS($g_iCmbCastleCap, $g_sProfileConfigPath, "CheckCC", "CmbCastleCap", 5, "Int")
	For $i = 0 To $eTroopCount - 1
		$g_aiCCTroopsExpected[$i] = 0
	Next
	$g_bChkCCTroops = False
	For $i = 0 To 2
		IniReadS($g_aiCmbCCTroopsExpect[$i], $g_sProfileConfigPath, "CheckCC", "Slot" & $i, 19, "int")
		IniReadS($g_aiQtyCCTroopsExpect[$i], $g_sProfileConfigPath, "CheckCC", "Qty" & $i, 0, "int")
		If $g_aiCmbCCTroopsExpect[$i] > -1 And $g_aiCmbCCTroopsExpect[$i] < $eTroopCount Then
			Local $j = $g_aiCmbCCTroopsExpect[$i]
			$g_aiCCTroopsExpected[$j] += $g_aiQtyCCTroopsExpect[$i]
			If $g_bChkCC Then $g_bChkCCTroops = True
		EndIf
	Next

EndFunc   ;==>ReadConfig_SmartTrain

Func ReadConfig_SwitchAcc()
	IniReadS($ichkSwitchAcc, $profile, "SwitchAcc", "Enable", 0, "int")
	IniReadS($icmbTotalCoCAcc, $profile, "SwitchAcc", "Total Coc Account", -1, "int")
	IniReadS($ichkSmartSwitch, $profile, "SwitchAcc", "Smart Switch", 0, "int")
	IniReadS($g_iTrainTimeToSkip, $profile, "SwitchAcc", "Train Time To Skip", 1, "int")
	IniReadS($ichkForceSwitch, $profile, "SwitchAcc", "Force Switch", 0, "int")
	IniReadS($iForceSwitch, $profile, "SwitchAcc", "Force Switch Search", 100, "int")
	IniReadS($ichkForceStayDonate, $profile, "SwitchAcc", "Force Stay Donate", 0, "int")
	IniReads($ichkCloseTraining, $profile, "SwitchAcc", "Sleep Combo", 0, "int") ; Sleep Combo, 1 = Close CoC, 2 = Close Android, 0 = No sleep
	For $i = 0 To 7
		IniReadS($aMatchProfileAcc[$i], $profile, "SwitchAcc", "MatchProfileAcc." & $i + 1, "-1")
		IniReadS($aProfileType[$i], $profile, "SwitchAcc", "ProfileType." & $i + 1, "-1")
		IniReadS($aAccPosY[$i], $profile, "SwitchAcc", "AccLocation." & $i + 1, "-1")
	Next
EndFunc   ;==>ReadConfig_SwitchAcc
