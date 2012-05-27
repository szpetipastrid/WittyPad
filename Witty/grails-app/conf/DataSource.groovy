environments {
    development {
        grails {
            mongo {
                host = "localhost"
                port = 27017
                username = "wittyuser"
                password = "helloworld"
                databaseName = "witty-dev"
            }
        }
    }
    test {
        /* No database needed in this time. */
    }
    production {
        /* No database needed in this time. */
    }
    demo {
        /* No database needed in this time. */
    }
} 