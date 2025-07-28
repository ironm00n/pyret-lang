data Box<T>:
  | box(value :: T, consume :: (T -> Any))
end

fun expects-box-of-minimal(b :: Box<{ x :: Number }>):
  cases(Box) b:
    | box(val, consume-fn) => consume-fn({ x: 42 })
  end
end

fun needs-extra-fields(full :: { x :: Number, y :: String }):
  full.y
end

expects-box-of-minimal(box({ x: 1, y: "hello" }, needs-extra-fields))
