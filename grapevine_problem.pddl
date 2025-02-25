(define (problem grapevine_test)
    (:domain grapevine)

    (:objects
        agent1 agent2 agent3 - agent
        room1 room2 room3 - room
        secret1 secret2 secret3 - secret
    )

    (:init
        ; Initial positions of agents
        (at agent1 room1)
        (at agent2 room2)
        (at agent3 room3)

        ; Room adjacency
        (adjacent room1 room2)
        (adjacent room2 room3)
        (adjacent room1 room3)

        ; Secrets possessed by agents
        (has_secret agent1 secret1)
        (has_secret agent2 secret2)
        (has_secret agent3 secret3)

        ; No initial knowledge of other agents' secrets
        (not (knows agent1 secret2))
        (not (knows agent1 secret3))
        (not (knows agent2 secret1))
        (not (knows agent2 secret3))
        (not (knows agent3 secret1))
        (not (knows agent3 secret2))
    )

    (:goal (and
        ; Specific knowledge sharing goals
        (knows agent1 secret2) ; Agent1 must learn secret2
        (knows agent3 secret1) ; Agent3 must learn secret1
        ; Ensure restricted dissemination
        (not (knows agent2 secret1)) ; Agent2 must not learn secret1
    ))
)
