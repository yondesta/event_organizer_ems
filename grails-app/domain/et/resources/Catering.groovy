package et.resources

class Catering {

    String name
    String description
    BigDecimal teaBreakPrice
    BigDecimal snackPrice
    BigDecimal lunchPrice
    String phone
    String email

    static constraints = {
        email nullable: true, email: true
    }
}
