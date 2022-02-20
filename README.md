# Amazon_Vine_Analysis

![image](https://user-images.githubusercontent.com/92283185/154821298-7db953c1-d523-42d3-b096-e1ac20068f20.png)


## Overview of the analysis: 

Data analysts were tasked with analyzing Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

Out of 50 datasets provided I chose Amazon's Video Games to determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. The Extract, Transform, and Load (ETL) process was used on the Video Games dataset. An AWS RDS database was created and the Video Games dataset was uploaded into an S3 bucket. PgAdmin was utilized to connect to AWS, and pySpark and postgreSQL were used against the data set to create four separate DataFrames to match the table schema in pgAdmin. 
following are the four tables created :
1. Customers Table :

![customers_table](https://user-images.githubusercontent.com/92283185/154827082-a71f5148-b961-435c-a8db-fc0621d1f5c9.PNG)

2. products_table

![products_table](https://user-images.githubusercontent.com/92283185/154827108-615aa256-d1d9-4dd3-8191-0f5b8e418852.PNG)

3. review_id_table

![review_id_table](https://user-images.githubusercontent.com/92283185/154827136-f280482a-4b34-4173-a1f1-688d4d7613cd.PNG)

4. vine_table

![vine table](https://user-images.githubusercontent.com/92283185/154827151-b9b97402-3f59-4d41-9a3d-46b13a7af2ec.PNG)



## Results: 

As mentioned earlier Amazon-Vine-Analysis is performed to determine if there is any bias towards reviews that were written as part of the Vine program. For this analysis, we need to determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. In order to analyize the reviews we need to filter our dataset as per following steps :

- Filter the data to retrieve all the rows where the total_votes count is equal to or greater than 20 to pick reviews that are more likely to be helpful and to avoid having division by zero errors later on. This is done by the following query :
  - select * from vine_table where total_votes>=20 : 
    - 65379 rows affected.

- Further Filter the data to retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%.
  - select * from vine_total_votes WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5
    - 40565 rows affected.

- Filter the DataFrame that retrieves all the rows where a review was written as part of the Vine program (paid), vine == 'Y'.
  - select * from vine_helpful_total_votes where vine = 'Y'
    - 94 rows affected.

- Filter the DataFrame that retrieves all the rows where a review was written as part of the Vine program (paid), vine == 'N'.
  - select * from vine_helpful_total_votes where vine = 'N'
    - 40471 rows affected.

- Finally Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews for the two types of review (paid vs unpaid). This can be well explained with further following questions :
  
1.  How many Vine reviews and non-Vine reviews were there?

![image](https://user-images.githubusercontent.com/92283185/154822019-629fc371-c740-4d2d-bbd5-80f1fff889c3.png)



2.  How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?

![image](https://user-images.githubusercontent.com/92283185/154822054-995aa0d5-6d17-485c-bed4-df627b5e14fc.png)



3.  What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
![image](https://user-images.githubusercontent.com/92283185/154822138-fb787bed-5b16-4bd5-aa9c-6ba6f82c1232.png)



## Summary: 

Based on the results, Vine members did not show bias when rating their products considering that the number of 5-star ratings was about 20% less than Non-Vine members (37% vs. 57%). With this, we can assume that Vine customers are more critical when submitting their review. This conclusion could be further examined by looking at the distribution of all star-levels across paid and unpaid reviews. Also, for a more thorough analysis, this same meta-analysis should be conducted across a few different product catagories.
