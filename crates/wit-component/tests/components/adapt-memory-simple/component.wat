(component
  (type (;0;)
    (instance
      (type (;0;) (func (param "s" string)))
      (export (;0;) "log" (func (type 0)))
    )
  )
  (import "new" (instance (;0;) (type 0)))
  (core module (;0;)
    (type (;0;) (func (param i32 i32)))
    (import "old" "log" (func (;0;) (type 0)))
    (memory (;0;) 1)
    (export "memory" (memory 0))
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
      (processed-by "my-fake-bindgen" "123.45")
    )
  )
  (core module (;1;)
    (type (;0;) (func (param i32 i32)))
    (import "new" "log" (func $log (;0;) (type 0)))
    (export "log" (func $log))
  )
  (core module (;2;)
    (type (;0;) (func (param i32 i32)))
    (func $indirect-new-log (;0;) (type 0) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 0
      call_indirect (type 0)
    )
    (func $adapt-old-log (;1;) (type 0) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 1
      call_indirect (type 0)
    )
    (table (;0;) 2 2 funcref)
    (export "0" (func $indirect-new-log))
    (export "1" (func $adapt-old-log))
    (export "$imports" (table 0))
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
    )
  )
  (core module (;3;)
    (type (;0;) (func (param i32 i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 0)))
    (import "" "$imports" (table (;0;) 2 2 funcref))
    (elem (;0;) (i32.const 0) func 0 1)
    (@producers
      (processed-by "wit-component" "$CARGO_PKG_VERSION")
    )
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "1" (core func (;0;)))
  (core instance (;1;)
    (export "log" (func 0))
  )
  (core instance (;2;) (instantiate 0
      (with "old" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 0 "0" (core func (;1;)))
  (core instance (;3;)
    (export "log" (func 1))
  )
  (core instance (;4;) (instantiate 1
      (with "new" (instance 3))
    )
  )
  (alias core export 0 "$imports" (core table (;0;)))
  (alias export 0 "log" (func (;0;)))
  (core func (;2;) (canon lower (func 0) (memory 0) string-encoding=utf8))
  (alias core export 4 "log" (core func (;3;)))
  (core instance (;5;)
    (export "$imports" (table 0))
    (export "0" (func 2))
    (export "1" (func 3))
  )
  (core instance (;6;) (instantiate 3
      (with "" (instance 5))
    )
  )
  (@producers
    (processed-by "wit-component" "$CARGO_PKG_VERSION")
  )
)