package et.event

class Category {

    String name
    String description
    String icon
    String panelClass
    String buttonClass

    static constraints = {
        description nullable: true
    }
}
