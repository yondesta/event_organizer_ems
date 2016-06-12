package et.ems

import et.event.Event

class EmsTagLib {
    static namespace = "ems"
    static defaultEncodeAs = 'raw'
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    /**
     * Displays the button that represents the category of the event.
     *
     * @attr eventId REQUIRED the event ID.
     */
    def categoryButton = { attrs ->
        def event = Event.load(attrs.eventId as long)
        out << render(template: '/event/categoryButton', model: [event: event])
    }
}
