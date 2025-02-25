(define (domain airport_example)
    (:requirements :strips :typing :epistemic)

    (:types
        location
    )

    (:predicates
        (at ?l - location)                       ; Agent is at a specific location
        (plane_at ?l - location)                 ; Plane is at a specific gate
        (knows_plane_at ?l - location)           ; Agent knows where the plane is
        (boarded)                                ; Agent has boarded the plane
    )

    ; Action: Go to the airport
    (:action go_to_airport
        :parameters (?home ?airport - location)
        :precondition (at ?home)
        :effect (and
            (not (at ?home))
            (at ?airport)))

    ; Action: Check departures screen to learn the gate
    (:action check_departures
        :parameters (?airport - location ?gate - location)
        :precondition (and
            (at ?airport)
            (or (plane_at ?gate)))
        :effect (knows_plane_at ?gate))

    ; Action: Go to a specific gate
    (:action go_to_gate
        :parameters (?airport ?gate - location)
        :precondition (and
            (at ?airport)
            (knows_plane_at ?gate))
        :effect (and
            (not (at ?airport))
            (at ?gate)))

    ; Action: Board the plane at the correct gate
    (:action board_plane
        :parameters (?gate - location)
        :precondition (and
            (at ?gate)
            (plane_at ?gate))
        :effect (boarded))
)
