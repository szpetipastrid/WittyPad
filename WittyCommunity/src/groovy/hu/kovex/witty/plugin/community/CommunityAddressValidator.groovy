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
 * Date: 5/14/12
 * Time: 11:41 AM
 */
class CommunityAddressValidator {
    static def MIN_LENGTH = 3
    static def MAX_LENGTH = 12
    static def COMMUNITY_NAME_PATTERN = /^[a-z\d]+([-_][a-z\d]+)*$/
    static def PROHIBITED_WORDS = [
            'sex', 'porn', 'ass', 'www', 'witty'
    ]

    static def validate(String name) {
        if (MIN_LENGTH > name.length() || MAX_LENGTH < name.length()) {
            "witty.plugin.community.create.community.address.invalid"
        } else if (!(name ==~ COMMUNITY_NAME_PATTERN)) {
            "witty.plugin.community.create.community.address.invalid"
        } else if (PROHIBITED_WORDS.contains(name.toLowerCase())) {
            "witty.plugin.community.create.community.address.invalid"
        } else {
            null
        }
    }

}