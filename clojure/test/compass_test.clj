(ns compass-test
  (:require [clojure.test :refer :all]
            [compass :refer :all])
  (:import (compass SimpleCompass)))

(deftest compass-test
  (let [north (SimpleCompass. 0)]
    (testing "can create a SimpleCompass"
      (is (= (direction north) :north)))
    (testing "simple turning"
      (is (= (direction (right north)) :east))
      (is (= (direction (left north)) :west)))
    (testing "turning all the way around"
      (is (= (nth (iterate right north) 4) north))))
  )
