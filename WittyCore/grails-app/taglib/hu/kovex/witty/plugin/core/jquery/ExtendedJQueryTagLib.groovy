package hu.kovex.witty.plugin.core.jquery

class ExtendedJQueryTagLib {
    static namespace = "jqe"

    def jQueryResources = {
        out << """
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery', file: 'jquery-1.6.2.min.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.smartWizard-2.0.min.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery-ui-1.8.16.custom.min.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.core.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.widget.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.accordion.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.tabs.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.button.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.react.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js', file: 'jquery.ui.position.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js/effects', file: 'jquery.effects.core.min.js')}" type="text/javascript"></script>
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery/jquery-ui/js/effects', file: 'jquery.effects.clip.min.js')}" type="text/javascript"></script>
        """
    }

    def jQueryMobileResources = {
        out << """
   <script src="${g.resource(plugin: 'witty-core', dir: '/jquery', file: 'jquery-1.6.2.min.js')}" type="text/javascript"></script>
   <script src="${resource(plugin: 'witty-core', dir: '/jquery-mobile', file: 'jquery.mobile-1.1.0.min.js')}" type="text/javascript"></script>
   <link type="text/css" rel="stylesheet" href="${resource(plugin: 'witty-core', dir: "jquery-mobile", file: "jquery.mobile-1.1.0.min.css")}"/>
   <link type="text/css" rel="stylesheet" href="${resource(plugin: 'witty-core', dir: "jquery-mobile", file: "jquery.mobile.structure-1.1.0.min.css")}"/>
   <link type="text/css" rel="stylesheet" href="${resource(plugin: 'witty-core', dir: "jquery-mobile", file: "jquery.mobile.theme-1.1.0.min.css")}"/>
        """
    }

}
