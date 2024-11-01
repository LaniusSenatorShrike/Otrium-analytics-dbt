# Otrium Recommender Feed

This is solution documentation on a given analytics test. 
This projects involves with 3 layers of data process.

1. base layer: this the data from source or raw data
2. staging layer: processed data with operations like dedup, ...
3. aggregate layer: final aggregated data exposed to users/services/platforms

This projects is executed locally using postgres.

## Installation steps:

`sudo apt-get install libpq-dev`

`python -m pip install dbt-postgres`

### Commands you may use
`dbt run --select items`

`dbt test -select stg_customers`

### Debug
use `dbt debug` if you face any problem(s) with the connection

use `dbt complie --select [model_name]` to check if there is any problem with your complied sql query


Some useful commands:
```commandline
sudo -u postgres psql # to connect with psql
```


## Follow-up Questions
- What additional data might be useful to help improve the recommender?
  - so far there is only views data, however, more reactions data like "click" and "comment" events can improve the performance
  


- What might the impact of bad data be on the final outcome?
  - Simply, garbage-in, garbage-out :) 


- What considerations might there need to be for the larger volumes of data in a production environment?
  - robust data cleaning and transformation process
  - logging system to monitor if there is any failure in tests


- How often would this data need to be processed?
  - It depends on the expected frequency for recommendations 


- How would you work with analysts + ML engineers to improve the process / outcomes?
  - Analysts:
    - define the success metrics and conduct A/B testing to assess the model performance
    - data perception
  - ML engineers: 
    - so far we're using an out-of-the-box model (AWS Personalize). We can train/tune our own model on AWS bedrock
    - model development and algorithm selection 