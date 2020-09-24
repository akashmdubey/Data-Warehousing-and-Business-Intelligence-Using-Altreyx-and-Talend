
-- 1. Ranked order of Vendors by purchase amount -------------------------------------------------------------------------
select dv.VENDORNAME VENDOR, SUM(fp.LINETOTAL) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(fp.LINETOTAL) DESC) RANK  FROM DIMVENDORS dv join factpurchases fp on fp.VendorSK=dv.VendorSK GROUP BY dv.VENDORNAME


-- Ranked order of products purchased by amount $


-- 2.1 By category
select  dimprodpur.PRODUCTNAME ,dimprodpur.PRODUCTCATEGORYNAME, SUM(fp.LineTotal) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(fp.LineTotal) DESC) RANK
from dimproducts_purchased dimprodpur
join factpurchases fp on fp.PRODUCTPURCHASEDSK = dimprodpur.PRODUCTPURCHASEDSK
group by   dimprodpur.PRODUCTNAME ,dimprodpur.PRODUCTCATEGORYNAME

--  2.2 By subcategory

select  dimprodpur.PRODUCTNAME ,dimprodpur.PRODUCTCATEGORYNAME,dimprodpur.PRODUCTSUBCATEGORYNAME, SUM(fp.LineTotal) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(fp.LineTotal) DESC) RANK
from dimproducts_purchased dimprodpur
join factpurchases fp on fp.PRODUCTPURCHASEDSK = dimprodpur.PRODUCTPURCHASEDSK
group by   dimprodpur.PRODUCTNAME ,dimprodpur.PRODUCTCATEGORYNAME,dimprodpur.PRODUCTSUBCATEGORYNAME

-- 2.3 By product model (top 20)
select dimprodpur.MODELNAME, SUM(fp.LineTotal) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(fp.LineTotal) DESC) RANK
from dimproducts_purchased dimprodpur
join factpurchases fp on fp.PRODUCTPURCHASEDSK = dimprodpur.PRODUCTPURCHASEDSK WHERE ROWNUM<21
group by dimprodpur.MODELNAME ;

-- 2.4 By product (top 20)
select dimprodpur.PRODUCTNAME , SUM(fp.LineTotal) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(fp.LineTotal) DESC) RANK
from dimproducts_purchased dimprodpur
join factpurchases fp on fp.PRODUCTPURCHASEDSK = dimprodpur.PRODUCTPURCHASEDSK WHERE ROWNUM<21
group by  dimprodpur.PRODUCTNAME 


-- 3. RANK LIST OF EMPLOYEE PURCHASING PRODUCTS AMOUNT
select dimemploy.LASTNAME ||' '|| dimemploy.FIRSTNAME EMPLOYEENAME, SUM(dimprodpur.STANDARDCOST) PURCHASEAMOUNT, RANK() OVER(ORDER BY SUM(dimprodpur.STANDARDCOST) DESC) RANK
from dimemployee dimemploy
join factpurchases fp on fp.EMPLOYEESK = dimemploy.EMPLOYEESK
join DIMPRODUCTS_PURCHASED dimprodpur on fp.PRODUCTPURCHASEDSK = dimprodpur.PRODUCTPURCHASEDSK 
group by dimemploy.LASTNAME,dimemploy.FIRSTNAME


---- 4. List of employees who purchased products with phone email  and address 

select  dimemploy.LASTNAME ||' '|| dimemploy.FIRSTNAME EMPLOYEENAME, dimemploy.PHONE, dimemploy.EMAILADDRESS, dimemploy.ADDRESSLINE1 ||' '|| dimgeo.CITY||' ' || dimgeo.STATEPROVINCENAME || ' ' || dimgeo.COUNTRYREGIONCODE||' '|| dimgeo.POSTALCODE ADDRESS
from dimemployee dimemploy
join factpurchases fp on fp.EMPLOYEESK = dimemploy.EMPLOYEESK
join dimgeography dimgeo on dimemploy.GEOSK=dimgeo.GEOSK


---- 5. List of purchasing contacts with vendor name,  phone, email and address 

select dimvencon.LASTNAME ||' '|| dimvencon.FIRSTNAME PURCHASINGCONTACTS, dimven.VENDORNAME, dimvencon.PHONENUMBER, dimvencon.EMAILADDRESS, dimven.ADDRESSLINE1 ||' '|| dimgeo.CITY||' ' || dimgeo.STATEPROVINCENAME || ' ' || dimgeo.COUNTRYREGIONCODE||' '|| dimgeo.POSTALCODE ADDRESS
from factpurchases fp
left join dimvendors dimven on fp.VENDORSK = dimven.VENDORSK
inner join dimvendorcontacts dimvencon on dimvencon.VENDORSK=dimven.VENDORSK
inner join dimgeography dimgeo on dimven.GEOSK=dimgeo.GEOSK


