class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'event', action: 'index')
        "/home"(controller: 'user', action: 'home')
        "/aboutus"(view:'/aboutus')
        "500"(view:'/error')
		}
}
