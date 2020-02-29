strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2")
Set colItems = objWMIService.ExecQuery( _
  "SELECT * FROM Win32_NetworkAdapter Where NetEnabled = 'True'")
For Each objItem in colItems
  objItem.Disable
  WScript.Sleep 1000
  objItem.Enable
Next

strTarget = "pes.edu"
Set WshShell = WScript.CreateObject("WScript.Shell")
Ping = WshShell.Run("ping -n 1 " & strTarget, 0, True)
