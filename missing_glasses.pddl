(define (domain missing_glasses)
    (:requirements :strips :typing :epistemic)

    (:types
        agent object location
    )

    (:predicates
        (in ?o - object ?l - location)                ; Object is in a specific location
        (knows_location ?a - agent ?o - object ?l - location) ; Agent knows the location of the object
        (perceived ?a - agent ?o - object ?l - location)      ; Agent perceives the object at a location
        (announced ?a - agent ?o - object ?l - location)      ; Agent announced the object's location
    )

    ; Action: Sense whether the glasses are in a specific box
    (:action sense
        :parameters (?a - agent ?o - object ?l - location)
        :precondition (not (knows_location ?a ?o ?l))
        :effect (perceived ?a ?o ?l))

    ; Action: Perceive the result of a sensing action
    (:action perceive
        :parameters (?a - agent ?o - object ?l - location)
        :precondition (and (perceived ?a ?o ?l) (in ?o ?l))
        :effect (knows_location ?a ?o ?l))

    ; Action: Announce the location of the glasses
    (:action announce
        :parameters (?announcer ?receiver - agent ?o - object ?l - location)
        :precondition (knows_location ?announcer ?o ?l)
        :effect (knows_location ?receiver ?o ?l))
)
