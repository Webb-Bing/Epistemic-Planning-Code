(define (domain collaboration_communication)
    (:requirements :strips :typing :epistemic)

    (:types 
        agent box room
    )

    (:predicates
        (at ?a - agent ?r - room)               ; Agent is in a room
        (box_at ?b - box ?r - room)            ; Box is in a specific room
        (knows_box_location ?a - agent ?b - box) ; Agent knows the location of a box
        (adjacent ?r1 - room ?r2 - room)       ; Two rooms are adjacent
    )

    ; Action: Move between adjacent rooms
    (:action move
        :parameters (?a - agent ?from - room ?to - room)
        :precondition (and (at ?a ?from) (adjacent ?from ?to))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )

    ; Action: Observe a box upon entering a room
    (:action observe_box
        :parameters (?a - agent ?b - box ?r - room)
        :precondition (and (at ?a ?r) (box_at ?b ?r))
        :effect (knows_box_location ?a ?b)
    )

    ; Action: Communicate box location to another agent
    (:action communicate_box_location
        :parameters (?a1 ?a2 - agent ?b - box)
        :precondition (and 
            (knows_box_location ?a1 ?b) ; Sender must know the location of the box
            (at ?a1 ?r) 
            (at ?a2 ?r) ; Both agents must be in the same room
        )
        :effect (knows_box_location ?a2 ?b)
    )
)
