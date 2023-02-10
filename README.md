# NASHVILLE-HOUSING-DATA-ANALYSIS-SQL-PROJECT
In this project, I worked with Nashville Housing dataset, a dataset containing statistics about land use and properties in Nashville, the capital city of the U.S. state of Tennessee.


I used SQL in Microsoft SQL Management Server Studio to explore and analyze data from this database while Power Bi was used for data visualization.

# DATA COLLECTION
The dataset was gotten from Github, initially posted on Kaggle.

# METADATA:

The dataset is composed of 20 columns and 56,477 rows.
UniqueID - id number attributed to a buyer.
ParcelID - code attributed to a land.
LandUse - shows the different uses of land.
SalesPrice - cost of land
LegalReference - citation is the practice of crediting and referring to authoritative documents and sources.
OwnerName_ name of land owner
Acreage - the size of an area of land in acres
LandValue - the worth of the land
Building Value - worth of a building
Total Value - landvalue + building value
YearBuilt - year the building was built
FullBath - a bathroom that includes a shower, a bathtub, a sink, and a toilet.
HalfBath - a half bathroom only contains a sink and a toilet
Sale_Date - date when the land was sold
SaleAddress - address of land sold
City - location of land
Owner_Address - owners house address
OwnerCity - city where owner lives
OwnerState - state where owner is located

# IMPORTING DATA
I created a database called Project, then imported the dataset which I named Housing in Microsoft SQL Management Server Studio.

# DATA CLEANING
Going through the dataset, I observed that the dataset needed cleaning.
The Date is not in the standard format.
Some rows in the PropertyAddress is NULL
The PropertyAddress has both the City and House Address in the same column.
The OwnerAddress has the state, city, and address on the same column.
Some roles in the SoldAsVacant has Y and N instead of Yes or No.
There are some duplicate rows that need to be removed.
Some Columns would not be useful for the analysis and therefore should be deleted.

