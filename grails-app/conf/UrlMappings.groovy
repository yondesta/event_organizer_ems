class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'event', action: 'index')
        "/aboutus"(view:'/aboutus')
        "/home"(controller: 'user', action: 'home')
        "500"(view:'/error')
		}
}
