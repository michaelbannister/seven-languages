m := Matrix dim(3,4)
m set(1,1,1) set(2,2,2) set(3,3,5) set(1,4,99)
m print
Assert equal(99, m get(1,4))
Assert raisesException(m get(6,2))
Assert raisesException(m get(2,0))

m_t := m transpose
m_t print
Assert equal(99, m_t get(4,1))


m2 := Matrix fromFile("input_matrix.txt")
Assert equal(0, m2 get(1,1))
Assert equal(7, m2 get(4,1))
Assert equal(9, m2 get(3,3))

m2 transpose toFile("output_matrix.txt")