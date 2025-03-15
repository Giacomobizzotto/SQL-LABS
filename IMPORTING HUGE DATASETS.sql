

-- HOW TO IMPORT HUGE DATASETS IN SQL SERVER MANAGEMENT STUDIO

-- First you must create the table, In this case I want to import data about weather from 2010 to 2024.
-- I give to each column the same name they have in the database that I want to import for consistency, and I make sure that the type of variable I am assigning is correct.


CREATE TABLE Weather_Data (  
    Spec_Date DATETIME,     
    AWND VARCHAR(255),
    PRCP VARCHAR(255),
    SNOW VARCHAR(255),
    SNWD VARCHAR(255),
    TMAX VARCHAR(255),
    TMIN VARCHAR(255),
);



-- After executing this code, I import the dataset using the following command and making sure to set the right directory:


BULK INSERT Weather_Data  
FROM 'C:\Users\giaco\OneDrive\Desktop\UNH\COURSES\Database Management for Business Analytics\Project Group - Port Authority\DATABASES FOR THE PROJECT\CSV\Tbl_Weather.csv'  
WITH (  
    FIRSTROW = 1,          -- Start from the first row  
    FIELDTERMINATOR = ',', -- Define CSV delimiter  
    ROWTERMINATOR = '\n',  -- Line break  
    TABLOCK  
);



-- I can quickly check that everything worked out as expected using the following statement:

Select * From Weather_Data







