On Error Resume Next

Dim cFSO, cFile
Dim sFileName

Function myDateFormat(myDate)
    d = Day(myDate)
    m = Month(myDate)    
    y = Year(myDate)
	If m < 10 Then
		m = "0" & m
	End If
	If d < 10 Then
		d = "0" & d
	End If
    myDateFormat= y & m & d
End Function

Set cFSO= Wscript.CreateObject("Scripting.FileSystemObject")   


For Each Arg In WScript.Arguments
	If (cFSO.FileExists(Arg)) Then
		Set cFile=cFSO.GetFile (Arg)
	Else
		Set cFile=Nothing
	End If
	If Not cFile Is Nothing Then
		If Len(cFile.Name) > 8 And Mid (cFile.Name, 9, 1) = " " And IsNumeric (Left(cFile.Name,8)) Then	'Is a Date Name
			sFileName = myDateFormat (Date) & " " & Right(cFile.Name, Len(cFile.Name)-9)
		Else
			'cFile.Copy cFile.Path
			sFileName = myDateFormat (Date) & " " & cFile.Name
		End If
		cFile.Copy cFile.ParentFolder.Path & "\" & sFileName, False
		If Err = 58 Then
			MsgBox "File [" & sFileName & "] already exist, please check and copy manually!", 0, "Error"
		End If
		Set cFile=Nothing
	End If
Next

Set CFSO = Nothing

