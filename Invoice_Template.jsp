htmlpage Invoice_Template(inv_no)
displayname = "Invoice Template"
content
<%{

inv_no_int = inv_no.toLong();
inv_obj = Invoice_Form [ID == inv_no_int];

%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Work+Sans:700" rel="stylesheet">
<div class="container mr-auto ml-auto p-2 mt-2">
	<nav class="hidden-print">
		<div class="d-flex justify-content-end">
			<div class="mr-auto p-2">
				<h1>
					Invoice Details
				</h1>
				<span class="well">
					This invoice was created on <%=inv_obj.Added_Time%> <!-- Mar 20, 2017 at 8:03 AM PDT -->
				</span>
			</div>
			<div class="p-2">
				<a target="_blank" href="<%=zoho.appuri%>print/Invoice_Template" class="btn btn-sm btn-success">Print/Pdf</a>
			</div>
		</div>
	</nav>
	<div class="d-flex justify-content-end">
		<div class="mr-auto">
			<div class="businessLogo">
				<img border="0" alt="" src="http://www.aorborc.com/media/themes/impulso/img/logo.png">
			</div>
			<div class="d-flex flex-column">
				<div class="p-2">
					<h6>
						AORBORC TECHNOLOGIES PRIVATE LIMITED
					</h6>
				</div>
				<div class="p-2">
					Ruban Kannan
				</div>
				<div class="p-2">
					<address>
						G1, Block 5
						Chennai, Tamil Nadu 600001
						India
					</address>
				</div>
				<div class="p-2">
					Phone: +91 9841111111<br>accounts@aorborc.com<br>www.aorborc.com<br>
				</div>
			</div>
		</div>
		<div class="d-flex flex-column">
			<div class="d-flex flex-column">
				<div class="p-2">
					<h6>
						INVOICE
					</h6>
				</div>
				<div class="p-2">
					Paid
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						Invoice #:
					</div>
					<div class="p-2">
						<%=inv_obj.Invoice_Number %>
					</div>
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						Invoice date:
					</div>
					<div class="p-2">
						<%=inv_obj.Added_Time%>
					</div>
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						Reference:
					</div>
					<div class="p-2">
						PO1003170001
					</div>
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						Due date:
					</div>
					<div class="p-2">
						<%=inv_obj.Added_Time.addMonth(1)%>
					</div>
				</div>
				<div class="d-flex flex-row">
					<div class="p-2">
						Amount due:
					</div>
					<div class="p-2">
						$ <%=inv_obj.Total%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex">
		<div class="mr-auto p-2">
			<div>
				Attn:
			</div>
			<div class="d-flex flex-column">
				<div class="p-2">
					<h6>
						DORERF CONSTRUCTIONS LLC
					</h6>
				</div>
				<div class="p-2">
					<%=inv_obj.Customer_Name %> 
				</div>
				<div class="p-2">
					<address>
						G1, Block 5
						New york, NY, 10001
						USA
					</address>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex flex-column">
		<div class="d-flex flex-row mb-1 line-2">
			<div class="mr-auto p2 t-header col-3">
				<span>
					Item
				</span>
			</div>
			<div class="mr-auto p2 t-header col-3">
				<span>
					Description
				</span>
			</div>
			<div class="mr-auto p2 t-header col-2">
				<span>
					Qty
				</span>
			</div>
			<div class="mr-auto p2 t-header col-2">
				<span>
					Price
				</span>
			</div>
			<div class="mr-auto p2 t-header col-2">
				<span>
					Total
				</span>
			</div>
		</div>
		<%
		//for each records task
		for each invoice_lines_obj in Invoice_Lines [Invoice_Link_2 == inv_no_int]
		{%>
			<div class="d-flex flex-row">
				<div class="mr-auto p2 t-body col-3">
					<span>
						<%=invoice_lines_obj.Item_Name %>
					</span>
				</div>
				<div class="mr-auto p2 t-body col-3">
					<span>
						<%=invoice_lines_obj.Description %>
					</span>
				</div>
				<div class="mr-auto p2 t-body col-2">
					<span>
						<%=invoice_lines_obj.Qty %>
					</span>
				</div>
				<div class="mr-auto p2 t-body col-2">
					<span>
						$ <%=invoice_lines_obj.Price %>
					</span>
				</div>
				<div class="mr-auto p2 t-body col-2">
					<span>
						$ <%=invoice_lines_obj.Total %>
					</span>
				</div>
			</div>
		<%}%>
		<div class="d-flex flex-row mr-0 pr-0 mt-1 total-wrapper">
			<div class="col-6">
			</div>
			<div class="col-6 d-flex flex-row mr-0 pr-0">
				<div class="t-header col-6">
					<span>
						Vat (15%)
					</span>
				</div>
				<div class="t-body col-6">
					<span>
						$ <%=(inv_obj.Total * 0.15).round(2)%>
					</span>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row mr-0 pr-0 mt-1 total-wrapper">
			<div class="col-6">
			</div>
			<div class="col-6 d-flex flex-row mr-0 pr-0">
				<div class="t-header col-6">
					<span>
						Shipping charges
					</span>
				</div>
				<div class="t-body col-6">
					<span>
						$ 100.00
					</span>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row mr-0 pr-0 mt-1 total-wrapper">
			<div class="col-6">
			</div>
			<div class="col-6 d-flex flex-row mr-0 pr-0">
				<div class="t-header col-6">
					<span>
						Discount (5%)
					</span>
				</div>
				<div class="t-body col-6">
					<span>
						$ <%=(inv_obj.Total * 0.05).round(2)%>
					</span>
				</div>
			</div>
		</div>
		<div class="d-flex flex-row mr-0 pr-0 mt-1 total-wrapper">
			<div class="col-6">
			</div>
			<div class="col-6 d-flex flex-row mr-0 pr-0">
				<div class="t-header col-6">
					<span>
						Total
					</span>
				</div>
				<div class="t-body col-6">
					<span>
						$ <%= 100 + inv_obj.Total + (inv_obj.Total * 0.15).round(2) - (inv_obj.Total * 0.05).round(2)%>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<style type="text/css">
	.btn{
		text-shadow: none;
	}
	.container *{
		font-family: 'Work Sans', sans-serif;
		max-width: 1080px !important;
	}
	.line-2{
		line-height: 2;
	}
	.t-header{
		background-color: #bdc3c7;
		color: white;
		font-weight: 300;
	}
	.t-body{
		background-color: #ecf0f1;
	}
	.total-wrapper .t-body{
		text-align: right;
	}
</style>
<%}%>