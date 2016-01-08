<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductCatalogue.aspx.cs" Inherits="FSI_ImageBank.ABC" EnableViewState="true" ViewStateMode="Enabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>Image Bank Of Firestar</title>
        <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
     <link rel="stylesheet" type="text/css" href="content/site.css"/>
        <script src="Scripts/jquery-1.7.1.js" type="text/javascript"></script>
        <script src="Scripts/Search.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="head">
              
        <div class="content-wrapper">
            <div class="col-md-7">
            <div class="float-left">
                <p class="site-title">         
                    <a href="#">
                     <img src="Images\firetstar.jpg" alt="" style="width: 200px;height: 110px;   margin-bottom: 5px;     margin-top: 15px;"/>
                     </a>
                </p>   
            </div>  </div>
               <div class="col-md-5" >
                 <div class="search-box" style="float:left; width:257px;">
                <div style="float: left; width: 70px; padding-top: 4px; font-weight: bold;"></div> 
                <div class="text-field-box" style="margin-top: 15px; margin-left: 260px; ">

                    <asp:TextBox ID="inputsearch" autocomplete="off" class="search-box-bg" placeholder="Search" style="padding-top: 10px;
    padding-bottom: 10px;    margin-left: -68px;     margin-top: 15px;" runat="server" ></asp:TextBox>
                    <asp:Button ID="BtnSearch" runat="server" Text="Search" style="    margin-left: -67px;
    border-radius: 5px;    color: #3C9691;
    font-weight: bold;" />
                    
                  <%-- <input name="" type="text"  id="input" autocomplete="off" class="search-box-bg" onclick="" placeholder="Search" style="padding-top: 10px;
    padding-bottom: 10px;    margin-left: -68px;"/>
                    <input type="submit" value="search" onclick="searchXML()" style="    margin-left: -67px;
    border-radius: 5px;    color: #3C9691;
    font-weight: bold;"/>--%>

                    
                    </div>
                

            
            </div>
            </div>
                
            </div>
   
        </div>
                           
    <div class="head1">
            <H3 class="heading">Image Bank of Firestar</H3>
            </div>
            <div class="main-content">
            <div id="Selections" style="color: #3C9691;  font-weight: bold;" >
            <div class="col-md-4" style="    margin-bottom: 10px;">
        <p> Category:
            <asp:DropDownList runat="server" ID="cmb_productcategory" OnSelectedIndexChanged="cmb_productcategory_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" style="padding-right: 90px;
"></asp:DropDownList>
        </p></div>
                <div class="col-md-4"  style="    margin-bottom: 10px;">
        <p>Sub Category:
            <asp:DropDownList runat="server" ID ="cmb_subcategory" OnSelectedIndexChanged="cmb_subcategory_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" ></asp:DropDownList>
        </p></div>
                <div class="col-md-4"  style="    margin-bottom: 10px;">
        <p>Collection:
            <asp:DropDownList runat="server" ID ="cmb_collection" OnSelectedIndexChanged="cmb_collection_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" style="padding-right: 60px;"></asp:DropDownList>
        </p>
                    </div>
                 <div class="col-md-4"  style="    margin-bottom: 10px;">
        <p>Setting:
            <asp:DropDownList runat="server" ID ="cmb_setting" OnSelectedIndexChanged="cmb_setting_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" style="padding-right: 71px;"></asp:DropDownList>
        </p></div>
                 <div class="col-md-4"  style="    margin-bottom: 10px;">
        <p>Diamond Weight Range:
            <asp:DropDownList runat="server" ID ="cmb_diaweightrange" OnSelectedIndexChanged="cmb_diaweightrange_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" ></asp:DropDownList>
        </p></div>
                 <div class="col-md-4"  style="    margin-bottom: 10px;">
        <p>Center Shape:
            <asp:DropDownList runat="server" ID ="cmb_centershape" OnSelectedIndexChanged ="cmb_centershape_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" style="padding-right: 122px;"></asp:DropDownList>
        </p></div>
                 <div class="col-md-6"  style="    margin-bottom: 10px;">
        <p>Center Stone Weight Range:
            <asp:DropDownList runat="server" ID ="cmb_centerstweightrange" OnSelectedIndexChanged="cmb_centerstweightrange_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true" style="padding-right: 122px;"></asp:DropDownList>
        </p></div>
                 <div class="col-md-6"  style="    margin-bottom: 10px;">
        <asp:Button ID="btnreset" runat="server" Text="Reset Filters" OnClick="btnreset_Click" class="reset" />
