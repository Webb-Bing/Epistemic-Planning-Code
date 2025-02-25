(define (problem airport_example_test)
    (:domain airport_example)

    (:objects
        home airport gate_a gate_b - location
    )

    (:init
        ; Initial location of the agent
        (at home)

        ; Plane's location (unknown to the agent initially)
        (plane_at gate_a)
        (not (plane_at gate_b))

        ; Initial knowledge state
        (not (knows_plane_at gate_a))
        (not (knows_plane_at gate_b))
    )

    (:goal (and
        ; Agent must board the plane
        (boarded)
    ))
)
