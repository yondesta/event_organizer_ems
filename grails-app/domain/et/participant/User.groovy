package et.participant

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String firstName
	String lastName
	String email
	String phone
	String username
	String password
	String address
	Date birthDate
	String gender
	Integer age
	boolean confirmed = false

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	Integer getAge() {
		birthDate ? new Date().getYear() - birthDate.getYear() : null
	}

	String toString() {
		"${firstName?.capitalize()} ${lastName?.capitalize()}"
	}

	User(String username, String password) {
		this()
		this.username = username
		this.password = password
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService', 'age']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName blank: false
		lastName blank: false
		email blank: false, email: true
		phone nullable: true, blank: true, validator: { val, obj ->
			if(val && val != '' && val !=~ /^\+(?:[0-9] ?){6,14}[0-9]$/) return ['invalid.format']
		}
		address nullable: true
		birthDate nullable: true
		gender inList: ['M', 'F', 'U']
		age nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
