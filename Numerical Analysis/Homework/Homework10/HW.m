m1 = [1,2,3; 0,5,4; 2,1,3];
m2 = hilb(10);
m3 = [0,0,1,2; 3,0,5,4; 1,1,1,2; 1,3,2,2];

frobenius(m1)
frobenius(m2)
frobenius(m3)

function result = frobenius(m)
    result = 0;
    for i = 1:size(m, 1)
        for j = 1:size(m, 2)
            result = result + m(i,j) ^ 2;
        end
    end
    result = sqrt(result);
end