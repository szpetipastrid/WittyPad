class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller: "welcome", absolute:false)
        "500"(view:'/error')
	}
}
