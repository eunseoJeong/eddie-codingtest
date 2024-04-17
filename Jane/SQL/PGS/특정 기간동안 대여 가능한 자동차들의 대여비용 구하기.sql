# CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서
# --조건-- #
# 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 
# 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 
# 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 
# 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
# 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.

SELECT c.CAR_ID, c.CAR_TYPE, ROUND((c.DAILY_FEE*((100-d.DISCOUNT_RATE)/100))*30, 0) AS FEE
FROM CAR_RENTAL_COMPANY_CAR c JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN d ON c.CAR_TYPE = d.CAR_TYPE AND d.DURATION_TYPE = '30일 이상'
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY h ON c.CAR_ID = h.CAR_ID
    AND ((h.START_DATE <= '2022-11-30' AND h.END_DATE >= '2022-11-01'))
WHERE 
    c.CAR_TYPE IN ('세단', 'SUV')
    AND h.CAR_ID IS NULL  
GROUP BY 
    c.CAR_ID, c.CAR_TYPE, c.DAILY_FEE, d.DISCOUNT_RATE
HAVING 
    FEE >= 500000 AND FEE < 2000000
ORDER BY 
    FEE DESC, c.CAR_TYPE ASC, c.CAR_ID DESC

