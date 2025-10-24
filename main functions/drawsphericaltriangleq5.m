% General variant of drawsphericaltriangle for question 5
function drawsphericaltriangleq5(z1,z2,z3)
triple=reorder(z1,z2,z3);
drawsphericaltriangle(triple(1),triple(2),triple(3))