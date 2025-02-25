(define (problem assembly_line_test)
    (:domain assembly_line)

    (:objects
        worker1 worker2 - agent
        task1 task2 - task
    )

    (:init
        ; Initial state: No tasks are started
        (not (task_in_progress task1))
        (not (task_in_progress task2))
        (not (task_completed task1))
        (not (task_completed task2))
        (not (task_failed task1))
        (not (task_failed task2))

        ; No assembly in progress or completed
        (not (assembly_in_progress))
        (not (assembly_completed))

        ; Agents do not initially know task statuses
        (not (knows_task_status worker1 task1))
        (not (knows_task_status worker1 task2))
        (not (knows_task_status worker2 task1))
        (not (knows_task_status worker2 task2))
    )

    (:goal (and
        (assembly_completed) ; Product must be successfully assembled
    ))
)
