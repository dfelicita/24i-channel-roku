function HTTPApiClient()
	if m.apiClient <> invalid then
		return m.apiClient
	end if

	m.apiClient = { executeTask: executeTask, 
					httpTask: invalid, 
					jsonResponse: invalid, 
					URL: invalid,
					callback: invalid,
					apiKey: invalid,
					componentPointer: invalid  }


	return m.apiClient
end function

sub executeTask()
	apiClient = HTTPApiClient()
	apiClient.httpTask = createObject("roSGNode", "HTTPTask")
	apiClient.httpTask.setField("URL", apiClient.URL)
	apiClient.httpTask.setField("apiKey", apiClient.apiKey)
	apiClient.httpTask.observeField("jsonResult", "onHTTPTaskTaskFinished")
	apiClient.httpTask.control = "RUN"
end sub

sub onHTTPTaskTaskFinished(event as object)
	apiClient = HTTPApiClient()
	if apiClient.callback <> invalid
		apiClient.callback(apiClient.httpTask.jsonResult)
	end if
end sub