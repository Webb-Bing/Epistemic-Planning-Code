(define (problem collaboration_communication_test)
    (:domain collaboration_communication)

    (:objects
        agent1 agent2 - agent
        b1 b2 - box
        p1 p2 p3 - room
    )

    (:init
        ; Initial positions of agents
        (at agent1 p2)
        (at agent2 p2)

        ; Initial positions of boxes
        (box_at b1 p1)
        (box_at b2 p3)

        ; Room adjacency
        (adjacent p1 p2)
        (adjacent p2 p3)
        (adjacent p2 p1)
        (adjacent p3 p2)

        ; Initial knowledge state
        (not (knows_box_location agent1 b1))
        (not (knows_box_location agent1 b2))
        (not (knows_box_location agent2 b1))
        (not (knows_box_location agent2 b2))
    )

    (:goal (and
        (knows_box_location agent1 b1) ; Agent1 knows the location of b1
        (knows_box_location agent2 b2) ; Agent2 knows the location of b2
    ))
)
