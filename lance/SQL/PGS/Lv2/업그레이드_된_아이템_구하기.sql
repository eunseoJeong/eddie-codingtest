SELECT
    ITEM_ID,
    ITEM_NAME,
    RARITY
FROM ITEM_INFO
JOIN ITEM_TREE
USING (ITEM_ID)
WHERE PARENT_ITEM_ID IN 
                        (SELECT ITEM_ID
                         FROM ITEM_INFO
                         JOIN ITEM_TREE
                         USING (ITEM_ID)
                         WHERE RARITY = 'RARE')
ORDER BY 1 DESC