package et.user

import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils

@Transactional
class RegistrationService {

    int PASSWORD_LENGTH = 8
    int TOKEN_LENGTH = 32
    String ALPHABET = (('A'..'Z') + ('0'..'9')).join()

    def generatePassword() {
        String password = RandomStringUtils.random(PASSWORD_LENGTH, ALPHABET.toCharArray())
        log.info "Random password generated: $password"
        password
    }

    def generateToken() {
        String token = RandomStringUtils.random(TOKEN_LENGTH, ALPHABET.toCharArray())
        log.info "Generated random token $token"
        token
    }
}
