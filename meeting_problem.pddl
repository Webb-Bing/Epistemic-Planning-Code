(define (domain meeting_problem)
    (:requirements :strips :typing :epistemic)

    (:types
        agent position landmark
    )

    (:predicates
        (at ?a - agent ?p - position)                 ; Agent is at a specific position
        (landmark_at ?l - landmark ?p - position)     ; A landmark is at a specific position
        (knows_landmark ?a - agent ?l - landmark ?p - position) ; Agent knows the location of a landmark
        (same_position ?a1 ?a2 - agent)              ; Both agents are at the same position
        (agents_met ?a1 ?a2 - agent ?p - position)   ; Both agents meet at a specific position
    )

    ; Action: Move clockwise
    (:action move_clockwise
        :parameters (?a - agent ?from ?to - position)
        :precondition (and (at ?a ?from))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )

    ; Action: Move counterclockwise
    (:action move_counterclockwise
        :parameters (?a - agent ?from ?to - position)
        :precondition (and (at ?a ?from))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )

    ; Action: Sense a landmark at the current position
    (:action sense_landmark
        :parameters (?a - agent ?l - landmark ?p - position)
        :precondition (and (at ?a ?p) (landmark_at ?l ?p))
        :effect (knows_landmark ?a ?l ?p)
    )

    ; Action: Communicate landmark location
    (:action communicate_landmark
        :parameters (?a1 ?a2 - agent ?l - landmark ?p - position)
        :precondition (and 
            (knows_landmark ?a1 ?l ?p)
            (same_position ?a1 ?a2)
        )
        :effect (knows_landmark ?a2 ?l ?p)
    )

    ; Action: Verify agents are in the same position
    (:action verify_meeting
        :parameters (?a1 ?a2 - agent ?p - position)
        :precondition (and (at ?a1 ?p) (at ?a2 ?p))
        :effect (agents_met ?a1 ?a2 ?p))
)
