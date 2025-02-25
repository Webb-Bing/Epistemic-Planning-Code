(define (domain word_room)
    (:requirements :strips :typing :epistemic)

    (:types
        agent room letter position
    )

    (:predicates
        (at_corridor ?a - agent)                ; Agent is in the corridor
        (at_room ?a - agent ?r - room)          ; Agent is in a specific room
        (contains_letter ?r - room ?l - letter ?p - position) ; Room contains a specific letter in a specific position
        (knows_letter ?a - agent ?l - letter ?p - position)   ; Agent knows a specific letter in a specific position
        (communicated ?a1 ?a2 - agent ?l - letter ?p - position) ; Agent ?a1 communicated a letter to agent ?a2
        (word_determined ?a - agent)            ; Agent has determined the hidden word
    )

    ; Action: Move from corridor to a room
    (:action move_to_room
        :parameters (?a - agent ?r - room)
        :precondition (at_corridor ?a)
        :effect (and
            (not (at_corridor ?a))
            (at_room ?a ?r)
        )
    )

    ; Action: Move from a room to the corridor
    (:action move_to_corridor
        :parameters (?a - agent ?r - room)
        :precondition (at_room ?a ?r)
        :effect (and
            (not (at_room ?a ?r))
            (at_corridor ?a)
        )
    )

    ; Action: Sense the letter in a room
    (:action sense_letter
        :parameters (?a - agent ?r - room ?l - letter ?p - position)
        :precondition (and
            (at_room ?a ?r)
            (contains_letter ?r ?l ?p)
        )
        :effect (knows_letter ?a ?l ?p)
    )

    ; Action: Communicate a letter to another agent
    (:action communicate_letter
        :parameters (?a1 ?a2 - agent ?l - letter ?p - position)
        :precondition (and
            (knows_letter ?a1 ?l ?p)
            (at_corridor ?a1)
            (at_corridor ?a2)
        )
        :effect (and
            (knows_letter ?a2 ?l ?p)
            (communicated ?a1 ?a2 ?l ?p)
        )
    )

    ; Action: Determine the hidden word
    (:action determine_word
        :parameters (?a - agent)
        :precondition (and
            (forall (?l - letter ?p - position) (knows_letter ?a ?l ?p))
        )
        :effect (word_determined ?a)
    )
)
