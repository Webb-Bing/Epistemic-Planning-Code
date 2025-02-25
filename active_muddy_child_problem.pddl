(define (problem active_muddy_child_test)
    (:domain active_muddy_child)

    (:objects
        child1 child2 child3 - agent
    )

    (:init
        ; Muddy states
        (muddy child1)
        (not (muddy child2))
        (muddy child3)

        ; Common knowledge of non-muddy children
        (common_knowledge_not_muddy)

        ; Initial state of knowledge
        (not (knows_if_muddy child1))
        (not (knows_if_muddy child2))
        (not (knows_if_muddy child3))
        (not (observed child1 child2))
        (not (observed child2 child3))
        (not (observed child3 child1))
        (not (asked child1 child2))
        (not (asked child2 child3))
        (not (asked child3 child1))
    )

    (:goal (and
        ; Specific child deduces their muddy status
        (knows_if_muddy child1)
    ))
)
