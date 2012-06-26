%{--
  - Copyright (c) 2012. Witty Project.
  - Peter Szilagyi
  - szpetip@gmail.com
  -
  - Witty is a a knowledge-management, open source community portal.
  - Witty is available under the http://wittypad.com.
  - Witty is a free software distributed under the GNU General Public Licence.
  - Witty and WittyPad are the name of the software, please do not use it to other purposes.
  --}%





<%--
  Created by IntelliJ IDEA.
  User: szpetip
  Date: 6/24/12
  Time: 10:02 PM
--%>

<%@ page import="hu.kovex.witty.plugin.core.domain.WInstance" contentType="text/html;charset=UTF-8" %>
<head>
    <meta name="layout" content="admin_witty_content"/>
    <jqe:jQueryResources/>
    <ine:head/>
    <script src="${resource(dir: "js", file: "fileuploader.js")}"></script>
    <link href='${resource(dir: 'css', file: 'uploader.css')}' rel='stylesheet' type='text/css'>
</head>
<content tag="content">
    <div class="admin-form">
        <h2><g:message code="witty.plugin.community.create.witty.basic"/></h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.title"/></div>

        <div class="value">
            <ine:field address="${WInstance.prop(witty,'prop_uri', 'all')}" property="prop_name"
                       cssClass="property_edit"
                       link="${createLink(controller:'community', action:'save_property')}">
                <sh:winstance obj="${witty}" val="prop_name"/>
            </ine:field>
        </div>

        <div class="key"><g:message code="witty.plugin.community.create.witty.description"/></div>

        <div class="value">
            <ine:area address="${WInstance.prop(witty,'prop_uri', 'all')}" property="prop_description"
                      cssClass="property_edit" link="${createLink(controller:'community', action:'save_property')}">
                <sh:winstance obj="${witty}" val="prop_description"/>
            </ine:area>
        </div>

        <div class="admin-divider"></div>

        <h2><g:message code="witty.plugin.community.create.witty.publishing"/></h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.address"/></div>

        <div class="value" style="margin-left: 200px;">
            <div class="l" style="width: 500px;line-height: 30px;">
                ${fullDomain} (<g:message code="witty.plugin.community.create.witty.publishing.cannot.be.modified"/>)
            </div>
        </div>

        <div class="admin-divider"></div>

        <h2><g:message code="witty.plugin.community.create.witty.profile.image"/></h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.profile.image"/></div>

        <div class="value" style="margin-left: 200px;">
            <div id="profileImagePreview" class="profile-image-preview">
                <img src="${resource(dir: "images", file: "icon-reflection_256.png")}"
                     style="border-radius: 15px 15px 0 0">

                <div id="profileImagePreviewMessage"></div>
            </div>

            <div class="profile-image-upload">
                <div><g:message code="witty.plugin.community.create.witty.profile.image.choose"/></div>
                <script>
                    function setProfileImage(profileImage) {
                        var l = "${createLink(controller: "image", params: [width: 256, height: 256])}&file=" + encodeURIComponent(profileImage);
                        $("#profileImagePreview").css("backgroundImage", "url(" + l + ")");
                    }
                    <g:if test="${WInstance.prop(witty,'prop_profimage', 'all')}">
                    $(function() {
                        setProfileImage('${WInstance.prop(witty,'prop_profimage', 'all')}');
                    });
                    </g:if>
                </script>

                <uploader:uploader id="profileImage" url="[controller: 'imageUploader', action:'saveProfileImage']">
                    <uploader:onComplete>
                        $("#profileImagePreviewMessage").html(
                        "<div style='width:256px;text-align: center;'>Updating...</div>");

                        $.getJSON("${createLink(controller: "community", action: "save_property", params: [property: 'prop_profimage', address: WInstance.prop(witty, 'prop_uri', 'all')])}&value="+encodeURIComponent(responseJSON.result.file),
                         function() { $("#profileImagePreviewMessage").html(""); }
                         );
                         setProfileImage(responseJSON.result.file);
                    </uploader:onComplete>
                </uploader:uploader>
            </div>

        </div>

        <div class="admin-divider"></div>

        <h2><g:message code="witty.plugin.community.create.witty.permissions"/></h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.profile.image"/></div>

        <div class="value" style="margin-left: 200px;">
            <div>
                <div id="permissionValueContainer"><span id="permissionValueSpan">Public</span> <a
                        id="editPermissionValue"
                        class="h inplace_edit_button"><g:message code="witty.plugin.community.create.edit"/></a></div>

                <div id="permissionEditContainer" class="permissionEditContainer" style="display: none;">
                    <ul class="ul_flow">
                        <li><g:radio id="prop_access_public" value="public" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'public' || WInstance.prop(witty, 'prop_access', 'all') == ''}"/>
                            <label for="prop_access_public"><g:message
                                    code="witty.plugin.community.create.witty.permissions.anybody"/></label>
                        </li>
                        <li><g:radio id="prop_access_readonly" value="readonly" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'readonly'}"/>
                            <label for="prop_access_readonly"><g:message
                                    code="witty.plugin.community.create.witty.permissions.anybody.to.read"/></label>
                        </li>
                        <li><g:radio id="prop_access_private" value="private" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'private'}"/>
                            <label for="prop_access_private"><g:message
                                    code="witty.plugin.community.create.witty.permissions.only.for.invited"/></label>
                        </li>
                    </ul>


                    <a id="savePermissionValue" class="button nbutton"><g:message
                            code="witty.plugin.community.create.button.save"/></a>
                    <a id="cancelPermissionValue" class="button sbutton"><g:message
                            code="witty.plugin.community.create.button.cancel"/></a>
                </div>
            </div>
            <script>
                var message_public = "${message(code:'witty.plugin.community.create.witty.permissions.anybody')}";
                var message_readonly = "${message(code:'witty.plugin.community.create.witty.permissions.anybody.to.read')}";
                var message_private = "${message(code:'witty.plugin.community.create.witty.permissions.only.for.invited')}";
                function showPermission(permission) {
                    var permissionTitle;
                    if (permission == "public" || permission == "") {
                        permissionTitle = message_public;
                    } else if (permission == "readonly") {
                        permissionTitle = message_readonly;
                    } else if (permission == "private") {
                        permissionTitle = message_private;
                    }
                    $("#permissionValueSpan").text(permissionTitle);
                }

                $(function() {
                    showPermission('${WInstance.prop(witty, 'prop_access', 'all')}');
                    $("#editPermissionValue").click(function() {
                        $("#permissionValueContainer").hide();
                        $("#permissionEditContainer").show();
                    });

                    $("#savePermissionValue").click(function() {
                        var val = $("input:radio[name=prop_access]:checked").val();
                        $.getJSON("${createLink(controller: "community", action: "save_property", params: [property: 'prop_access', address: WInstance.prop(witty, 'prop_uri', 'all')])}&value=" + encodeURIComponent(val),
                                function() {
                                    showPermission(val);
                                }
                        );


                        $("#permissionEditContainer").hide();
                        $("#permissionValueContainer").show();
                    });

                    $("#cancelPermissionValue").click(function() {
                        $("#permissionEditContainer").hide();
                        $("#permissionValueContainer").show();
                    });
                });
            </script>
        </div>

        <div style="margin-bottom: 30px;"></div>
    </div>
</content>