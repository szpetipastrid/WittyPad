dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}

// environment specific settings
environments {
    development {
        grails {
            mongo {
                host = "localhost"
                port = 27017
                username = "glossaryuser"
                password = "helloworld"
                databaseName = "webglossary3"
            }
        }
    }
    test {
    }
    production {
    }
}
