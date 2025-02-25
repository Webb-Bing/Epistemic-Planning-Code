(define (domain social_media_network)
    (:requirements :strips :typing :epistemic)

    (:types
        agent information
    )

    (:predicates
        (friend ?a1 ?a2 - agent)                   ; Agent a1 is friends with agent a2
        (post ?a - agent ?info - information)      ; Agent a has posted information
        (retracted ?a - agent ?info - information) ; Information has been retracted by the agent
        (knows ?a - agent ?info - information)     ; Agent knows the information
        (informed ?a1 ?a2 - agent ?info - information) ; Agent a1 has informed agent a2 about information
    )

    ; Action: Befriend another agent
    (:action befriend
        :parameters (?a1 ?a2 - agent)
        :precondition (not (friend ?a1 ?a2))
        :effect (and
            (friend ?a1 ?a2)
            (friend ?a2 ?a1)))

    ; Action: Unfriend another agent
    (:action unfriend
        :parameters (?a1 ?a2 - agent)
        :precondition (friend ?a1 ?a2)
        :effect (and
            (not (friend ?a1 ?a2))
            (not (friend ?a2 ?a1))))

    ; Action: Post information on the homepage
    (:action post
        :parameters (?a - agent ?info - information)
        :precondition (not (post ?a ?info))
        :effect (post ?a ?info))

    ; Action: Retract information from the homepage
    (:action retract
        :parameters (?a - agent ?info - information)
        :precondition (post ?a ?info)
        :effect (and
            (not (post ?a ?info))
            (retracted ?a ?info)))

    ; Action: Share information with a friend
    (:action share
        :parameters (?a1 ?a2 - agent ?info - information)
        :precondition (and
            (friend ?a1 ?a2)
            (post ?a1 ?info)
            (not (knows ?a2 ?info)))
        :effect (and
            (knows ?a2 ?info)
            (informed ?a1 ?a2 ?info)))
)
