sub init()
    m.spinner = m.top.findNode("spinner")
    m.spinner.poster.uri = "pkg:/images/loader.png"
    m.spinner.control = "start"
    m.apiKey = m.top.findNode("apiKey")
    m.assetsGrid = m.top.findNode("assetsGrid")
    m.search = m.top.findNode("search")
    
    m.request = HTTPApiClient()
    m.request.componentPointer = m
	m.request.URL = "http://192.168.50.100:8080"
	m.request.callback = loadKey
	m.request.executeTask()

    m.top.setFocus(true)
end sub

sub loadKey(event as object)
    m.componentPointer.apiKey = event.apiToken
    print "Result:"
    print isAnagram("listen", "silent")
    keyGEnerated()
end sub

sub keyGEnerated()
    m.assetsGrid.apiKey = m.apiKey
    m.search.apiKey = m.apiKey
    m.assetsGrid.visible = true
    m.spinner.visible = false
    m.assetsGrid.getFocus = true
end sub

sub showList()
    m.search.visible = false
    m.search.getFocus = false
    m.assetsGrid.visible = true
    m.assetsGrid.getFocus = true
end sub

sub showSearch()
    m.assetsGrid.visible = false
    m.assetsGrid.getFocus = false
    m.search.visible = true
    m.search.getFocus = true
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if (key = "options" AND m.assetsGrid.visible) then
            showSearch()
            handled = true
        else if (key = "back" AND m.search.visible) then
            showList()
            handled = true
        end if
    end if
    return handled
end function

function isAnagram(valA as String, valB as String) as Boolean
    auxValA = valA.Replace(" ", "")
    auxValB = valB.Replace(" ", "")
    valALen = Len(auxValA)
    valBLen = Len(auxValB)
    if (valALen = valBLen) then 
        Dim valAArr[valALen]
        Dim valBArr[valBLen]
        for x = 1 to valALen
            valAArr[x-1] = Asc(mid(auxValA, x, 1))
            valBArr[x-1] = Asc(mid(auxValB, x, 1))
        end for
        valAArr.Sort()
        valBArr.Sort()
        for x = 0 to valALen
            if(valAArr[x] <> valBArr[x]) then
                return false
            end if
        end for
        return true
    else
        return false
    end if
end function