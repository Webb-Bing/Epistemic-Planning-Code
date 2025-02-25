(define (domain active_muddy_child)
    (:requirements :strips :typing :epistemic)

    (:types 
        agent
    )

    (:predicates
        (muddy ?a - agent)                    ; Indicates if a child is muddy
        (knows_if_muddy ?a - agent)           ; Indicates if a child knows their own muddy state
        (common_knowledge_not_muddy)         ; Common knowledge of the number of non-muddy children
        (observed ?a1 ?a2 - agent)            ; Child ?a1 has observed child ?a2
        (asked ?a1 ?a2 - agent)               ; Child ?a1 has asked child ?a2
        (responded ?a - agent)                ; Child ?a has responded to a question
        (response_truthful ?a - agent)        ; Child's response is truthful
    )

    ; Action: Observe if another child is muddy
    (:action observe
        :parameters (?observer ?target - agent)
        :precondition (not (observed ?observer ?target))
        :effect (and
            (observed ?observer ?target)
            (when (muddy ?target) (knows_if_muddy ?observer))
        )
    )

    ; Action: Ask another child "Do you know if you are muddy?"
    (:action ask
        :parameters (?asker ?responder - agent)
        :precondition (and 
            (not (asked ?asker ?responder))
            (not (knows_if_muddy ?asker))
        )
        :effect (and
            (asked ?asker ?responder)
        )
    )

    ; Action: Respond truthfully to a question
    (:action respond_truthfully
        :parameters (?responder - agent)
        :precondition (and
            (asked ?asker ?responder)
            (not (responded ?responder))
        )
        :effect (and
            (responded ?responder)
            (response_truthful ?responder)
        )
    )

    ; Action: Deduce muddy state after a response
    (:action deduce_from_response
        :parameters (?asker ?responder - agent)
        :precondition (and
            (asked ?asker ?responder)
            (responded ?responder)
            (response_truthful ?responder)
        )
        :effect (knows_if_muddy ?asker)
    )
)
