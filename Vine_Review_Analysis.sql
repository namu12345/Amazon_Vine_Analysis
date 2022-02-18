-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
select * from vine_table

--Filter the data and create a new DataFrame or table to retrieve all the rows where the total_votes
--count is equal to or greater than 20 to pick reviews that are more likely to be helpful and
--to avoid having division by zero errors later on.
create table vine_total_votes as
select * from vine_table
where total_votes>=20

select * from vine_total_votes

--Filter the new DataFrame or table created in Step 1 and create a new DataFrame or table to
--retrieve all the rows where the number of helpful_votes divided by total_votes is equal to
--or greater than 50%.
create table vine_helpful_total_votes as
select * from vine_total_votes
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

select * from vine_helpful_total_votes

--Filter the DataFrame or table created in Step 2, and create a new DataFrame or table that retrieves
--all the rows where a review was written as part of the Vine program (paid), vine == 'Y'.
create table vine_reviews_paidprogram as
select * from vine_helpful_total_votes
where vine = 'Y'

select * from vine_reviews_paidprogram

--Repeat Step 3, but this time retrieve all the rows where the review was not part of the
--Vine program (unpaid), vine == 'N'.
create table vine_reviews_unpaidprogram as
select * from vine_helpful_total_votes
where vine = 'N'
select * from vine_reviews_unpaidprogram

--Determine the total number of reviews, the number of 5-star reviews, and the percentage of
--5-star reviews for the two types of review (paid vs unpaid).
select a.vine as vine_reviews ,count(a.review_id) as Total_Reviews,(select count(star_rating)as five_star_reviews 
from vine_table 
where star_rating = 5 and a.vine= vine
),((select count(star_rating) 
from vine_table 
where star_rating = 5 and a.vine= vine
) * 100 / count(a.review_id))as percentage_5star
from vine_table a
group by a.vine 
  
select * from vine_table

