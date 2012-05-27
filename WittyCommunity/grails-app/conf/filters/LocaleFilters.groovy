package filters

class LocaleFilters {


    def filters = {
        localeSet(controller: '*', action: '*') {
            before = {
                request.setAttribute("selectedLang", params.lang ?: org.springframework.web.servlet.support.RequestContextUtils.getLocale(request))
                request.setAttribute("selectedShortLang", (params.lang ?: org.springframework.web.servlet.support.RequestContextUtils.getLocale(request) as String).substring(0, 2))
            }
            after = {

            }
            afterView = {

            }
        }
    }

}
