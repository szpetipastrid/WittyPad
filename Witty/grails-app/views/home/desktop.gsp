<g:applyLayout name="home">
    <head>
        <title><g:message code="home.browser.title"/></title>
        <meta name="layout" content="home"/>
    </head>

    <content tag="header"><g:message code="home.content.witty.title"/></content>
    <content tag="home">
        <script type="text/javascript">
            $(function() {
                $("#wittyTile").load('${createLink(controller:'community', action: 'tile', params:[community:'witty'])}');
                $("#wittyTileLarge").load('${createLink(controller:'community', action: 'tile', params:[community:'witty', size:'large'])}');
                $("#szpetipTile").load('${createLink(controller:'community', action: 'tile', params:[community:'szpetip'])}');
                $("#szpetipTileLarge").load('${createLink(controller:'community', action: 'tile', params:[community:'szpetip', size:'large'])}');
            });
        </script>

        <div style="width: 980px; margin-bottom: 10px;">
            <div class="home_paragraph_left home_paragraph">
                <div class="home_paragraph_title"><g:message code="home.content.for.users.title"/></div>

                <div class="home_paragraph_image_witty_user home_paragraph_image"></div>

                <div class="home_paragraph_text_left home_paragraph_text">
                    <g:message code="home.content.for.users.text"/>

                </div>
            </div>

            <div class="home_paragraph_right home_paragraph">
                <div class="home_paragraph_title"><g:message code="home.content.for.developers.title"/></div>

                <div class="home_paragraph_image_witty_developer home_paragraph_image"></div>

                <div class="home_paragraph_text_right home_paragraph_text">
                    <g:message code="home.content.for.developers.text"/>
                </div>
            </div>

            <div class="home_paragraph_left home_paragraph">
                <div class="home_paragraph_title"><g:message code="home.content.platforms.title"/></div>

                <div class="home_paragraph_image_witty_platforms home_paragraph_image"></div>

                <div class="home_paragraph_text_left home_paragraph_text">
                    <g:message code="home.content.platforms.text"/>
                </div>
            </div>

            <div class="home_paragraph_right home_paragraph">
                <div class="home_paragraph_title"><g:message code="home.content.faq.title"/></div>

                <div class="home_paragraph_image_witty_faq home_paragraph_image"></div>

                <div class="home_paragraph_text_right home_paragraph_text">
                    <g:message code="home.content.faq.text"/>
                </div>
            </div>


            <div style="clear: both;"></div>

        </div>


        <div class="tiles">
            <div class="tile-row">
                <div id="szpetipTileLarge" class="large_tile_container">
                </div>

                <div id="wittyTile" class="small_tile_container"></div>

                <div id="szpetipTile" class="small_tile_container"></div>
            </div>

            <div class="tile-row">
                <div class="small_tile"
                     style="background: url('http://dl.dropbox.com/u/13371372/witty/twitter-tile-small.png')">
                    <div class="tile_title">@wittypad</div>
                    <a href="https://twitter.com/#!/wittypad" class="tile_link" target="_blank"></a>
                </div>

                <div class="small_tile"
                     style="background: url('http://dl.dropbox.com/u/13371372/witty/wiki-tile-small.png')">
                    <div class="tile_title">wittypad wiki</div>
                    <a href="https://github.com/szpetip/WittyPad/wiki" class="tile_link" target="_blank"></a>
                </div>

                <div id="wittyTileLarge" class="large_tile_container">
                </div>

            </div>

            <div class="tile-row-half">
                <div class="small_tile"
                     style="background: url('http://dl.dropbox.com/u/13371372/witty/faq-tile-small.png')">
                    <div class="tile_title">wittypad wiki</div>
                    <a href="${createLink(controller: "content", action: "faq", params: params)}" class="tile_link"
                       ß></a>
                </div>

                <div class="small_tile"></div>

                <div class="small_tile"></div>

                <div class="small_tile"></div>

            </div>

            <div class="tile-row-half">
                <div class="small_1x2">
                    <div class="build-it-up">
                        <div class="build-it-up-title"><g:message code="home.tiles.build.it.up.title"/></div>

                        <div class="build-it-up-text"><g:message code="home.tiles.build.it.up.text"/></div>

                        <div class="build-it-up-button">
                            <a href="${createLink(controller: "admin")}#create" class="witty-button"><g:message code="home.tiles.build.it.up.button"/></a>

                        </div>
                    </div>
                </div>

                <div class="small_tile"></div>

                <div class="small_tile"></div>
            </div>
        </div>
    </content>
</g:applyLayout>