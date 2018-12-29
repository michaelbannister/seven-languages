(ns day1-test
  (:require [clojure.test :refer :all]
            [day1 :refer :all]))

(deftest big-test
  (testing "string shorter than given size is not big"
    (is (not (big "abc" 4))))
  (testing "string equal to given size is not big"
    (is (not (big "abcd" 4))))
  (testing "string longer than given size is big"
    (is (big "abcde" 4))))

(deftest collection-type-test
  (testing "vector is identified as :vector"
    (is (= :vector (collection-type (vector))))
    (is (= :vector (collection-type [1 2 3]))))
  (testing "list is identified as :list"
    (is (= :list (collection-type (list))))
    (is (= :list (collection-type '(1 2 3)))))
  (testing "map is identified as :map"
    (is (= :map (collection-type {})))
    (is (= :map (collection-type {:a 1, :b 2})))))