</div>
    </div>
                
    <div id ="Catalogue" >
       
        <asp:GridView runat="server" ID="ProductCatalogue" AllowPaging="true" OnPageIndexChanging="ProductCatalogue_PageIndexChanging" PageSize="20" BackColor="White" CellPadding="15" CellSpacing="3" AutoGenerateColumns="False" CssClass="myGridStyle">

            <Columns >
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image runat="server" ID= "StyleImage" Width="150px" Height="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Style_No" HeaderText="Style No" />
                <asp:BoundField DataField="Product_Category" HeaderText="Product Category" />
                <asp:BoundField DataField="Sub_Category" HeaderText="Sub Category" />
                <asp:BoundField DataField="CenterStone_Weight" HeaderText="CenterStone Weight" />
                <asp:BoundField DataField="Total_Weight" HeaderText="Total Weight" />
                <asp:ButtonField HeaderText="Add To Selection" Text="Add" ItemStyle-HorizontalAlign="Center" ButtonType="Image" ImageUrl="~/Uploaded Images/ADD.jpg" ControlStyle-Width="30px"  ControlStyle-height="30px" >
                <ControlStyle Width="30px" ></ControlStyle>
                     <ControlStyle height="30px" ></ControlStyle>

                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                  
                </asp:ButtonField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066"  />
            <HeaderStyle BackColor="#3C9691" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#3C9691" HorizontalAlign="Left" Font-Bold="true" />
            <RowStyle Width="100px" Height="40px" ForeColor="#3C9691" Font-Bold="true" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

    </div></div>
        
            </div>
         <div class="container-fluid">
            <div class="Row">
                <div class="footer-distributed">
                    
                    
                            <div class="footer-center">

			
                                	<div>

                    <h2 class="text-center" style="margin-top: -4px;" 

></h2>
                    <div style="margin: 15px 0px 0px; display: inline; 

text-align: right; width: 96px;">
<div style=" margin: 0px 0px 5px;  text-align: left; 

 height: 23px;">
    <img 

src="http://localtimes.info/images/countries/be.pn

g"="" border=0="" 

style="border:0;margin:0;padding:2px"="; margin-left=50px"> 
    <p class="conname" style="margin-right: 53px;"> Antwerp   </p>
    
    

    <div style="width:60px; display:inline; padding-

left:35px;">
<script type="text/javascript" 

src="http://localtimes.info/clock.php?

continent=Europe&country=Belgium&city=Antwerp&cp1_

Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=96&h

am=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&wid

get_number=1000"></script></div></div>
</div>
                    
                    
                    
					  <div 

style="margin: 15px 0px 0px; display: inline; 

text-align: ; width: 96px;">
 
<div style="margin: 15px 0px 0px; display: inline; text-align: ; width: 96px;">

 <div style=" margin: 0px 0px 5px; text-align: left; height: 23px;"><img src="http://localtimes.info/images/countries/ae.png"="" border=0="" style="border:0;margin:0;margin-top:3px;padding:2px"=" ; margin-left=50px; "> <p class="conname" style="margin-right: 30px;">Dubai </p>
 <div style="width:60px; display:inline; padding-left:38px;"> 
 <script type="text/javascript" src="http://localtimes.info/clock.php?continent=Asia&country=United Arab Emirates&city=Dubai&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=96&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&widget_number=1000"></script></div></div>
 </div>
 </div>

<div style="margin: 15px 0px 0px; display: inline; 

text-align: right; width: 96px;">
<div style=" margin: 0px 0px 5px;  text-align: left; 

 height: 23px;"><img 

src="http://localtimes.info/images/countries/hk.pn

g"="" border=0="" 

style="border:0;margin:0;padding:2px"=" ; margin-left=50px"> 
    
    
    <p class="conname" style="margin-right: 33px;">  Hong 

Kong </p>
    
    
  
<div style="width:60px; display:inline;">
<script type="text/javascript" 

src="http://localtimes.info/clock.php?

continent=Asia&country=Hong Kong&city=Hong 

Kong&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&

fwdt=96&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&

sep=0&widget_number=1000"></script></div></div>
</div>
                    
                    
                    <div style="margin: 15px 0px 0px; display: inline; text-align: center; width: 96px;">
<div style=" margin: 0px 0px 0px;  text-align: left;  height: 28px;"><img src="http://localtimes.info/images/countries/za.png"="" border=0="" style="border:0;margin:0;padding:2px"=" ; margin-left=50px"> 
    
    <p class="conname" style="margin-right: 16px;">  Johannesburg     </p>
    <div style="width:60px; display:inline; padding-

left:38px;">
        <script type="text/javascript" src="http://localtimes.info/clock.php?continent=Africa&country=South Africa&city=Johannesburg&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=96&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&widget_number=1000"></script></div></div>
</div>
                    


<div style="margin: 15px 0px 0px; display: inline; 

text-align: right; width: 96px;">
    
    
    
    
    
                        
                    
                    <div style="margin: 15px 0px 0px; display: inline; text-align: center; width: 96px;">
<div style=" margin: 0px 0px 5px;  text-align: left; height: 23px;"><img src="http://localtimes.info/images/countries/in.png"="" border=0="" style="border:0;margin:0;padding:2px"="; margin-left=50px"> 
        <p class="conname" style="margin-right: 55px;">  Mumbai    </p>
   
    <div style="width:60px; display:inline; padding-

