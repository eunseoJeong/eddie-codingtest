SELECT 
    CASE WHEN A=B AND B=C THEN 'Equilateral'
    WHEN ((A=B AND B!=C) OR (B=C AND C != A) OR (C=A AND B!= C))
    AND ((A+B > C) AND (B+C > A) AND (C+A > B)) THEN 'Isosceles'
    WHEN (A+B > C) AND (B+C > A) AND (C+A > B) THEN 'Scalene'
    ELSE 'Not A Triangle' END
FROM TRIANGLES;