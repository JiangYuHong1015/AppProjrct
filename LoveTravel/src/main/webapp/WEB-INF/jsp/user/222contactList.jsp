<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					常用联系人管理维护 <i class="fa fa-user"></i><small>${userSession.username }
						- 您可以通过搜索或者其他的筛选项对联系人信息进行修改、删除等管理操作。^_^</small>
				</h2>
				
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="contactList">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">联系人姓名</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="queryName" type="text" class="form-control col-md-7 col-xs-12" value="${queryName }">
							</div>
						</div>
					</li>
					
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">联系电话</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="queryPhone" type="text" class="form-control col-md-7 col-xs-12" value="${queryPhone }">
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
				</ul>
			</form>
		</div>
	</div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_content">
			<p class="text-muted font-13 m-b-30"></p>
			<div id="datatable-responsive_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-12">
					<a href="${pageContext.request.contextPath}/user/addContact" class="btn btn-success btn-sm">新增联系人</a>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">联系人姓名</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										联系电话</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										身份证号码</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										护照号码</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
									操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="contactInfo" items="${contactList }">
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">${contactInfo.contactName }</td>
										<td>${contactInfo.phone }</td>
										
									<c:choose>
										<c:when test="${contactInfo.idCard == null }">
											<td>未填写</td>
										</c:when>
										<c:otherwise><td>${contactInfo.idCard }</td></c:otherwise>
									</c:choose>
										
									<c:choose>
										<c:when test="${contactInfo.passport == null }">
											<td>未填写</td>
										</c:when>
										<c:otherwise><td>${contactInfo.passport }</td></c:otherwise>
									</c:choose>
									
										
										<td>
										<div class="btn-group">
                      <button type="button" class="btn btn-danger">点击操作</button>
                      <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                      
                       
                        <li><a  class="modifyContact" 
											contactinfoid="${contactInfo.id }"
											data-toggle="tooltip" data-placement="top" title="" data-original-title="修改联系人信息">修改</a></li>
						<li><a  class="deleteContact" contactinfoid="${contactInfo.id }" contactname="${contactInfo.contactName }" data-toggle="tooltip" data-placement="top" title="" data-original-title="删除联系人信息">删除</a></li>
                      </ul>
                      
                    					</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${pages.totalCount }条记录
							${pages.currentPageNo }/${pages.totalPageCount }页</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">
								<c:if test="${pages.currentPageNo > 1}">
									<li class="paginate_button previous"><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="0"
										tabindex="0">首页</a>
									</li>
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a>
									</li>
								</c:if>
								<c:if test="${pages.currentPageNo < pages.totalPageCount }">
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a>
									</li>
									<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
										aria-controls="datatable-responsive" data-dt-idx="7"
										tabindex="0">最后一页</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/contactList.js"></script>