package et.ems

import et.event.Event

class EmsTagLib {
    static namespace = "ems"
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def eventButton = { attrs ->
        def event = Event.load(attrs.eventId as long)
        out << "<button class=\"btn ${event.category.buttonClass} btn-circle ${attrs.size ?: ''}\" type=\"button\">" +
                        "<i class=\"fa ${event.category.icon} ${attrs.iconSize ?: ''}\"></i>" +
                    "</button>"
    }
}
