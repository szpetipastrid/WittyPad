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
 * Date: 6/11/12
 * Time: 6:53 PM
 */
class CommunityTitleValidator {
    static Integer MIN_LENGTH = 3
    static Integer MAX_LENGTH = 30
    static def PROHIBITED_WORDS = [
            'sex', 'porn', 'ass', 'www', 'witty'
    ]

    static def validate(String name) {
        if (name == null || MIN_LENGTH > name.length() || MAX_LENGTH < name.length()) {
            "witty.plugin.community.create.community.name.invalid"
        } else if (PROHIBITED_WORDS.contains(name.toLowerCase())) {
            "witty.plugin.community.create.community.name.invalid"
        } else {
            null
        }
    }
}
