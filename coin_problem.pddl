(define (problem coin_problem_test)
    (:domain coin_problem)

    (:objects
        agent_a agent_b - agent
    )

    (:init
        ; Initial state of the coin
        (coin_heads)
        (not (coin_tails))

        ; Initial states of agents
        (not (peeking agent_a))
        (not (peeking agent_b))

        ; No beliefs initialized
        (not (believes_heads agent_a))
        (not (believes_tails agent_a))
        (not (believes_heads agent_b))
        (not (believes_tails agent_b))
    )

    (:goal (and
        ; Coin state goal
        (coin_tails)

        ; Beliefs goal
        (believes_tails agent_b)
        (believes_heads agent_a)
        (believes_that agent_b agent_a believes_heads)
    ))
)
