(define (problem situated_dialogue_test)
    (:domain situated_dialogue)

    (:objects
        agent_a agent_b - agent
        Q W E R T Y - object
        p1 p2 p3 p4 p5 p6 p7 p8 p9 - position
    )

    (:init
        ; Initial object positions
        (at E p3)
        (at R p4)
        (at T p5)
        (at Y p6)
        ; Q and W are in hidden areas, unknown to the agents
        (hidden_area agent_a p1)
        (hidden_area agent_a p2)
        (hidden_area agent_a p7)
        (hidden_area agent_a p8)
        (hidden_area agent_a p9)
        (hidden_area agent_b p1)
        (hidden_area agent_b p2)
        (hidden_area agent_b p7)
        (hidden_area agent_b p8)
        (hidden_area agent_b p9)

        ; Visibility rules
        (visible agent_a E)
        (visible agent_a R)
        (visible agent_a T)
        (visible agent_a Y)
        (visible agent_b E)
        (visible agent_b R)
        (visible agent_b T)
        (visible agent_b Y)

        ; Initial knowledge states
        (not (knows_position agent_a Q))
        (not (knows_position agent_b W))
    )

    (:goal (and
        ; Agent A must know the position of Q
        (knows_position agent_a Q)
        ; Agent B must know the position of W
        (knows_position agent_b W)
    ))
)
