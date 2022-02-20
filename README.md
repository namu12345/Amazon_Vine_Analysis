# Amazon_Vine_Analysis

![image](https://user-images.githubusercontent.com/92283185/154821298-7db953c1-d523-42d3-b096-e1ac20068f20.png)


## Overview of the analysis: 

Data analysts were tasked with analyzing Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

Data from Amazon's Video Games department was analyzed to determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. The Extract, Transform, and Load (ETL) process was used on the Video Games dataset. An AWS RDS database was created and the Video Games dataset was uploaded into an S3 bucket. PgAdmin was utilized to connect to AWS, and pySpark and postgreSQL were used against the data set to create four separate DataFrames to match the table schema in pgAdmin. The transformed data was then uploaded into AWS RDS.

## Results: 

In this result section we need to determine if there is any bias towards reviews that were written as part of the Vine program. For this analysis, we need to determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. In order to analyize the reviews we need to filter our dataset as per following steps :

- Filter the data to retrieve all the rows where the total_votes count is equal to or greater than 20 to pick reviews that are more likely to be helpful and to avoid having division by zero errors later on. This is done by the following query :
  - select * from vine_table where total_votes>=20 : 
    - And 65379 rows affected.

- 
  
  


1.  How many Vine reviews and non-Vine reviews were there?

![image](https://user-images.githubusercontent.com/92283185/154822019-629fc371-c740-4d2d-bbd5-80f1fff889c3.png)



2.  How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?

![image](https://user-images.githubusercontent.com/92283185/154822054-995aa0d5-6d17-485c-bed4-df627b5e14fc.png)



3.  What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
![image](https://user-images.githubusercontent.com/92283185/154822138-fb787bed-5b16-4bd5-aa9c-6ba6f82c1232.png)



## Summary: In your summary, state if there is any positivity bias for reviews in the Vine program. Use the results of your analysis to support your statement. Then, provide one additional analysis that you could do with the dataset to support your statement.
