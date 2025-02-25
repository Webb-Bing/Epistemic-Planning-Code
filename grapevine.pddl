(define (domain grapevine)
    (:requirements :strips :typing :epistemic)

    (:types 
        agent room secret
    )

    (:predicates
        (at ?a - agent ?r - room)                ; Agent is in a specific room
        (knows ?a - agent ?s - secret)           ; Agent knows a specific secret
        (has_secret ?a - agent ?s - secret)      ; Agent possesses a specific secret
        (adjacent ?r1 ?r2 - room)                ; Two rooms are adjacent
    )

    ; Action: Move between adjacent rooms
    (:action move
        :parameters (?a - agent ?from ?to - room)
        :precondition (and (at ?a ?from) (adjacent ?from ?to))
        :effect (and (not (at ?a ?from)) (at ?a ?to))
    )

    ; Action: Broadcast a secret to all agents in the same room
    (:action broadcast_secret
        :parameters (?a - agent ?s - secret ?r - room)
        :precondition (and 
            (has_secret ?a ?s)  ; Agent must possess the secret
            (at ?a ?r)          ; Agent must be in the specified room
        )
        :effect (forall (?a2 - agent)
            (when (at ?a2 ?r)
                (knows ?a2 ?s)
            )
        )
    )
)
