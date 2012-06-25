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
    <div class="title">
        Thanks for registering your Witty!
    </div>

    <div style="text-align: justify;max-width: 1200px;">
        The <b>${fullDomain}</b> address is yours, but your Witty isn't accessible to visitors.
    To start your Witty, click to the 'Activate  Witty' button bellow.
    Before activating your Witty, highly recommended to enter some additional information about your Witty.
    This step isn't mandatory, but it helps other peoples to find you. Important, you have 24 hours to
    activate your Witty!</div>

    <div class="admin-form">
        <h2>Basic</h2>

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

        <h2>Publishing</h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.address"/></div>

        <div class="value" style="margin-left: 200px;">
            <div class="l" style="width: 500px;line-height: 30px;">
                ${fullDomain} (cannot be modified now)
            </div>
        </div>

        <div class="admin-divider"></div>

        <h2>Profile image</h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.profile.image"/></div>

        <div class="value" style="margin-left: 200px;">
            <div id="profileImagePreview" class="profile-image-preview">
                <img src="${resource(dir: "images", file: "icon-reflection_256.png")}"
                     style="border-radius: 15px 15px 0 0">

                <div id="profileImagePreviewMessage"></div>
            </div>

            <div class="profile-image-upload">
                <div>Choose an image to improve your Witty:</div>
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

        <h2>Permissions</h2>

        <div class="key"><g:message code="witty.plugin.community.create.witty.profile.image"/></div>

        <div class="value" style="margin-left: 200px;">
            <div>
                <div id="permissionValueContainer"><span id="permissionValueSpan">Public</span> <a
                        id="editPermissionValue"
                        class="h inplace_edit_button">Edit</a></div>

                <div id="permissionEditContainer" class="permissionEditContainer" style="display: none;">
                    <ul class="ul_flow">
                        <li><g:radio id="prop_access_public" value="public" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'public' || WInstance.prop(witty, 'prop_access', 'all') == ''}"/>
                            <label for="prop_access_public">Anybody</label>
                        </li>
                        <li><g:radio id="prop_access_readonly" value="readonly" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'readonly'}"/>
                            <label for="prop_access_readonly">Anybody to read</label>
                        </li>
                        <li><g:radio id="prop_access_private" value="private" name="prop_access"
                                     checked="${WInstance.prop(witty, 'prop_access', 'all') == 'private'}"/>
                            <label for="prop_access_private">Only for invited</label>
                        </li>
                    </ul>


                    <a id="savePermissionValue" class="button nbutton">Save</a>
                    <a id="cancelPermissionValue" class="button sbutton">Cancel</a>
                </div>
            </div>
            <script>
                var message_public = "Anybody";
                var message_readonly = "Anybody to read";
                var message_private = "Only for invited";
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

        <h2><g:message code="witty.plugin.community.create.witty.activate.title"/></h2>

        <div class="key"></div>

        <div class="value" style="margin-left: 200px;">
            <g:message code="witty.plugin.community.create.witty.activate"/> All information can be modified later.<br>
            <a id="activateWittyButton" class="button nbutton">Activate!</a>
            <script type="text/javascript">
                $("#activateWittyButton").click(function() {
                    $.getJSON("${createLink(controller: "community", action: "save_property", params: [property: 'prop_status', value:'empty', address: WInstance.prop(witty, 'prop_uri', 'all')])}",
                            function() {
                                alert("Congratulation!\nYour Witty is activated, you can start edit and customize it!");
                                window.location = "${createLink(controller:'admin', action:'index')}";
                            }
                    );
                });
            </script>
        </div>

        <div style="margin-bottom: 30px;"></div>
    </div>
</content>