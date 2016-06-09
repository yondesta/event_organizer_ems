class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'event', action: 'index')
        "500"(view:'/error')
		"/aboutus"(view:'/aboutus')
		}
}
