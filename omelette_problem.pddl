(define (problem omelette_example_test)
    (:domain omelette_example)

    (:objects
        egg1 egg2 egg3 egg4 egg5 - egg
        bowl saucer - container
    )

    (:init
        ; Quality of eggs (unknown to the agent)
        (good egg1)
        (good egg2)
        (good egg3)
        (bad egg4)
        (bad egg5)

        ; Initial states of containers
        (empty bowl)
        (empty saucer)
    )

    (:goal (and
        ; Bowl must contain exactly three good eggs
        (in egg1 bowl)
        (in egg2 bowl)
        (in egg3 bowl)
        (not (in egg4 bowl))
        (not (in egg5 bowl))
    ))
)
