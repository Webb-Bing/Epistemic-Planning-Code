(define (domain situated_dialogue)
    (:requirements :strips :typing :epistemic)

    (:types
        agent object position
    )

    (:predicates
        (at ?o - object ?p - position)                  ; Object is at a specific position
        (visible ?a - agent ?o - object)               ; Object is visible to an agent
        (knows_position ?a - agent ?o - object)        ; Agent knows the position of an object
        (hidden_area ?a - agent ?p - position)         ; Position is hidden from an agent
        (communicated ?a1 ?a2 - agent ?o1 ?o2 - object ?relation) ; Spatial relationship communicated
    )

    ; Action: Sense the positions of visible objects
    (:action sense
        :parameters (?a - agent ?o - object ?p - position)
        :precondition (and (visible ?a ?o) (at ?o ?p))
        :effect (knows_position ?a ?o))

    ; Action: Communicate a spatial relationship between objects
    (:action communicate_relationship
        :parameters (?a1 ?a2 - agent ?o1 ?o2 - object ?relation)
        :precondition (and 
            (knows_position ?a1 ?o1)
            (knows_position ?a1 ?o2)
        )
        :effect (communicated ?a1 ?a2 ?o1 ?o2 ?relation))

    ; Action: Move an object within the grid
    (:action move_object
        :parameters (?b - agent ?o - object ?from ?to - position)
        :precondition (and 
            (at ?o ?from)
            (not (hidden_area ?b ?to))
        )
        :effect (and
            (not (at ?o ?from))
            (at ?o ?to)
        ))
)
