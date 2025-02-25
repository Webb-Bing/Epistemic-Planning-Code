(define (domain coin_problem)
    (:requirements :strips :typing :epistemic)

    (:types
        agent state
    )

    (:predicates
        (coin_heads)                                ; The coin is heads
        (coin_tails)                                ; The coin is tails
        (peeking ?a - agent)                        ; Agent is observing the coin
        (believes_heads ?a - agent)                 ; Agent believes the coin is heads
        (believes_tails ?a - agent)                 ; Agent believes the coin is tails
        (believes_that ?a1 ?a2 - agent ?belief - state) ; Agent A1 believes that Agent A2 holds a specific belief
    )

    ; Action: Peek at the coin
    (:action peek
        :parameters (?a - agent)
        :precondition (not (peeking ?a))
        :effect (peeking ?a))

    ; Action: Return from observing the coin
    (:action return
        :parameters (?a - agent)
        :precondition (peeking ?a)
        :effect (not (peeking ?a)))

    ; Action: Flip the coin (random or external action)
    (:action flip_coin
        :parameters ()
        :precondition (or (coin_heads) (coin_tails))
        :effect (and
            (when (coin_heads) (and (not (coin_heads)) (coin_tails)))
            (when (coin_tails) (and (not (coin_tails)) (coin_heads)))))

    ; Action: Deduce belief about the coin's state
    (:action deduce_belief
        :parameters (?a - agent ?belief - state)
        :precondition (and
            (peeking ?a)
            (or (and (?belief coin_heads) (coin_heads))
                (and (?belief coin_tails) (coin_tails))))
        :effect (when (?belief coin_heads) (believes_heads ?a))
                 (when (?belief coin_tails) (believes_tails ?a)))

    ; Action: Agent A deduces belief about another agent's belief
    (:action deduce_nested_belief
        :parameters (?a1 ?a2 - agent ?belief - state)
        :precondition (and
            (believes_heads ?a1)
            (or (believes_heads ?a2) (believes_tails ?a2)))
        :effect (believes_that ?a1 ?a2 ?belief))
)
