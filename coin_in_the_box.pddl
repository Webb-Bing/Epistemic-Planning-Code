(define (domain coin_in_the_box)
    (:requirements :strips :typing :epistemic)

    (:types
        agent coin_state
    )

    (:predicates
        (coin_state_heads)                     ; The coin is heads up
        (coin_state_tails)                     ; The coin is tails up
        (box_open)                             ; The box is open
        (knows_coin_state ?a - agent)          ; Agent knows the coin's state
        (knows_that_knows ?a1 ?a2 - agent)     ; Agent A knows that Agent B knows the coin's state
        (distracted ?a - agent)                ; Agent is distracted
        (signaled ?a - agent)                  ; Agent is prompted to look at the box
        (coin_state_common_knowledge)          ; The coin's state is public knowledge
    )

    ; Action: Open the box (only Agent A can do this)
    (:action open_box
        :parameters (?a - agent)
        :precondition (= ?a agent_a)
        :effect (box_open))

    ; Action: Peek into the box to learn the coin's state
    (:action peek
        :parameters (?a - agent)
        :precondition (and
            (box_open)
            (not (distracted ?a))
        )
        :effect (knows_coin_state ?a))

    ; Action: Observe another agent peeking
    (:action observe_peek
        :parameters (?observer ?peeker - agent)
        :precondition (and
            (not (= ?observer ?peeker))
            (knows_coin_state ?peeker)
        )
        :effect (knows_that_knows ?observer ?peeker))

    ; Action: Distract an agent
    (:action distract
        :parameters (?distractor ?target - agent)
        :precondition (not (= ?distractor ?target))
        :effect (distracted ?target))

    ; Action: Signal an agent to look at the box
    (:action signal
        :parameters (?signaler ?target - agent)
        :precondition (not (= ?signaler ?target))
        :effect (signaled ?target))

    ; Action: Announce the coin's state
    (:action announce
        :parameters (?a - agent)
        :precondition (knows_coin_state ?a)
        :effect (coin_state_common_knowledge))
)
