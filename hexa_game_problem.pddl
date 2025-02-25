(define (problem hexa_game_test)
    (:domain hexa_game)

    (:objects
        player1 player2 player3 - agent
        card1 card2 card3 - card
        red green blue - color
    )

    (:init
        ; Card ownership
        (has_card player1 card1)
        (has_card player2 card2)
        (has_card player3 card3)

        ; Card colors
        (card_color card1 red)
        (card_color card2 green)
        (card_color card3 blue)

        ; Initial knowledge
        (knows_card_color player1 card1)
        (not (knows_card_color player1 card2))
        (not (knows_card_color player1 card3))

        (knows_card_color player2 card2)
        (not (knows_card_color player2 card1))
        (not (knows_card_color player2 card3))

        (knows_card_color player3 card3)
        (not (knows_card_color player3 card1))
        (not (knows_card_color player3 card2))
    )

    (:goal (and
        ; All players must know the colors of all cards
        (knows_card_color player1 card2)
        (knows_card_color player1 card3)
        (knows_card_color player2 card1)
        (knows_card_color player2 card3)
        (knows_card_color player3 card1)
        (knows_card_color player3 card2)
    ))
)
