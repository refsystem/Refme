<%@include file="../DBConnection/DbConnection.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
String course="",department="",semester="";
if(request.getParameter("sub")!=null){
	 course=request.getParameter("cr");
	 department=request.getParameter("dep");
	 semester=request.getParameter("sem");
	 response.sendRedirect("subject.jsp?c="+course+"&d="+department+"&s="+semester);
}

if(request.getParameter("sid")!=null){
	String sid=request.getParameter("sid");
	String del="delete from subject_data where sid='"+sid+"'";
	statement.executeUpdate(del);
	 response.sendRedirect("subject.jsp");
}

%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><%=title %></title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/bootstrap.css" />
		<link rel="stylesheet" href="../admin_tmplate/assets/css/font-awesome.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../admin_tmplate/assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../admin_tmplate/assets/css/ace-ie.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="../admin_tmplate/assets/js/ace-extra.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="../admin_tmplate/assets/js/html5shiv.js"></script>
		<script src="../admin_tmplate/assets/js/respond.js"></script>
		<![endif]-->
		
			<script type="text/javascript" src="jquery-1.7.1.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			//alert("server ready");
			$("#cid").change(function(){
				$("#did").html("<option>Select Any One<option>");
				var course=$("#cid").val();
			//	alert("course "+course);
				var dt="";
				$.getJSON("jsonDept.jsp?crs="+course,function(ja){
					for(var i=0;i<ja.length;i++){
						dt=ja[i].kdept;
						$("#did").append("<option>"+dt+"<option>");
					}
				})
			});
		});
		</script>
	</head>

	<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-university"></i>
							<%=hd %>
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.jsp">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> Dashboard </span>
						</a>

						<b class="arrow"></b>
					</li>	
					
					
					                 <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon glyphicon glyphicon-star"></i>
							<span class="menu-text">
								Acheivements
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
                                                     
                                <li class="">
								<a href="ach_fac.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Faculty
								</a>

								<b class="arrow"></b>
							</li> 
							<li class="">
								<a href="ach_stu.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Students
								</a>

								<b class="arrow"></b>
							</li>                    
							
                                                </ul>
					</li> 
								
                              
					<li class="">
						<a href="department.jsp">
							<i class="menu-icon fa fa-graduation-cap"></i>
							<span class="menu-text">Department</span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                        <li class="">
						<a href="faculty.jsp">
							<i class="menu-icon fa fa-user"></i>
							<span class="menu-text">Add Faculty</span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                        <li class="">
						<a href="upsem.jsp">
							<i class="menu-icon fa fa-users"></i>
							<span class="menu-text">Update Semester</span>
						</a>

						<b class="arrow"></b>
                                        </li>     
                                  
                                             
                                        <li class="">
						<a href="subject.jsp">
							<i class="menu-icon fa fa-plus"></i>
							<span class="menu-text">Add Subject</span>
						</a>

						<b class="arrow"></b>
                                        </li>   
                                                                                                 
					 <li class="">
						<a href="status.jsp">
							<i class="menu-icon glyphicon glyphicon-certificate"></i>
							<span class="menu-text">Student Status</span>
						</a>

						<b class="arrow"></b>
                                        </li>   
                                        <li class="">
                                            <a href="../logout.jsp">
							<i class="menu-icon fa fa-sign-out"></i>
							<span class="menu-text">Logout </span>
						</a>

						<b class="arrow"></b>
					</li>
                                    </ul><!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">ADMINISTRATOR</li>
						</ul><!-- /.breadcrumb -->

						
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<!-- #section:settings.box -->
						<!-- /.ace-settings-container -->

						<!-- /section:settings.box -->
						<div class="page-header">
							<h1>
								Dashboard
								
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="col-lg-6">
                                                         
                                                                <%
                                                                try{
                                                                String dpid="";
                                                                if(request.getParameter("c")!=null){

																	String cid=request.getParameter("c");
																	 dpid=request.getParameter("d");
																	String sid=request.getParameter("s");
																	String courseName=cid,did="";
																	
																	String selCr="select * from crs_info where crsid='"+cid+"'";
																	ResultSet rsSel=statement.executeQuery(selCr);
																	if(rsSel.next()){
																		courseName=rsSel.getString("crs_nme");
																	}
																	
																	
                                                                %>
                                                            <form method="get" action="subjectAction.jsp">
                                                                <table class="table table-bordered table-condensed table-condensed">
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <a href="subject.jsp" class="label label-warning pull-right">BACK</a>
                                                                <center><b>ADD SUBJECT</b></center>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Course</td>
                                                                    <td><input type="text" name="cr" class="form-control" value="<%=courseName %>" readonly="readonly"/></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Department</td>
                                                                    <td><input type="text" name="dp" class="form-control" value="<%=dpid %>" readonly="readonly"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Semester</td>
                                                                    <td><input type="text" name="sm" class="form-control" value="<%=sid %>" readonly="readonly"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Subject Name</td>
                                                                    <td><input type="text" name="sn" class="form-control" /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Subject Code</td>
                                                                    <td><input type="text" name="sc" class="form-control" /></td>
                                                                </tr>
                                                               
                                                                <tr>
                                                                    <td colspan="2"><center>
                                                                        <input type="submit" name="sub1" value="ADD SUBJECT NOW" class="btn btn-sm btn-danger" />
                                                                </center></td>
                                                                </tr>
                                                            </table>
                                                            </form>
                                                                                                                      
                                                            <%
                                                            }
                                                                else{
                                                                	
                                                            %>
                                                            <form method="post">
                                                             
                                                            <table class="table table-bordered table-condensed table-responsive table-striped">
                                                                <tr>
                                                                    <td colspan="2">
                                                                <center><b>CHOOSE DEPARTMENT TO ADD SUBJECT</b></center>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Course</td>
                                                                    <td>
                                                                        <select name="cr" class="form-control" id="cid">
                                                                            <option value="">Choose</option>
                                                                          
                                                                                    <%
                                                                                    	String selCrs="select * from crs_info";
                                                                                    ResultSet rs1=statement.executeQuery(selCrs);
                                                                                    while(rs1.next()){
                                                                                    %>
                                                                            <option value="<%=rs1.getString("crsid")%>"><%=rs1.getString("crs_nme")%></option>
                                                                          
                                                                            <%
                                                                            }
                                                                            %>
                                                                        </select>
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Department</td>
                                                                    <td>
                                                                        <div id="dep1">
                                                                            <select name="dep" class="form-control" id="did">
                                                                            <option value="">Choose</option>
                                                                            </select>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Semester</td>
                                                                    <td><select name="sem" id="sem" class="form-control" required="required">
                                                                            <option value="">Choose</option>
                                                                            <option>Semester 1</option>                            
                                                                            <option>Semester 2</option>
                                                                            <option>Semester 3</option>
                                                                            <option>Semester 4</option>
                                                                            <option>Semester 5</option>
                                                                            <option>Semester 6</option>
                                                                            <option>Semester 7</option>
                                                                            <option>Semester 8</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2"><center><input type="submit" name="sub" value="ADD SUBJECT" class="btn btn-sm btn-danger" /></center></td>
                                                                </tr>
                                                            </table>
                                                            </form>
                                                          
                                                            <%
                                                              }
                                                            %>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div id="syl1">                                                                                                                         
                                                                <%
                                                                int i=0;
                                                                if(request.getParameter("c")!=null){
                                                                	String c=request.getParameter("c");
                                                                	String d=request.getParameter("d");
                                                                	String s=request.getParameter("s");
                                                                	System.out.println("  after response selecte syllabus data "+c+"  "+d+"  "+s);
                                                                    String selSyllabus="select * from subject_data where course=(select crs_nme from crs_info where crsid='"+c+"') and sem='"+s+"' and dept='"+d+"'";
                                                                	ResultSet rsselSyllabus=statement.executeQuery(selSyllabus);
                                                                	
                                                                %>
                                                            <table class="table table-bordered table-condensed table-hover table-striped">
                                                                <tr>
                                                                    <td>#</td>
                                                                    <td>Subject Name</td>
                                                                    <td>Subject Code</td>                                                                    
                                                                    <td></td>
                                                                </tr>
                                                           
                                                                    <%
                                                                   
                                                                    while(rsselSyllabus.next()){
	                                                                    i++;	                                                                 
                                                                    %>
                                                                <tr>
                                                                    <td><%=i %></td>
                                                                    <td><%=rsselSyllabus.getString("sub_name") %></td>
                                                                    <td><%=rsselSyllabus.getString("sub_code") %></td>                                                                    
                                                                <td><a href="subject.jsp?sid=<%=rsselSyllabus.getString("sid") %>"><span class="fa fa-trash" style="color: red;"></span></a></td> 
                                                                </tr>
                                                              <%
                                                                    }
                                                              %>
                                                            </table>
                                                              <%
                                                                
                                                                if(i==0){
                                                                	 %>
                                                                	   No Data Found
                                                                	 <%
                                                                }
                                                                }
									}
									catch(Exception e){
											System.out.println(e);
									}

                                                            %>
                                                          </div>
                                                        </div>
                                                    </div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<%=footr %>
						</span>

						
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../admin_tmplate/assets/js/jquery.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../admin_tmplate/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="../admin_tmplate/assets/js/bootstrap.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="../admin_tmplate/assets/js/excanvas.js"></script>
		<![endif]-->
		<script src="../admin_tmplate/assets/js/jquery-ui.custom.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.easypiechart.js"></script>
		<script src="../admin_tmplate/assets/js/jquery.sparkline.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.pie.js"></script>
		<script src="../admin_tmplate/assets/js/flot/jquery.flot.resize.js"></script>

		<!-- ace scripts -->
		<script src="../admin_tmplate/assets/js/ace/elements.scroller.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.colorpicker.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.fileinput.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.typeahead.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.wysiwyg.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.spinner.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.treeview.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.wizard.js"></script>
		<script src="../admin_tmplate/assets/js/ace/elements.aside.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.ajax-content.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.touch-drag.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.sidebar.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.sidebar-scroll-1.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.submenu-hover.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.widget-box.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings-rtl.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.settings-skin.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.widget-on-reload.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.searchbox-autocomplete.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html',
									 {
										tagValuesAttribute:'data-values',
										type: 'bar',
										barColor: barColor ,
										chartRangeMin:$(this).data('min') || 0
									 });
				});
			
			
			  //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
			  //but sometimes it brings up errors with normal resize event handlers
			  $.resize.throttleWindow = false;
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
			
			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			  //pie chart tooltip example
			  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
				/////////////////////////////////////
				$(document).one('ajaxloadstart.page', function(e) {
					$tooltip.remove();
				});
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').ace_scroll({
					size: 300
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {
						//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			
			
				//show the dropdowns on top or bottom depending on window height and menu position
				$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
					var offset = $(this).offset();
			
					var $w = $(window)
					if (offset.top > $w.scrollTop() + $w.innerHeight() - 100) 
						$(this).addClass('dropup');
					else $(this).removeClass('dropup');
				});
			
			})
		</script>

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="../admin_tmplate/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="../admin_tmplate/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '..'; </script>
		<script src="../admin_tmplate/assets/js/ace/elements.onpage-help.js"></script>
		<script src="../admin_tmplate/assets/js/ace/ace.onpage-help.js"></script>
		<script src="../admin_tmplate/docs/assets/js/rainbow.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/generic.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/html.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/css.js"></script>
		<script src="../admin_tmplate/docs/assets/js/language/javascript.js"></script>
	</body>
</html>
