/****** Script for SelectTopNRows command from SSMS  ******/

--Imported 56477 rows


--Started with data cleaning
SELECT * 
FROM Housing

--TOTAL NUMBER OF COLUMNS
SELECT count(*) AS NUMBEROFCOLUMNS FROM information_schema.columns
    WHERE table_name ='Housing'

--Standardize Date Format
SELECT SaleDate, CONVERT(Date, SaleDate) 
FROM Housing

--UPDATING THE HOUSING TABLE WITH THE NEW DATE FORMAT

ALTER TABLE Housing
Add Sale_Date Date

UPDATE Housing
SET Sale_Date = CONVERT(Date, SaleDate)

select SaleDate, Sale_Date 
FROM Housing

--DELETING THE SaleDate Column
ALTER TABLE Housing
DROP COLUMN SaleDate

--PROPERTY ADDRESS DATA
SELECT * 
FROM Housing
WHERE PropertyAddress is NULL
ORDER BY ParcelID
/* 29rows without a property address */

/* for ParcelID without propertyAddress, we check for ParceID that have the same ID with it 
and has address, use the address of the second ParceID to replace the null values */

SELECT a.parcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress) 
--When a.propertyaddress isnull, input b.propertyaddress
FROM Housing a
JOIN Housing b
ON a.ParcelID =b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

--UPDATING THE TABLE BY POPULATING THE PropertyAddress Column 

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM Housing a
JOIN Housing b
ON a.ParcelID =b.ParcelID
AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null
/* 29rows were updated */

--USING SUBSTRING TO SEPERATE THE THE PropertyAddress Column INTO CITY AND HOUSE ADDRESS
SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX( ',', PropertyAddress) -1) AS HouseAddress
, SUBSTRING(PropertyAddress, CHARINDEX( ',', PropertyAddress) +1, LEN(PropertyAddress)) AS City
FROM Housing

--UPDATING THE HOUSING TABLE
ALTER TABLE Housing
Add HouseAddress Varchar(255)

UPDATE Housing
SET HouseAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX( ',', PropertyAddress) -1)

/* adding the city column */
ALTER TABLE Housing
Add City Varchar(255)

UPDATE Housing
SET City = SUBSTRING(PropertyAddress, CHARINDEX( ',', PropertyAddress) +1, LEN(PropertyAddress))

--DELETING THE PropertyAddress Column
ALTER TABLE Housing
DROP COLUMN PropertyAddress


-------------------------------------------
--WORKING ON THE OWNER ADDRESS TO SEPERATE IT INTO OWNER ADDRESS, CITY, STATE
SELECT
PARSENAME(REPLACE(OwnerAddress,',', '.') , 3) AS OwnersAddress
,PARSENAME(REPLACE(OwnerAddress,',', '.') , 2) As OwnersCity
,PARSENAME(REPLACE(OwnerAddress,',', '.') , 1) As OwnersState
FROM Housing

--UPDATING THE TABLE BY SPLITING THE OwnerAddress INTO THREE COLUMNS OwnerAddress, OWnerCity, OwnerState
ALTER TABLE Housing
Add Owner_Address Varchar(255)

UPDATE Housing
SET Owner_Address = PARSENAME(REPLACE(OwnerAddress,',', '.') , 3)

/* adding the Ownercity column */
ALTER TABLE Housing
Add OwnerCity Varchar(255)

UPDATE Housing
SET OwnerCity = PARSENAME(REPLACE(OwnerAddress,',', '.') , 2)

/* adding the OwnerState column */
ALTER TABLE Housing
Add OwnerState Varchar(255)

UPDATE Housing
SET OwnerState = PARSENAME(REPLACE(OwnerAddress,',', '.') , 1)


-- CHANGING Y and N to Yes and No in SoldASVacant Column using the case statement
SELECT Distinct(SoldAsVacant), Count(SoldAsVacant)
FROM Housing
GROUP by SoldAsVacant
ORDER by 2
/* Y = 52, N = 399, Yes = 4623, No= 51403 */

SELECT SoldAsVacant
, CASE when SoldAsVacant = 'Y' THEN 'YES'
		WHEN SoldAsVacant = 'N' THEN 'NO'
		ELSE SoldAsVacant
		END
FROM Housing


-------------------------------------------------------------------------------------------
--REMOVE DUPLICATES
with RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
			PropertyAddress,
			SalePrice,
			SaleDate,
			LegalReference
			ORDER BY
				UniqueID
				) row_num
FROM Housing
)
DELETE 
FROM RowNumCTE
WHERE row_num > 1
/* 104 Duplicate rows removed */

-- CHECKING IF THERE ARE STILL DUPLICATES
with RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
			PropertyAddress,
			SalePrice,
			SaleDate,
			LegalReference
			ORDER BY
				UniqueID
				) row_num
FROM Housing
)
SELECT * 
FROM RowNumCTE
WHERE row_num > 1
/* There are no duplicates */

--------------------------------------------------------
--DELETING UNUSED COLUMNS
ALTER TABLE Housing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate


--TOTAL NUMBER OF COLUMNS
SELECT count(*) AS NUMBEROFCOLUMNS FROM information_schema.columns
    WHERE table_name ='Housing'
