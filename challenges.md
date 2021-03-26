# Algothon 2021 challenges 

## Data Cleaning Challenge

It's Spring, it's time for a spring clean. This is a small challenge to warm you up to the event!​

You will receive a small timeseries dataset that has been corrupted in some form. Your job is to clean this dataset.
You will only receive the corrupted timeseries. You are evaluated on the MSE of your cleaned dataset and the uncorrupted data.

### Submission
Please submit your file in the format: "{your teamname here}_data_cleaning.csv".
Uncorrupt the 'data_clean.csv' file and submit the clean vision through the google form: https://forms.gle/7vojifiKqWniVH6C6

---

## Machine Learning Strategy Challenge

Aspect will provide a list of trades generated from a real production trading strategy, each trade has 3 fields: market / time-on / time-off (market is anonymised) and the pnl for each trade.

The challenge is to use all available market information prior to the trade to forecast the profitability of the trade.

### Universe:
Liquid futures on: stock indices, FX, FI, Commodities

### Each model should predict the return of each trade and return an action (-1,0,1)
- 1 means implement the trade
- 0 means do nothing
- -1 means implement the opposite of the trade

### Evaluation criteria
The portfolio returns are calculated as the sum of returns for each trade, according to the recommended actions by the model.

We will then score the model using the sharpe ratio of the daily returns over a test period of 2 years.

