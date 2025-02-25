(define (domain assembly_line)
    (:requirements :strips :typing :epistemic)

    (:types
        agent task
    )

    (:predicates
        (task_in_progress ?t - task)           ; Task is in progress
        (task_completed ?t - task)            ; Task is completed
        (task_failed ?t - task)               ; Task has failed
        (knows_task_status ?a - agent ?t - task) ; Agent knows the status of a task
        (assembly_in_progress)                ; Assembly is in progress
        (assembly_completed)                  ; Assembly is completed
        (restart_required)                    ; Assembly line requires a restart
    )

    ; Action: Communicate the status of a task
    (:action communicate_status
        :parameters (?a1 ?a2 - agent ?t - task)
        :precondition (knows_task_status ?a1 ?t)
        :effect (knows_task_status ?a2 ?t)
    )

    ; Action: Work on a task
    (:action work_on_task
        :parameters (?a - agent ?t - task)
        :precondition (and (not (task_completed ?t)) (not (task_failed ?t)))
        :effect (and 
            (task_in_progress ?t) 
            (not (task_failed ?t))
        )
    )

    ; Action: Complete a task
    (:action complete_task
        :parameters (?a - agent ?t - task)
        :precondition (task_in_progress ?t)
        :effect (and 
            (task_completed ?t)
            (not (task_in_progress ?t))
        )
    )

    ; Action: Task failure
    (:action fail_task
        :parameters (?a - agent ?t - task)
        :precondition (task_in_progress ?t)
        :effect (and 
            (task_failed ?t)
            (not (task_in_progress ?t))
            (restart_required)
        )
    )

    ; Action: Restart the assembly line
    (:action restart_assembly
        :parameters ()
        :precondition (restart_required)
        :effect (and 
            (not (task_in_progress ?t)) ; Resets tasks
            (not (restart_required))
        )
    )

    ; Action: Assemble the product
    (:action assemble_product
        :parameters (?a - agent)
        :precondition (and 
            (task_completed task1) 
            (task_completed task2)
            (not (assembly_completed))
        )
        :effect (assembly_completed)
    )
)
