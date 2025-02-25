(define (domain cubes_and_boxes)
    (:requirements :strips :typing :epistemic)

    (:types
        agent object box
    )

    (:predicates
        (in ?o - object ?b - box)                     ; Object is in a specific box
        (knows_location ?a - agent ?o - object ?b - box) ; Agent knows the location of an object
        (accessible ?a - agent ?b - box)              ; Box is accessible to an agent
        (announced ?a - agent ?o - object ?b - box)   ; Agent announced the object's location
    )

    ; Action: Perceive the location of a cube
    (:action perceive
        :parameters (?a - agent ?o - object ?b - box)
        :precondition (and
            (accessible ?a ?b)
            (in ?o ?b)
            (not (knows_location ?a ?o ?b))
        )
        :effect (knows_location ?a ?o ?b))

    ; Action: Announce the location of a cube
    (:action announce
        :parameters (?announcer ?receiver - agent ?o - object ?b - box)
        :precondition (knows_location ?announcer ?o ?b)
        :effect (knows_location ?receiver ?o ?b))
)
