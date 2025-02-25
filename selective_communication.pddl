(define (domain selective_communication)
    (:requirements :strips :typing :epistemic)

    (:types agent room) ; Types of objects in the domain

    (:predicates 
        (at ?a - agent ?r - room)             ; Agent is in a room
        (adjacent ?r1 - room ?r2 - room)      ; Rooms are adjacent
        (knows ?a - agent ?info - information) ; Agent knows specific information
        (shared ?info - information)         ; Information has been shared
        (in_same_room ?a1 ?a2 - agent)       ; Two agents are in the same room
    )

    ; Action: Move between adjacent rooms
    (:action move
        :parameters (?a - agent ?from - room ?to - room)
        :precondition (and (at ?a ?from) (adjacent ?from ?to))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )

    ; Action: Share information within the same room
    (:action share_information
        :parameters (?a1 - agent ?a2 - agent ?info - information)
        :precondition (and 
            (at ?a1 ?r) 
            (at ?a2 ?r) 
            (knows ?a1 ?info)
        )
        :effect (and 
            (knows ?a2 ?info) 
            (shared ?info)
        )
    )

    ; Action: Share information to neighboring rooms
    (:action broadcast_information
        :parameters (?a - agent ?info - information ?r - room)
        :precondition (and 
            (at ?a ?r) 
            (knows ?a ?info)
        )
        :effect (and 
            (forall (?a2 - agent)
                (when (exists (?r2 - room) (and (adjacent ?r ?r2) (at ?a2 ?r2)))
                    (knows ?a2 ?info)
                )
            )
            (shared ?info)
        )
    )

    ; Action: Block information sharing to other agents
    (:action block_information
        :parameters (?a1 - agent ?a2 - agent ?info - information)
        :precondition (and 
            (at ?a1 ?r) 
            (at ?a2 ?r) 
            (knows ?a1 ?info)
        )
        :effect (not (knows ?a2 ?info))
    )
)
