(define (problem sum_test)
    (:domain sum)

    (:objects
        agent_a agent_b agent_c - agent
        1 2 3 4 5 - number
    )

    (:init
        ; Numbers on agents' foreheads
        (number_on_forehead agent_a 2)
        (number_on_forehead agent_b 3)
        (number_on_forehead agent_c 5)

        ; Common knowledge of the sum relationship
        (common_knowledge_sum)

        ; Initial state of knowledge
        (not (knows_number agent_a))
        (not (knows_number agent_b))
        (not (knows_number agent_c))
        (not (announced agent_a))
        (not (announced agent_b))
        (not (announced agent_c))
    )

    (:goal (and
        ; All agents must deduce their own numbers
        (knows_number agent_a)
        (knows_number agent_b)
        (knows_number agent_c)
    ))
)
