(define (problem meeting_problem_test)
    (:domain meeting_problem)

    (:objects
        agent_a agent_b - agent
        p1 p2 p3 p4 p5 p6 - position
        l q r - landmark
    )

    (:init
        ; Initial agent positions
        (at agent_a p1) ; Agent a starts at p1
        (at agent_b p4) ; Agent b starts at p4

        ; Landmark positions
        (landmark_at l p3)
        (landmark_at q p5)
        (landmark_at r p6)

        ; Initial knowledge state
        (not (knows_landmark agent_a l p3))
        (not (knows_landmark agent_b q p5))
        (not (knows_landmark agent_a r p6))
        (not (agents_met agent_a agent_b p1))
    )

    (:goal (and
        ; Agents must meet at p1
        (agents_met agent_a agent_b p1)
    ))
)
