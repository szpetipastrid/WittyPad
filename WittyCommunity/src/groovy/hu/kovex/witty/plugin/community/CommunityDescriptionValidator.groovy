/*
 * Copyright (c) 2012. Witty Project.
 * Peter Szilagyi
 * szpetip@gmail.com
 *
 * Witty is a a knowledge-management, open source community portal.
 * Witty is available under the http://wittypad.com.
 * Witty is a free software distributed under the GNU General Public Licence.
 * Witty and WittyPad are the name of the software, please do not use it to other purposes.
 */



package hu.kovex.witty.plugin.community

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 6/23/12
 * Time: 3:22 PM
 */
class CommunityDescriptionValidator {
    static Integer MAX_LENGTH = 500

    static def validate(String value) {
        if (value != null && MAX_LENGTH < value.length()) {
            "witty.plugin.community.create.community.description.invalid"
        } else {
            null
        }
    }
}
