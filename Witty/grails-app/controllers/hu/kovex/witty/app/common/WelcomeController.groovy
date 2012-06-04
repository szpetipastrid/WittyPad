package hu.kovex.witty.app.common

class WelcomeController {

    def index = {
        //The / uri of the application is redirected to this action

        def subDomain = request.getAttribute("subDomain")
        subDomain = subDomain == null ? null : subDomain as String

        if (subDomain) {
            //If community is set, redirect to community controller to handle the request
            forward controller: "community"
        } else {
            browser.choice() {
                browser.isiPhone() {
                    []
                }
                browser.isMobile() {
                    //If request came from mobile phone, except iPhone, open the application
                    redirect controller: "home", action: 'desktop'
                }
                browser.otherwise() {
                    //If request came from not mobile phone, show desktop welcome page
                    []
                }
            }
        }
    }
}