left:35px;">
<script type="text/javascript" src="http://localtimes.info/clock.php?continent=Asia&country=India&city=Mumbai&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=96&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&widget_number=1000"></script></div></div>
                                  
                    
<div style=" margin: 0px 0px 5px;  text-align: left; 

 height: 23px;"><img 

src="http://localtimes.info/images/countries/us.pn

g"="" border=0="" 

style="border:0;margin:0;padding:2px"=" ; margin-left=50px"> 
    
    
    <p class="conname" style="margin-right: 45px;">  New York  </p>
    
    
   
<div style="width:60px; display:inline; padding-

left:30px;">
<script type="text/javascript" 

src="http://localtimes.info/clock.php?

continent=North America&country=United 

States&province=New York&city=New York Central 

Park&cp1_Hex=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&

fwdt=96&ham=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&

sep=0&widget_number=1000"></script></div></div>
</div>




<div style="margin: 15px 0px 0px; display: inline; 

text-align: right; width: 96px;">
<div style=" margin: 0px 0px 5px;  text-align: left; 

 height: 23px;"><img 

src="http://localtimes.info/images/countries/am.pn

g"="" border=0="" 

style="border:0;margin:0;padding:2px"="; margin-left=50px"> 
      <p class="conname" style="margin-right: 55px;">  Yerevan    </p>
    
  
<div style="width:60px; display:inline; padding-

left:38px;">
<script type="text/javascript" 

src="http://localtimes.info/clock.php?

continent=Asia&country=Armenia&city=Yerevan&cp1_He

x=000000&cp2_Hex=FFFFFF&cp3_Hex=000000&fwdt=96&ham

=0&hbg=0&hfg=0&sid=0&mon=0&wek=0&wkf=0&sep=0&widge

t_number=1000"></script></div></div>
</div>

                  
                    
</div>
                    
                    

			</div>
                    
                    
            </div> 
                    
                    
                    
                    
                    
                    <div class="footer-left" style="font-size: small;">


				<p class="footer-links">
                   
 <div class="col-md-3">
                   
                    <h2 class="font" style="margin-top:0px">Work Links</H2>
					<br>
				

                <ul class="ulclass">
  
                  <li>   <a href="https://webmail.firestonediamond.com/owa" style="color:white">Outlook</a></li>
                
  
                   <li> <a href="http://192.168.168.114/Citrix/MetaFrame/default/default.aspx" style="color:white">Citrix</a></li> 
                
 
                  <li> <a href="http://www.gmail.com" style="color:white">Gmail</a></li>  
                
</ul>
                
				
			</div>
                </div>   
                    
                    
                    
                    
                    
                    
                    
                    
                    <div class="footer-center" style="font-size: small;">

				<div>
					<h2 class="font " >Support</H2>
                    <br>
					
				
                 
                <ul class="ulclass">
  
                  <li> <a href="http://fsintranet/intranet/Site/view.cfm?pageID=2000095" style="color:white">Admin</a></li>   
                
  
                  <li>   <a href="http://fsintranet/intranet/Site/view.cfm?pageID=2000079" style="color:white">HR</a></li>
                
 
                 <li>     <a href="http://fsintranet/intranet/Site/view.cfm?pageID=2000045" style="color:white">IT</a></li>
                
  
                <li>      <a href="http://fsintranet/intranet/Site/view.cfm?pageID=2000097" style="color:white">SAP</a> </li>
                
 
                <li>   <a href="http://fsintranet/intranet/Forum/view.cfm?appID=16" style="color:white">Discussion Blog</a></li>  
                                
</ul>
				</div>

			</div>
                    
                    
                 
                    
                    
                    
        
        

			<div class="footer-right">

				<p class="footer-

company-about">
					
<h2 class="font ">About The Compnay </H2><br>
<span class="fire">Firestar Diamond’s operations span the globe – the USA, Europe, the Middle East, the Far East and India. 
<br>    A team of over 1200 highly trained professionals operating in state-of-the-art infrastructure.
   
        </span>
					
				</p>
             
				<div 

class="footer-icons" style="    margin-left: 55px;     margin-top: 25px;">

					 <a href="http://www.ajaffe.com/">
  <img src="Images/1.PNG" alt="ajafee" style="    width: 65px;
    height: px;border:0 ; MARGIN: -6px 15px 0px 0px;">
</a> 
                    <a href="http://www.firestardiamond.com/">
  <img src="Images/2.png" alt="" style="width: 45px;
    height: 26px;border:0;MARGIN: -6px 15px 0px 0px;">
</a> 

                    <a href="http://www.niravmodi.com/">
  <img src="Images/3.png" alt="" style="    width: 39px;
    height: 35px;
    border: 0;
    MARGIN: -23px 15px -14px 0px;">
</a> 

                    
                    

				</div>

			</div>

                    
                    
                 </div>
                </div>
              
                    
                    
               
        </div>
		
    </footer>
		


        



    </div>
    </form>
</body>
</html>
