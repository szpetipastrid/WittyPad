package hu.kovex.witty.plugin.community

/**
 * Created by IntelliJ IDEA.
 * User: szpetip
 * Date: 5/14/12
 * Time: 11:41 AM
 */
class CommunityURIValidator {
    static def MIN_LENGTH = 3
    static def MAX_LENGTH = 12
    static def COMMUNITY_NAME_PATTERN = /^[a-z\d]+([-_][a-z\d]+)*$/
    static def PROHIBITED_WORDS = [
            'sex', 'porn', 'ass', 'www', 'witty'
    ]

    static def validate(String name) {
        if (MIN_LENGTH > name.length() || MAX_LENGTH < name.length()) {
            "length"
        } else if (!(name ==~ COMMUNITY_NAME_PATTERN)) {
            "regexp"
        } else if (PROHIBITED_WORDS.contains(name)) {
            "prohibited"
        } else {
            "valid"
        }
    }

}