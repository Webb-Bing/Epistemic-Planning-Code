(define (domain lights_problem)
    (:requirements :strips :typing :epistemic)

    (:types
        agent light
    )

    (:predicates
        (light_on ?l - light)                        ; Light is on
        (knows_light_on ?a - agent ?l - light)       ; Agent knows a specific light is on
        (knows_disjunction ?a - agent ?l1 ?l2 - light) ; Agent knows at least one of the lights is on
        (knows_all_lights_on ?a - agent)            ; Agent knows all lights are on
    )

    ; Action: Sense the state of lights (Agent B or C)
    (:action sense_disjunction
        :parameters (?a - agent ?l1 ?l2 - light)
        :precondition (and
            (or (= ?a agent_b) (= ?a agent_c)) ; Only B or C can sense
            (or (light_on ?l1) (light_on ?l2)) ; At least one light must be on
        )
        :effect (knows_disjunction ?a ?l1 ?l2))

    ; Action: Communicate knowledge (Agent B or C)
    (:action communicate
        :parameters (?sender ?receiver - agent ?l1 ?l2 - light)
        :precondition (and
            (or (= ?sender agent_b) (= ?sender agent_c)) ; B or C can communicate
            (knows_disjunction ?sender ?l1 ?l2) ; Sender knows a disjunction
        )
        :effect (knows_disjunction ?receiver ?l1 ?l2))

    ; Action: Toggle the state of a light (Agent A)
    (:action toggle_light
        :parameters (?a - agent ?l - light)
        :precondition (and (= ?a agent_a)) ; Only Agent A can toggle
        :effect (and
            (not (light_on ?l)) ; If it was on, turn it off
            (light_on ?l)))     ; If it was off, turn it on

    ; Action: Deduce all lights are on
    (:action deduce_all_lights
        :parameters (?a - agent)
        :precondition (and
            (knows_disjunction ?a l1 l2)
            (knows_disjunction ?a l3 l4)
            (light_on l1) (light_on l2) (light_on l3) (light_on l4)
        )
        :effect (knows_all_lights_on ?a))
)
