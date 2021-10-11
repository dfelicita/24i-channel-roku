sub init()
   m.search = m.top.findNode("search")
   m.selectRadio = m.top.findNode("selectRadio")
   m.okButton = m.top.findNode("okButton")
   m.okButton.observeField("buttonSelected", "onButtonSelected")

   examplerect = m.search.boundingRect()
   centerx = (1920 - examplerect.width) / 2
   centery = 100
   m.search.translation = [ centerx, centery ]

   m.selectRadio.translation = [ centerx + 50 , 550 ]

end sub

sub onButtonSelected()
    ' Search call occurs here
    ? "Search media"
end sub

sub putFocus()
    if m.top.getFocus
        m.search.setFocus(true)
    else
        m.search.setFocus(false)
        m.selectRadio.setFocus(false)
        m.okButton.setFocus(false)
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then
        if (key = "down") then
            m.selectRadio.setFocus(true)
            handled = true
        else if (key = "up") then
            m.search.setFocus(true)
            handled = true
        else if (key = "right") then
            m.okButton.setFocus(true)
            handled = true
        else if (key = "left") then
            m.selectRadio.setFocus(true)
            handled = true
        end if
    end if
    return handled
end function