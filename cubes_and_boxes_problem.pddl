(define (problem cubes_and_boxes_test)
    (:domain cubes_and_boxes)

    (:objects
        human robot - agent
        cube_h cube_r - object
        box1 box2 box3 box4 - box
    )

    (:init
        ; Cube locations
        (in cube_h box1)
        (in cube_r box3)

        ; Box accessibility
        (accessible human box1)
        (accessible human box2)
        (accessible robot box3)
        (accessible robot box4)

        ; Initial knowledge
        (not (knows_location human cube_h box1))
        (not (knows_location robot cube_r box3))
    )

    (:goal (and
        ; Human knows the location of cube_h
        (knows_location human cube_h box1)
        ; Robot knows the location of cube_r
        (knows_location robot cube_r box3)
    ))
)
