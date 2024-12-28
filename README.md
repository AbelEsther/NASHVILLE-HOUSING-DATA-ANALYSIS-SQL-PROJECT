# NASHVILLE-HOUSING-DATA-ANALYSIS-SQL-PROJECT
In this project, I worked with Nashville Housing dataset, a dataset containing statistics about land use and properties in Nashville, the capital city of the U.S. state of Tennessee.

![image_alt](https://github.com/AbelEsther/NASHVILLE-HOUSING-DATA-ANALYSIS-SQL-PROJECT/blob/92085c71bac822f5e32b619884e593109dcac72e/nashville.webp)

I used SQL in Microsoft SQL Management Server Studio to explore and analyze data from this database while PowerBi was used for data visualization.

## Data Source
The dataset was gotten from Github, initially posted on Kaggle.

## Metadata:
**Dataset description**

- **UniqueID** - ID number attributed to a buyer.
- **ParcelID** - code attributed to a land.
- **LandUse** - shows the different uses of land.
- **SalesPrice** - cost of land.
- **LegalReference** - citation is the practice of crediting and referring to authoritative documents and sources.
- **OwnerName** - name of land owner.
- **Acreage** - the size of an area of land in acres.
- **LandValue** - the worth of the land.
- **Building Value** - worth of a building.
- **Total Value** - land value + building value.
- **YearBuilt** - Year the building was built.
- **FullBath** - a bathroom that includes a shower, a bathtub, a sink, and a toilet.
- **HalfBath** - a half bathroom only contains a sink and a toilet.
- **Sale_Date** - date when the land was sold.
- **SaleAddress** - address of land sold.
- **City** - location of land.
- **Owner_Address** - owner's house address.
- **OwnerCity** - Current city where owner lives.
- **OwnerState** - The state where owner is located.

## Importing Data
I created a database called Project, then imported the dataset which I named Housing in Microsoft SQL Management Server Studio.

## Data Cleaning
- **The Date** is not in the standard format.
- **PropertyAddress** contains NULL values in some rows.
- **PropertyAddress** has both the City and House Address in the same column.
- **OwnerAddress** has the state, city, and address in the same column.
- **SoldAsVacant** uses 'Y' and 'N' instead of 'Yes' or 'No'.
- There are duplicate rows that need to be removed.
- Some columns are not useful for the analysis and should be deleted.

After carrying out the data cleaning, I was left with 56,373 rows and 21 columns. I exported the data as an excel file and imported into #PowerBi for further analysis and visualization.
