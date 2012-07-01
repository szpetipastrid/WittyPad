package hu.kovex.witty.app.common

class HomeController {
    def index = {
        def subDomain = request.getAttribute("subDomain")
        subDomain = subDomain == null ? null : subDomain as String
        def layout = request.getAttribute("layout")
        layout = layout == null ? null : layout as String

        if (subDomain) {
            //Forward to community welcome screen
            switch (layout) {
                case 'd':
                case 'desktop':
                    forward controller: 'community'
                    break
                case 'm':
                case 'mobile':
                    forward controller: 'mobileCommunity'
                    break
                case 't':
                case 'tablet':
                    forward controller: 'tabletCommunity'
                    break
            }
        } else {
            //Forward to home page
            switch (layout) {
                case 'd':
                case 'desktop':
                    redirect action: 'desktop'
                    break
                case 'm':
                case 'mobile':
                    redirect action: 'mobile'
                    break
                case 't':
                case 'tablet':
                    redirect action: 'tablet'
                    break
            }
        }

    }

    def desktop = {
    }

    def mobile = {
    }

    def tablet = {
    }
}
