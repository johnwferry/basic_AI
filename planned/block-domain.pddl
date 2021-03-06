﻿(define (domain stacking-domain)
  (:requirements :equality)
  (:predicates (left-clear ?x) (right-clear ?x)
  (nothing-to-left ?x) (nothing-to-right ?x) (on-left ?x ?y) (on-right ?x
  ?y) (touching ?x ?y) (on-table ?x) (holding ?x) (empty-hand) (in-bag ?x))

  (:action pick-up-from-top-right-touching-stacked
    :parameters (?block ?left-block ?left-below-block ?right-below-block)
    :precondition (and
      (on-right ?block ?left-below-block)
      (on-left ?block ?right-below-block)
      (touching ?left-block ?block)
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (empty-hand))
    :effect (and
      (right-clear ?left-below-block)
      (left-clear ?right-below-block)
      (nothing-to-right ?left-block)
      (nothing-to-left ?block)
      (holding ?block)
      (not (empty-hand))
      (not (on-right ?block ?left-below-block))
      (not (on-left ?block ?right-below-block))
      (not (touching ?left-block ?block)))
  )

  (:action put-down-from-top-right-touching-stacked
    :parameters (?block ?left-block ?left-below-block ?right-below-block)
    :precondition (and
      (holding ?block)
      (right-clear ?left-below-block)
      (left-clear ?right-below-block)
      (right-clear ?right-below-block)
      (nothing-to-right ?left-block)
      (on-left ?left-block ?left-below-block)
      (touching ?left-below-block ?right-below-block))
    :effect (and
      (empty-hand)
      (on-left ?block ?right-below-block)
      (on-right ?block ?left-below-block)
      (touching ?left-block ?block)
      (not (holding ?block))
      (not (right-clear ?left-below-block))
      (not (left-clear ?right-below-block))
      (not (nothing-to-right ?left-block))
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (not (nothing-to-left ?block)))
  )

  (:action take-from-bag
    :parameters (?block)
    :precondition (and (in-bag ?block) (empty-hand))
    :effect (and (holding ?block)
      (not (in-bag ?block))
      (not (empty-hand)))
  )

  (:action pick-up-from-top-right-stacked
    :parameters (?block ?left-below-block ?right-below-block)
    :precondition (and
      (on-right ?block ?left-below-block)
      (on-left ?block ?right-below-block)
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-left ?block)
      (nothing-to-right ?block)
      (empty-hand))
    :effect (and
      (right-clear ?left-below-block)
      (left-clear ?right-below-block)
      (nothing-to-left ?block)
      (holding ?block)
      (not (empty-hand))
      (not (on-right ?block ?left-below-block))
      (not (on-left ?block ?right-below-block)))
  )

  (:action pick-up-from-top-right-touching
    :parameters (?block ?left-block)
    :precondition (and
      (on-table ?left-block)
      (on-table ?block)
      (touching ?left-block ?block)
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (empty-hand))
    :effect (and
      (nothing-to-right ?left-block)
      (nothing-to-left ?block)
      (holding ?block)
      (not (empty-hand))
      (not (on-table ?block))
      (not (touching ?left-block ?block)))
  )

  (:action pick-up-from-top-right
    :parameters (?block)
    :precondition (and
      (on-table ?block)
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (nothing-to-left ?block)
      (empty-hand))
    :effect (and
      (holding ?block)
      (not (empty-hand))
      (not (on-table ?block)))
  )

  (:action put-down-from-top-right-stacked
    :parameters (?block ?left-below-block ?right-below-block)
    :precondition (and
      (holding ?block)
      (right-clear ?left-below-block)
      (left-clear ?left-below-block)
      (left-clear ?right-below-block)
      (right-clear ?right-below-block)
      (touching ?left-below-block ?right-below-block))
    :effect (and
      (empty-hand)
      (on-left ?block ?right-below-block)
      (on-right ?block ?left-below-block)
      (not (holding ?block))
      (not (right-clear ?left-below-block))
      (not (left-clear ?right-below-block))
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (nothing-to-left ?block))
  )

  (:action put-down-from-top-right-touching
    :parameters (?block ?left-block)
    :precondition (and
      (holding ?block)
      (on-table ?left-block)
      (nothing-to-right ?left-block))
    :effect (and
      (empty-hand)
      (on-table ?block)
      (touching ?left-block ?block)
      (not (holding ?block))
      (not (nothing-to-right ?left-block))
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (not (nothing-to-left ?block)))
  )

  (:action put-down-from-top-right :parameters (?block)
    :precondition (and
      (holding ?block))
    :effect (and
      (empty-hand)
      (on-table ?block)
      (not (holding ?block))
      (left-clear ?block)
      (right-clear ?block)
      (nothing-to-right ?block)
      (nothing-to-left ?block))
  )




; TODO: Implement the following action schemas
;   (:action take-from-bag :parameters (?block)... )
;   (:action pick-up-from-top-right-stacked :parameters (?block ?left-below-block ?right-below-block) ... )
;   (:action pick-up-from-top-right-touching :parameters (?block ?left-block) ... )
;   (:action pick-up-from-top-right :parameters (?block) ... )
;   (:action put-down-from-top-right-stacked :parameters (?block ?left-below-block ?right-below-block) ... )
;   (:action put-down-from-top-right-touching :parameters (?block ?left-block) ... )
;   (:action put-down-from-top-right :parameters (?block) ... )
)
