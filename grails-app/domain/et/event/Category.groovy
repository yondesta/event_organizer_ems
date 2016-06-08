package et.event

class Category {

    String name
    String description
    String icon
    String color

    static constraints = {
        description nullable: true
    }
}
