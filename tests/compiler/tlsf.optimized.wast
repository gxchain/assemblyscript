(module
 (type $ii (func (param i32) (result i32)))
 (type $iiv (func (param i32 i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $iiiiv (func (param i32 i32 i32 i32)))
 (type $iv (func (param i32)))
 (type $v (func))
 (memory $0 1)
 (data (i32.const 4) "\08")
 (export "control_construct" (func $tlsf/control_construct))
 (export "memory" (memory $0))
 (start $start)
 (func $tlsf/fls (; 0 ;) (type $ii) (param $0 i32) (result i32)
  (if (result i32)
   (get_local $0)
   (i32.sub
    (i32.const 31)
    (i32.clz
     (get_local $0)
    )
   )
   (i32.const -1)
  )
 )
 (func $tlsf/ffs (; 1 ;) (type $ii) (param $0 i32) (result i32)
  (if (result i32)
   (get_local $0)
   (i32.ctz
    (get_local $0)
   )
   (i32.const -1)
  )
 )
 (func $tlsf/block_set_next_free (; 2 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $1)
  )
 )
 (func $tlsf/block_set_prev_free (; 3 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 12)
   )
   (get_local $1)
  )
 )
 (func $tlsf/control_set_fl (; 4 ;) (type $iiv) (param $0 i32) (param $1 i32)
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 16)
   )
   (get_local $1)
  )
 )
 (func $tlsf/control_set_sl (; 5 ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (if
   (i32.ge_s
    (get_local $1)
    (i32.const 23)
   )
   (unreachable)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $0)
     (i32.const 20)
    )
    (i32.mul
     (get_local $1)
     (i32.const 4)
    )
   )
   (get_local $2)
  )
 )
 (func $tlsf/control_set_block (; 6 ;) (type $iiiiv) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (if
   (i32.ge_s
    (get_local $1)
    (i32.const 23)
   )
   (unreachable)
  )
  (if
   (i32.ge_s
    (get_local $2)
    (i32.const 32)
   )
   (unreachable)
  )
  (i32.store
   (i32.add
    (i32.add
     (get_local $0)
     (i32.const 112)
    )
    (i32.mul
     (i32.add
      (i32.mul
       (get_local $1)
       (i32.const 32)
      )
      (get_local $2)
     )
     (i32.const 4)
    )
   )
   (get_local $3)
  )
 )
 (func $tlsf/control_construct (; 7 ;) (type $iv) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (call $tlsf/block_set_next_free
   (get_local $0)
   (get_local $0)
  )
  (call $tlsf/block_set_prev_free
   (get_local $0)
   (get_local $0)
  )
  (call $tlsf/control_set_fl
   (get_local $0)
   (i32.const 0)
  )
  (set_local $1
   (i32.const 0)
  )
  (loop $continue|1.1
   (if
    (i32.lt_s
     (get_local $1)
     (i32.const 23)
    )
    (block
     (call $tlsf/control_set_sl
      (get_local $0)
      (get_local $1)
      (i32.const 0)
     )
     (set_local $2
      (i32.const 0)
     )
     (loop $continue|1.2
      (if
       (i32.lt_s
        (get_local $2)
        (i32.const 32)
       )
       (block
        (call $tlsf/control_set_block
         (get_local $0)
         (get_local $1)
         (get_local $2)
         (get_local $0)
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 1)
         )
        )
        (br $continue|1.2)
       )
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (br $continue|1.1)
    )
   )
  )
 )
 (func $start (; 8 ;) (type $v)
  (if
   (i32.ne
    (call $tlsf/fls
     (i32.const 0)
    )
    (i32.const -1)
   )
   (unreachable)
  )
  (if
   (call $tlsf/fls
    (i32.const 1)
   )
   (unreachable)
  )
  (if
   (i32.ne
    (call $tlsf/fls
     (i32.const -2147483640)
    )
    (i32.const 31)
   )
   (unreachable)
  )
  (if
   (i32.ne
    (call $tlsf/fls
     (i32.const 2147483647)
    )
    (i32.const 30)
   )
   (unreachable)
  )
  (if
   (i32.ne
    (call $tlsf/ffs
     (i32.const 0)
    )
    (i32.const -1)
   )
   (unreachable)
  )
  (if
   (call $tlsf/ffs
    (i32.const 1)
   )
   (unreachable)
  )
  (if
   (i32.ne
    (call $tlsf/ffs
     (i32.const -2147483648)
    )
    (i32.const 31)
   )
   (unreachable)
  )
  (call $tlsf/control_construct
   (i32.load
    (i32.const 4)
   )
  )
 )
)
