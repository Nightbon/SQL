UPDATE menu 
SET price = (price - price / 10)::integer 
WHERE pizza_name = 'greek pizza';