sub init()
    m.assetsPosterGrid = m.top.findNode("assetsPosterGrid")
end sub

sub loadMovies()
    m.request = HTTPApiClient()
    m.request.componentPointer = m
	m.request.URL = "http://192.168.1.103:8080/vod"
    m.request.apiKey = m.top.apiKey
	m.request.callback = listMovies
	m.request.executeTask()
end sub

sub listMovies(event as object)
    result = event.results
    content = createObject("RoSGNode","ContentNode")
    for each item in result
        if item.type = "movie" OR item.type = "series"
            asset = createObject("roSGNode","ContentNode")
            asset.shortdescriptionline1 = item.title
            asset.hdgridposterurl = "pkg:/images/video-movie-placeholder-image-grey.png"
            asset.id = item.id
            content.appendChild(asset)
        end if
    end for
    m.componentPointer.assetsPosterGrid.content = content
end sub

sub putFocus()
    if m.top.getFocus
        m.assetsPosterGrid.setFocus(true)
    else
        m.assetsPosterGrid.setFocus(false)
    end if
end sub