(define (problem coin_in_the_box_test)
    (:domain coin_in_the_box)

    (:objects
        agent_a agent_b agent_c - agent
    )

    (:init
        ; Initial coin state (unknown to all agents)
        (coin_state_heads)
        (not (coin_state_tails))

        ; Box is initially locked
        (not (box_open))

        ; No agent initially knows the coin's state
        (not (knows_coin_state agent_a))
        (not (knows_coin_state agent_b))
        (not (knows_coin_state agent_c))

        ; Agents are not distracted or signaled
        (not (distracted agent_a))
        (not (distracted agent_b))
        (not (distracted agent_c))
        (not (signaled agent_a))
        (not (signaled agent_b))
        (not (signaled agent_c))
    )

    (:goal (and
        ; Agent A must know the coin's state
        (knows_coin_state agent_a)
        ; Agent B must know that Agent A knows the coin's state
        (knows_that_knows agent_b agent_a)
        ; Agent C must not know the coin's state
        (not (knows_coin_state agent_c))
    ))
)
