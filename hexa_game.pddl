(define (domain hexa_game)
    (:requirements :strips :typing :epistemic)

    (:types
        agent card color
    )

    (:predicates
        (has_card ?a - agent ?c - card)          ; Agent holds a specific card
        (card_color ?c - card ?col - color)     ; A card is associated with a specific color
        (knows_card_color ?a - agent ?c - card) ; Agent knows the color of a card
    )

    ; Action: Ask another agent if their card is a specific color
    (:action ask_card_color
        :parameters (?asker ?responder - agent ?c - card ?col - color)
        :precondition (and
            (has_card ?responder ?c) ; The responder must have the card
        )
        :effect (and
            (knows_card_color ?asker ?c) ; The asker learns the color of the card
        )
    )
)
