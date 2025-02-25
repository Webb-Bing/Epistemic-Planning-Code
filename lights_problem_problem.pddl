(define (problem lights_problem_test)
    (:domain lights_problem)

    (:objects
        agent_a agent_b agent_c - agent
        l1 l2 l3 l4 - light
    )

    (:init
        ; Initial state: Lights are partially on
        (light_on l1)
        (not (light_on l2))
        (light_on l3)
        (not (light_on l4))

        ; Initial knowledge state
        (not (knows_disjunction agent_b l1 l2))
        (not (knows_disjunction agent_c l3 l4))
        (not (knows_all_lights_on agent_a))
    )

    (:goal (and
        ; Agent A must know that all lights are on
        (knows_all_lights_on agent_a)
    ))
)