### Data sources
Any market data up to the point of trade execution. (For example, intraday price of a futures contract, different realized vol estimators, implied volatility, volume etc etc. We don't want to put any constraints here, so use whatever you think your machine learning model will perform best with - time to be creative!).

Train period: 2006-2015
Validation period: 2016-2017
Test period: 2018-2019

### Tips
- Avoid any look-ahead bias (don't use any data observed after the open-timestamp of the trade when predicting the action)
- Be imaginative with the data you use for forecasting. If you can't find any interesting forecasts from pure price data, try looking at volatility
- Make use of Python 3.7 + Tensorflow/Keras (if using neural networks) and include some instructions on how to run the model/reproduce results

### Submission
Please submit your files in the format: "{your teamname here}_validation_ml.csv" "{your teamname here}_test_ml.csv", both files must be submitted at the same time.
Submit your validation and test predictions here: https://forms.gle/YY3k9ucxSNXe1G7v7

---

## Prediction Challenge 

Encrypted data provided for US stocks. Stock ticker and time periods are anonymized.

Price features: Adjusted OHLC price, Volume

Options: Implied volatility for different expiry dates and delta, Put/Call Volume and Open Interest

Universe:
ETF for US equity, bonds and commodities. (column id in the training csv file)

### Goal 

Predict Next 20-days log-return (column target_20 in the training csv file)

Models can predict the direction of return and return an action (-1,0,1)

- 1 means the model will buy and hold the stock for the next 20 days
- 0 means the model will do nothing   
- -1 means the model will sell the stock and cover in 20 days

Models can also assign a weight between -1 to 1 as a portfolio holding instead. 

### Evaluation criteria:
The portfolio return is calculated as the sum of return for each asset  

We then score the model using the sharpe ratio of the daily returns over a test period of 2 years   

### Data sources:

WRDS data: US EOD price and US EOD options  

- Train period: 2006-2015
- Validation period: 2016-2017
- Test period: 2018-2019

Note: In the training data, some of the ETFs will have limited or no data in the train period because these ETFs are only launched after 2015. Consider how to use the features of other ETFs to learn patterns that can be generalised, or set the weights of these assets to be zero.


### Submission
In the example notebook, we provide two functions which allows you to generate predictions for the validation (Public Leaderboard) and test (Private Leaderboard) datasets. It will generate around 20k predictions each so it will takes time to run.
You should them submit the csv predictions with filename the format {your_team_name}_validation_prediction.csv and {your_team_name}_test_prediction.csv. Submit your validation and test predictions here: https://forms.gle/4RG8HNJ8CLaziuaTA

---

## ESG challenge 

Encrypted data provided for US stocks. Stock ticker and time periods are anonymized and shuffled.  

Stock features: percentage change (for different number of days),  float market capitalization (to allow for calculation of index weights)

ESG:  ESG features for each stock

S&P500: Target Daily Percentage Change

### Goal

Assign a weighting to the restricted universe of portfolio for every trading day (ESG grade above certain threshold)
The weights shall sum to 1, and the portfolio is long-only (i.e. each weight component is non-negative)

- Challenge: Restrict your portfolio to all three E, S, G Components with Score >45 

No positive weights should be assigned to stocks not fulfilling ESG Score, or stocks without an ESG score

### Evaluation criteria:

The portfolio tracking error is calculated as the standard deviation of the portfolio against S&P500 Benchmark

The model is scored using the tracking error over a test period of 2 year, points will be given in relative to submitted entries of other participants.


Factset data (price), Arabesque ESG Rating Data, S&P 500 Daily Change data

- Train period: 2011-2016
- Validation period: 2017-2018
- Test period: 2019-2020

### Submission
Please submit your files in the format: "{your teamname here}_validation_esg.csv" "{your teamname here}_test_esg.csv", both files must be submitted at the same time.
Submit the link to your application here through the google form: https://forms.gle/PSg54dMwZjia1HoYA

---

## Long-Short Sector Strategy Challenge

### Goal

Students are asked to choose develop a long-short strategy in one of the 3 sectors provided (tech=1, energy=2 and gold=3).

They must have a neutral position at all times, and their task is to provide a time series of weights of their long and short stocks. The weights can be any number between -1 and 1, with a negative number meaning a short position.

### Evaluation Criteria

The performance of the models will be assessed by calculating cumulative returns-0.5*max drawdown. This metric needs to be maximised.

### Data

The data provided contains 5 US stocks from the sector chosen. Several encrypted features are provided and the target are the forward 5-day log returns. 

### Submission
Please submit your files in the format: "{your teamname here}_validation_long_short.csv" "{your teamname here}_test_long_short.csv", both files must be submitted at the same time.
Submit the link to your application here through the google form: https://forms.gle/55XnqyN8DpHDcdBD6

---

## Data Visualisation Challenge

### Goal

Using the data from the data cleaning challenge, participants will build a dashboard to interpret the data. This will be in the form of a website hosted for free using Heroku. Apart from the visualisation tool itself, the analysis derived from the data should be meaningful.

### Evaluation criteria

A third of the weight will be given to each of the following:
- Functionality of the dashboard
- Inisights derived from the data
- UX (design and ease of use) of the dashboard

### Data
Clean data from the data cleaning data.

### Submission
Submit the link to your application here through the google form: https://forms.gle/upnzQnKjp4gqzU2EA

---

## Low Latency Challenge

### Goal
Latency is important.
Luckily, there are a vast number of algorithms for doing signal classification, from efficient signal processing to effective ML.
### Evaluation criteria
In the challenge, you are asked to predict whether a single ticker's price will go up or down in the next sample.

- Your classifier must achieve over 50% accuracy on unseen test data to be considered.
- Teams will be ranked based on the time take to classify.
- There is a timeout of 10 seconds. In that time you must be able to classify all the test data  each input, your solution should print to terminal either 1 or 0 for if it expects the signal to increase or decrease respectively.
- All submissions will be tested on Raspberry Pi, an ARM device running Raspbian OS and pre-installed with several tools. Pandas and SKLearn have also been installed.
- Your solution must be a program which can be run by calling ` make run` in the root directory of your repository.
- Your solution must take inputs through the terminal. The input will be several comma separated terms, the 500 previous log returns (you do not need to use all 500).
- For each input, your solution should print to terminal either 1 or 0 for if it expects the signal to increase or decrease respectively.
- NOTE: This challenge's deadline is at 14:00, one hour earlier than the other challenges.

### Data
Training data can be found at [here](https://drive.google.com/file/d/1l12tnmFx6giQBGDhzKXvysInX66ow6fW/view?usp=sharing).
### Submission
All submissions must have a public GitHub repository.
Your best solution should be stored on the master branch.
Before the end of the competition you must submit a link to your repository through the following [form](https://docs.google.com/forms/d/e/1FAIpQLScb5JWA0MCUxRbzzZA-00C1U8OzNTV9GJtqzfJXX_llDKxx3Q/viewform?usp=sf_link).
Please only make one submission per team.
### Examples
We have written a few toy example which should illustrate the format of your submission.

- A KNN classifier, implemented in Python with SKLearn, [here](https://github.com/ALGCDG/AlgothonKNN).
- Random Guesser, implemented in Python, [here](https://github.com/ALGCDG/randomguesser).
- Constant Guesser, implemented in C++, [here](https://github.com/ALGCDG/ConstantGuesser).
