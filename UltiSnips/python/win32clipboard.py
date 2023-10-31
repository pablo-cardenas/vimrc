snippet win32clipboard "win32clipboard" b
win32clipboard.OpenClipboard()
clipboard = win32clipboard.GetClipboardData()
win32clipboard.CloseClipboard()
endsnippet
