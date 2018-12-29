(ns day1)

(defn big
  [st n]
  (> (count st) n))

(defn collection-type
  [col]
  (if (list? col)
    :list
    (if (map? col)
      :map
      (if (vector? col) :vector))))