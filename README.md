# InventoryControl


<p  align="center">
<a align="center" href="#" >
<img src="https://user-images.githubusercontent.com/79149971/177042816-a589da22-ec0b-4f1d-ba0d-d3b518e02f38.jpg"/>
</a></p>

[![license](https://img.shields.io/static/v1?label=license&message=MIT&color=red)](https://github.com/Fazzioni/InventoryControl/blob/main/LICENSE)
[![delphi7](https://img.shields.io/static/v1?label=Delphi&message=7&color=success)](https://www.embarcadero.com/br/products/delphi)
[![access](https://img.shields.io/static/v1?label=Microsoft&message=access&color=red)](https://www.microsoft.com/pt-br/microsoft-365/access)
[![connect](https://img.shields.io/static/v1?label=packpage&message=connect&color=red)](https://github.com/Fazzioni/InventoryControl/tree/main/Connect)


This project was written in 2015 when I was discovering what I could create with my skills. Today, with a more mature look, I can cite some necessary changes:
- :negative_squared_cross_mark: store the password hash with a dynamic SALT
- :negative_squared_cross_mark: adjust tabs and comments
- :negative_squared_cross_mark: database indexing and triggers
- :negative_squared_cross_mark: designers implementation
- :negative_squared_cross_mark: fix date compatibility
- :negative_squared_cross_mark: Create the integration with <a href="https://projetoacbr.com.br/sobre/"> Automação Comercial Brasil (ACBr) </a>
- etc


but I can say it was fun!


# <p align="center"><a href="https://github.com/Fazzioni/InventoryControl/tree/main/OutInput">Lets go!</a></p>
  - The supervisor's initial password is: fazzioni

# 📦 Modules
<p  align="center">
<a align="center" href="#" >
<img src="https://user-images.githubusercontent.com/79149971/177063015-741ea509-0b7c-4535-8078-763ea7e16781.jpg"/>
</a></p>

  - :man: Customers
  - :man_with_gua_pi_mao: Employees
  - :bookmark: Products
  - :heavy_dollar_sign: Sales  
  - :moneybag: Invoice
  - :clock1: Schedule
  - :wrench: Settings
  - :book: Audit



# :book: Database
  - Using <a href="https://docs.microsoft.com/pt-br/sql/ado/reference/ado-api/connection-object-ado?view=sql-server-ver16">Object Connection (ADO)</a>
  - <a href="https://github.com/Fazzioni/InventoryControl/tree/main/Connect">There is a secondary project just to configure the connection</a>
  - :page_with_curl: <a href="https://github.com/Fazzioni/InventoryControl/blob/main/OutInput/dados.mdb" > Go to database</a>
  - dependencies between tables:
  ![relacoes](https://user-images.githubusercontent.com/79149971/177060522-65abbc6c-1773-4e8e-b6d8-add604585aa3.jpg)
  
  
  

  
# :bar_chart: Report Example
![DAV1-1](https://user-images.githubusercontent.com/79149971/177064227-d7eec964-a722-47f3-b6dc-388c3db2682d.jpg)




# :rocket: Magic trip

https://user-images.githubusercontent.com/79149971/177040696-7605e801-250b-4a16-af89-0ea668fbce67.mp4




# Dependencies
  - <a href="https://www.digital-metaphors.com/">ReportBuilder</a>
  - <a href="https://github.com/Fazzioni/InventoryControl/tree/main/Db%20grid">ThemeDBGrid</a>
  - <a href="http://www.micrel.cz/RxLib/dfiles.htm">RX Library 2.75</a>
