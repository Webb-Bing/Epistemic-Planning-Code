(define 
    (problem selective_communication_test)
    (:domain selective_communication)

    (:objects
        agent1 agent2 agent3 - agent
        room1 room2 room3 - room
        info1 info2 - information
    )

    (:init
        ; Initial positions of agents
        (at agent1 room1)
        (at agent2 room2)
        (at agent3 room3)

        ; Adjacency relationships
        (adjacent room1 room2)
        (adjacent room2 room3)

        ; Initial knowledge of agents
        (knows agent1 info1) ; Agent1 knows info1
        (not (knows agent2 info1)) ; Agent2 does not know info1
        (not (knows agent3 info1)) ; Agent3 does not know info1

        (knows agent2 info2) ; Agent2 knows info2
        (not (knows agent1 info2)) ; Agent1 does not know info2
        (not (knows agent3 info2)) ; Agent3 does not know info2
    )

    (:goal (and
        ; Goal: Agent3 learns info1 and agent1 learns info2
        (knows agent3 info1)
        (knows agent1 info2)

        ; Agent2 does not learn info1
        (not (knows agent2 info1))
    ))
)