
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

library(ggplot2)

ny$month <- format(as.Date(ny$Start.Time, format="%Y-%m-%d"),"%m") ##creating new column in dataframe and extracting month from Start.Time

head(ny) ##confirming new column created and extracted month

qplot(x = month, data = ny, color = I('black'), fill = I('#F79420'), xlab = 'Month', ylab = 'Number of Rides') #plotting Month

table(ny$month) ##using table to get summary info

wash$month <- format(as.Date(wash$Start.Time, format="%Y-%m-%d"),"%m") #extracting month for wash dataframe

head(wash) #verifying extraction of month and new column

qplot(x = month, data = wash, color = I('black'), fill = I('#0B6623'), xlab = 'Month', ylab = 'Number of Rides') #plotting wash dataframe for month of start.time

qplot(x = month, data = subset(wash, !is.na(month)), color = I('black'), fill = I('#0B6623'), xlab = 'Month', ylab = 'Number of Rides') ##Removing NA column from above

table(wash$month)

chi$month <- format(as.Date(chi$Start.Time, format="%Y-%m-%d"),"%m") #extracting month for chi dataframe

head(chi) #verifying new column & month extracted for chi dataframe

qplot(x = month, data = chi, color = I('black'), fill = I('#D30000'), xlab = 'Month', ylab = 'Number of Rides') #plotting month of Start.Time for chi dataframe

table(chi$month)

table(ny$User.Type) ##Getting some info on the User.Type column, looks like we have some blanks

ny["User.Type"][ny["User.Type"] == ''] <- NA ##converting the blanks in the User.Type column to NA

table(ny$User.Type) #checking to see if conversion worked

ggplot(data=subset(ny, !is.na(User.Type)), aes(x=User.Type)) + 
geom_bar(color = 'black', fill = '#F79420')

table(wash$User.Type) ##Getting some info on the User.Type column

wash["User.Type"][wash["User.Type"] == ''] <- NA ##converting any blanks in the User.Type column to NA

table(wash$User.Type) #checking to see if conversion worked

ggplot(data=subset(wash, !is.na(User.Type)), aes(x=User.Type)) + 
geom_bar(color = 'black', fill = '#0B6623')

table(chi$User.Type) ##Getting some info on the User.Type column

chi["User.Type"][chi["User.Type"] == ''] <- NA ##converting the blanks in the User.Type column to NA

table(chi$User.Type) #checking to see if conversion worked

ggplot(data=subset(chi, !is.na(User.Type)), aes(x=User.Type)) + 
geom_bar(color = 'black', fill = '#D30000')

names(ny)

names(wash) ##showing NO 'Gender' column in wash dataset

names(chi)

by(ny$User.Type, ny$Gender, summary)

ny["Gender"][ny["Gender"] == ''] <- NA ##converting the blanks in the Gender column to NA

by(ny$User.Type, ny$Gender, summary)

ny <- na.omit(ny) ##Omit the NAs

by(ny$User.Type, ny$Gender, summary)

qplot(x = User.Type, data = ny, color = I('black'), fill = I('#F79420')) +
    facet_grid(Gender~.)

by(chi$User.Type, chi$Gender, summary)

chi["Gender"][chi["Gender"] == ''] <- NA ##converting the blanks in the Gender column to NA

by(chi$User.Type, chi$Gender, summary)

chi <- na.omit(chi) ##Omit the NAs

by(chi$User.Type, chi$Gender, summary)

qplot(x = User.Type, data = chi, color = I('black'), fill = I('#D30000')) +
    facet_grid(Gender~.)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
