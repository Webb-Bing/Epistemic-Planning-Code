(define (problem word_room_test)
    (:domain word_room)

    (:objects
        agent_a agent_b - agent
        room1 room2 room3 room4 room5 room6 room7 - room
        a b c d e f g - letter
        pos1 pos2 pos3 pos4 pos5 pos6 pos7 - position
    )

    (:init
        ; Initial agent locations
        (at_corridor agent_a)
        (at_corridor agent_b)

        ; Letters in rooms
        (contains_letter room1 a pos1)
        (contains_letter room2 b pos2)
        (contains_letter room3 c pos3)
        (contains_letter room4 d pos4)
        (contains_letter room5 e pos5)
        (contains_letter room6 f pos6)
        (contains_letter room7 g pos7)

        ; Initial knowledge state
        (not (knows_letter agent_a a pos1))
        (not (knows_letter agent_b b pos2))
        (not (word_determined agent_a))
        (not (word_determined agent_b))
    )

    (:goal (and
        ; Both agents must determine the hidden word
        (word_determined agent_a)
        (word_determined agent_b)
    ))
)
