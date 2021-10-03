sub main()
	screen = createObject("roSGScreen")
	scene = screen.createScene("AppScene")
	screen.Show()
	port = createObject("roMessagePort")
	screen.setMessagePort(m.port)
	' this loop is necessary to keep the application open
	' otherwise the channel will exit when it reaches the end of main()
	while(true)
      msgType = type(msg)
      if msgType = "roSGScreenEvent"
         if msg.isScreenClosed() then return
      end if
   end while
end sub